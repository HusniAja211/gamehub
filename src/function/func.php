<?php

// function/func.php

function getGame($conn, $limit, $offset) {
    // Query dengan JOIN untuk mengambil data dari tabel game dan tim_developer
    $query = "SELECT game.id_game, game.nama_game, game.gambar_game, game.tautan, game.deskripsi, tim_developer.nama_anggota
              FROM game
              JOIN tim_developer ON game.fid_timDeveloper = tim_developer.id_tim
              LIMIT ? OFFSET ?";

    // Persiapkan statement
    $stmt = $conn->prepare($query);
    if (!$stmt) {
        die("Query failed: " . $conn->error);
    }

    // Bind parameter LIMIT dan OFFSET
    $stmt->bind_param('ii', $limit, $offset);

    // Eksekusi query
    $stmt->execute();

    // Bind hasil query
    $stmt->bind_result($id_game, $nama_game, $gambar_game, $tautan, $deskripsi, $nama_anggota);

    // Tentukan path untuk gambar
    $path = "../../public/img/game/";
    $games = [];

    // Ambil hasil query dan masukkan ke dalam array
    while ($stmt->fetch()) {
        $games[] = [
            'id_game' => $id_game,
            'nama_game' => $nama_game,
            'gambar_game' => $path . $gambar_game, // Menambahkan path ke gambar
            'tautan' => $tautan,
            'deskripsi' => $deskripsi,
            'nama_anggota' => $nama_anggota
        ];
    }

    // Tutup statement
    $stmt->close();

    return $games;
}

function getTotalGames($conn) {
    // Query untuk menghitung total game
    $query = "SELECT COUNT(*) AS total FROM game";
    $result = mysqli_query($conn, $query);
    $totalRow = mysqli_fetch_assoc($result);
    return $totalRow['total'];
}

function getDev($conn) {
    $stmt = $conn->prepare("SELECT id_developer, nama_developer, instagram, linkedin, github, deskripsi, gambar_developer FROM developer");

    if (!$stmt) {
        die("Query gagal: " . $conn->error);
    }

    $stmt->execute();
    $result = $stmt->get_result();

    $path = "../../public/img/developer/";
    $devs = [];

    while ($row = $result->fetch_assoc()) {
        $row['gambar_developer'] = $path . $row['gambar_developer'];
        $devs[] = $row;
    }

    $stmt->close();
    
    return $devs; // **Tambahkan return agar tidak NULL**
}

function getGalery($conn) {
    $stmt = $conn->prepare("SELECT id_galery, nama_galery FROM galery");

    if (!$stmt) {
        die("Query gagal: " . $conn->error);
    }

    $stmt->execute();
    $result = $stmt->get_result();

    $path = "../../public/img/galery/";
    $devs = [];

    while ($row = $result->fetch_assoc()) {
        $row['nama_galery'] = $path . $row['nama_galery'];
        $devs[] = $row;
    }

    $stmt->close();
    
    return $devs; // **Tambahkan return agar tidak NULL**
}

function getGamePaginated($conn, $limit, $offset) {
    $query = "SELECT * FROM game LIMIT ? OFFSET ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("ii", $limit, $offset);
    $stmt->execute();
    $result = $stmt->get_result();

    $games = [];
    while ($row = $result->fetch_assoc()) {
        $games[] = $row;
    }

    return $games;
}

