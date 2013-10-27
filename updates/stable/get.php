<?php

function mergeJson($root, $translated) {
    foreach($root as $i => $k){
        $buildNumber = $k["buildNumber"];
        $translationAvailable[$buildNumber] = 0;
        $out[$buildNumber] = $k;
    }
    foreach($translated as $i => $k){
        $buildNumber = $k["buildNumber"];
        if(array_key_exists($buildNumber, $translationAvailable)){
            $translationAvailable[$buildNumber] = 1;
            $out[$buildNumber] = $k;
        }
    }
    $output = array();
    foreach($out as $i => $k){
        array_push($output, $k);
    }
    return $output;
}

header("Content-Type: text/plain; charset=UTF-8");

$lang = $_GET['lang'];
if(file_exists($lang.".json")){
    $file = $lang.".json";
    
    $translated = json_decode(file_get_contents($file), true);
    $root = json_decode(file_get_contents("en.json"), true);
    
    $out = mergeJson($root, $translated);
    echo json_encode($out, JSON_PRETTY_PRINT);
}
else{
    $file = "en.json";
    echo file_get_contents($file);
}
?>