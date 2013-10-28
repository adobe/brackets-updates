<?php

function mergeJson($root, $translated, $checkForTranslations = 0) {
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
    if($checkForTranslations){
        return $translationAvailable;
    }
    return $output;
}

header("Content-Type: text/plain; charset=UTF-8");

$lang = $_GET['lang'];
if(isset($_GET['original'])){
    $file = $lang.".json";
    echo file_get_contents($file);
}
else if(file_exists($lang.".json")){
    $file = $lang.".json";
    
    $translated = json_decode(file_get_contents($file), true);
    $root = json_decode(file_get_contents("en.json"), true);
    
    $out = mergeJson($root, $translated, isset($_GET['check_for_translations']));
    if(isset($_GET['check_for_translations'])){
        foreach($out as $i => $k){
            echo $k ? "Translation for ".$i." available." : "Translation for ".$i." not available!";
            echo "\n";
        }
    }
    else{
        $out = json_encode($out, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
        $out = str_replace("\/", "/", $out);
        echo $out;
    }
}
else{
    $file = "en.json";
    echo file_get_contents($file);
}
?>
