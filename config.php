<?php
date_default_timezone_set('UTC');

define('CAPTURE_DIR', 'captured_images/');
define('LOCATION_DIR', 'saved_locations/');


if (!is_dir(CAPTURE_DIR)) mkdir(CAPTURE_DIR, 0755, true);
if (!is_dir(LOCATION_DIR)) mkdir(LOCATION_DIR, 0755, true);

function logData($type, $data) {
    $logFile = $type . '_log.txt';
    $timestamp = date('Y-m-d H:i:s');
    file_put_contents($logFile, "[$timestamp] $data\n", FILE_APPEND);
}
?>
