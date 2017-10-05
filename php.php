<?php
    $base   = 'SGD';
    $symbol = 'MYR';
    $output = 'SGD1';
    
    $url = "http://api.fixer.io/latest?symbols=$symbol&base=$base";
    
    $data   = file_get_contents($url); // put the contents of the file into a variable
    
    $jsonArray = json_decode($data,true); // convert json to Array

    echo $output.' = '.$symbol.$jsonArray['rates'][$symbol];
    
  ?>