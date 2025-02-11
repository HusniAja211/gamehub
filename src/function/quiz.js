function ambilNamaPlayer(){
    window.onload = function() {
        // Ambil nama pemain dari localStorage
        var playerName = localStorage.getItem('playerName');
        
        if (playerName) {
            // Tampilkan nama pemain di halaman quiz
            document.getElementById('player-display').textContent = playerName;
        } else {
            alert("Nama pemain tidak ditemukan! Kembali ke halaman utama.");
            window.location.href = 'index.html'; // Redirect ke halaman utama jika tidak ada data
        }
    };
}