//Untuk Game
function insertGambarGame($conn, $nama_game){
    if (!isset($_FILES['gambar_game']) || $_FILES['gambar_game']['error'] !== UPLOAD_ERR_OK) {
        return null;
    }
    
    $namaFile = preg_replace("/[^a-zA-Z0-9]/", "_", strtolower($nama_game)); 
    $fileExt = strtolower(pathinfo($_FILES["gambar_game"]["name"], PATHINFO_EXTENSION));
    $fileName = $namaFile . "." . $fileExt;
    $targetDir = "../../public/img/game/";
    $targetFile = $targetDir . $fileName;
    
    if (!file_exists($targetDir)) {
        mkdir($targetDir, 0777, true);
    }
    
    $allowedTypes = ["jpg", "jpeg", "png", "gif"];
    if (!in_array($fileExt, $allowedTypes) || $_FILES["gambar_game"]["size"] > 10 * 1024 * 1024 || getimagesize($_FILES["gambar_game"]["tmp_name"]) === false) {
        return null;
    }
    
    if (!move_uploaded_file($_FILES["gambar_game"]["tmp_name"], $targetFile)) {
        return null;
    }
    
    return $fileName; // Kembalikan nama file, bukan ID
}

function insertGambarDev($conn, $nama){
    if (!isset($_FILES['gambar_developer']) || $_FILES['gambar_developer']['error'] !== UPLOAD_ERR_OK) {
        return null;
    }
    
    $namaFile = preg_replace("/[^a-zA-Z0-9]/", "_", strtolower($nama)); 
    $fileExt = strtolower(pathinfo($_FILES["gambar_developer"]["name"], PATHINFO_EXTENSION));
    $fileName = $namaFile . "." . $fileExt;
    $targetDir = "../../public/img/developer/";
    $targetFile = $targetDir . $fileName;
    
    if (!file_exists($targetDir)) {
        mkdir($targetDir, 0777, true);
    }
    
    $allowedTypes = ["jpg", "jpeg", "png", "gif"];
    if (!in_array($fileExt, $allowedTypes) || $_FILES["gambar_developer"]["size"] > 10 * 1024 * 1024 || getimagesize($_FILES["gambar_developer"]["tmp_name"]) === false) {
        return null;
    }
    
    if (!move_uploaded_file($_FILES["gambar_developer"]["tmp_name"], $targetFile)) {
        return null;
    }
    
    return $fileName; // Kembalikan nama file, bukan ID


}

  function insertGambarGalery($conn, $nama){
    if (!isset($_FILES['gambar_galery']) || $_FILES['gambar_galery']['error'] !== UPLOAD_ERR_OK) {
        return null;
    }
    
    $namaFile = preg_replace("/[^a-zA-Z0-9]/", "_", strtolower($nama)); 
    $fileExt = strtolower(pathinfo($_FILES["gambar_galery"]["name"], PATHINFO_EXTENSION));
    $fileName = $namaFile . "." . $fileExt;
    $targetDir = "../../public/img/galery/";
    $targetFile = $targetDir . $fileName;
    
    if (!file_exists($targetDir)) {
        mkdir($targetDir, 0777, true);
    }
    
    $allowedTypes = ["jpg", "jpeg", "png", "gif"];
    if (!in_array($fileExt, $allowedTypes) || $_FILES["gambar_galery"]["size"] > 10 * 1024 * 1024 || getimagesize($_FILES["gambar_galery"]["tmp_name"]) === false) {
        return null;
    }
    
    if (!move_uploaded_file($_FILES["gambar_galery"]["tmp_name"], $targetFile)) {
        return null;
    }
    
    return $fileName; // Kembalikan nama file, bukan ID
}

function getGameBasicDetailsById($conn, $id_game) {
    $stmt = $conn->prepare("
        SELECT 
            g.nama_game, 
            g.gambar_game, 
            g.tautan, 
            g.deskripsi, 
            td.nama_anggota 
        FROM game g
        INNER JOIN tim_developer td ON g.fid_timDeveloper = td.id_tim
        WHERE g.id_game = ?
    ");
    $stmt->bind_param("i", $id_game);
    $stmt->execute();
    $result = $stmt->get_result();
    $game = $result->fetch_assoc(); // Mengambil data sebagai array asosiatif

    // Tambahkan path untuk gambar game
    $game['gambar_path'] = !empty($game['gambar_game']) ? "../../public/img/game/" . $game['gambar_game'] : null;

    return $game;
}

