<?php  

$base = "SGD";
$symbols = "MYR";

$url = "http://api.fixer.io/latest?symbols=" . $symbols . "&base=" . $base;

$response = file_get_contents($url);

$data = json_decode($response);

print_r($data);

?>