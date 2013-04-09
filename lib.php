<?php

require_once('config.php');

function get_all_profile_fields_with_display_order(){
    $fields_order = array('batchno','batchidno','username','posting','Caste','religion','contact','father','permanent','district','state','pincode');
    $fields_display = array();
    $fields_display1 = array();
    $sql = 'SELECT uif.id, uif.shortname, uif.name, uif.description  FROM '.PREFIX.'user_info_field AS uif';
    $result = mysql_query($sql);
    while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) {
        $fields_display1[$row['shortname']] = $row;
    }
    foreach($fields_order as $fo){
        if(key_exists($fo, $fields_display1)){
            $fields_display1[$fo]['customfield'] = 1;
            $fields_display[$fo] = $fields_display1[$fo];
        }else{
            $x = array();
            $x[$fo] = $fo;
            $x['customfield'] = 0;
            $fields_display[$fo] = $x;
        }
    }
    
    return $fields_display;
}

function get_field_name($f,$k){
        
    switch ($k){
        case 'username': return "NURSE'S NAME";
        default : return strip_tags($f[$k]['description']); 
    }
}