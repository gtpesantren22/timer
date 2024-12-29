
const WebSocket = require('ws');
const express = require('express');
const http = require('http');
const path = require('path');

const app = express();
const server = http.createServer(app);
const wss = new WebSocket.Server({ server });

let startTime = null;
let interval = null;
let elapsedTime = 0; 

// Fungsi untuk mengirimkan waktu ke semua klien
function broadcastTimer() {
    const currentTime = Date.now();
    const elapsedTime = Math.floor((Date.now() - startTime) / 1000);
    const minutes = Math.floor(elapsedTime / 60);
    const seconds = elapsedTime % 60;
    const timerData = JSON.stringify({
        action: 'updateTimer',
        minutes: minutes,
        seconds: seconds
    });

    wss.clients.forEach(client => {
        if (client.readyState === WebSocket.OPEN) {
            client.send(timerData);
        }
    });
}

// Event WebSocket
wss.on('connection', (ws) => {
    console.log('New client connected');

    ws.on('message', (message) => {
        const data = JSON.parse(message);

        if (data.action === 'startTimer' && !interval) {
            // Jika timer dimulai, set startTime dan lanjutkan dari waktu yang berlalu
            if (!startTime) {
                startTime = Date.now(); // Inisialisasi startTime hanya sekali
            } else {
                startTime = Date.now() - elapsedTime * 1000; // Lanjutkan dari waktu yang sudah berlalu
            }
            interval = setInterval(broadcastTimer, 1000); // Memulai interval untuk broadcast setiap detik
        } else if (data.action === 'stopTimer' && interval) {
            // Saat timer dihentikan, simpan waktu yang telah berlalu
            const currentTime = Date.now();
            elapsedTime = Math.floor((currentTime - startTime) / 1000); // Simpan waktu yang sudah berlalu
            clearInterval(interval); // Hentikan interval
            interval = null; // Reset interval
        } else if (data.action === 'resetTimer') {
            startTime = null;
            if (interval) {
                clearInterval(interval);
                interval = null;
            }
            // Kirim pesan reset ke semua klien
            const resetData = JSON.stringify({
                action: 'resetTimer',
            });
            wss.clients.forEach((client) => {
                if (client.readyState === WebSocket.OPEN) {
                    client.send(resetData);
                }
            });
        } else if (data.action === 'reloadPage') {
            const reloadData = JSON.stringify({
                action: 'reloadPage'
            });
            wss.clients.forEach((client) => {
                if (client.readyState === WebSocket.OPEN) {
                    client.send(reloadData);
                }
            });
        }
    });

    ws.on('close', () => {
        console.log('Client disconnected');
    });
});


// Sajikan file HTML untuk klien
app.use(express.static(path.join(__dirname, 'public')));

// Endpoint utama
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'client.html'));
});

const PORT = 8081;
server.listen(PORT, '0.0.0.0', () => {
    console.log(`Server is running on ws://192.168.1.5:${PORT}`);
});
