<?php

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $original = $_POST['password'];
    $hashDigest = password_hash($original, PASSWORD_DEFAULT);
    
    echo "<h1>Password Hash Generator</h1>";
    echo "<p>Original: " . htmlspecialchars($original) . "</p>";
    echo "<p>Hash Digest: " . htmlspecialchars($hashDigest) . "</p>";
} else {
    echo "Invalid request method.";
}

?>
