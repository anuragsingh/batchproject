<?php

require_once('config.php');
define('COURSE_CONTEXT',50);

function get_all_profile_fields_with_display_order(){
    //$fields_order = array('batchno','batchidno','username','posting','Caste','religion','contact','father','permanent','district','state','pincode');
    $fields_order = array();
    $sql = 'SELECT uif.shortname FROM '.PREFIX.'user_info_field AS uif ORDER BY uif.sortorder';
    $result = mysql_query($sql);
    while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) {
        $fields_order[] = $row['shortname'];
    }
    for($i=count($fields_order)-1;$i>=0;$i--){
        if($i == 2){
            $fields_order[2]='username';
            break;
        }else{
            $fields_order[$i+1]=$fields_order[$i];
        }
    }
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
        default : return strip_tags($f[$k]['name']); 
    }
}


function get_all_users_course_assigned($users){
    $courses = array();
    
    if($users){
        $sql = "SELECT e.courseid FROM ".PREFIX."enrol AS e INNER JOIN ".PREFIX."user_enrolments AS ue ON ue.enrolid=e.id 
INNER JOIN ".PREFIX."context AS c ON c.instanceid=e.courseid
INNER JOIN ".PREFIX."role_assignments AS ra ON ra.contextid=c.id
INNER JOIN ".PREFIX."role AS r ON r.id=ra.roleid
WHERE r.shortname='student' AND c.contextlevel=".COURSE_CONTEXT." AND ue.userid IN ( ".implode(',',$users)." ) GROUP BY e.courseid";
        
        $result = mysql_query($sql);
        while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) {            
            $courses[] = $row['courseid'];
        }
    }
    
    return $courses;
}


function get_attendance_header_content($courses){
    
    $result_return = array();
    
    $result_return['head'] = array();
    $result_return['content'] = array();
    
    if($courses) {
    
    $sql = "SELECT mal.studentid, mal.statusid, mast.grade, mas.sessdate,mas.attendanceid, ma.course, mas.lasttaken 
FROM mdl_attendance_log AS mal INNER JOIN mdl_attendance_sessions AS mas ON mas.id = mal.sessionid 
INNER JOIN mdl_attendance_statuses AS mast ON mast.id = mal.statusid 
INNER JOIN mdl_attforblock AS ma ON ma.id = mas.attendanceid 
WHERE ma.course IN ( ".implode(',',$courses)." )  
GROUP BY mas.sessdate,mas.attendanceid 
ORDER BY mas.attendanceid ASC, mas.sessdate ASC";
    
    $result = mysql_query($sql);
    while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) {
        
        $record = new stdClass();
        $record->sessdate = $row['sessdate'];
        $record->attendanceid = $row['attendanceid'];
        $record->course = $row['course'];
        
        $result_return['head'][] = $record;
    }
    
    
    $sql = "SELECT mal.studentid, mal.statusid, mast.grade, mast.acronym, mas.sessdate,mas.attendanceid, ma.course, mas.lasttaken 
FROM mdl_attendance_log AS mal INNER JOIN mdl_attendance_sessions AS mas ON mas.id = mal.sessionid 
INNER JOIN mdl_attendance_statuses AS mast ON mast.id = mal.statusid 
INNER JOIN mdl_attforblock AS ma ON ma.id = mas.attendanceid 
WHERE ma.course IN ( ".implode(',',$courses)." ) 
ORDER BY mas.attendanceid ASC, mas.sessdate ASC";
    
    $result = mysql_query($sql);
    while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) {
        
        $record = new stdClass();
        $record->studentid = $row['studentid'];
        $record->statusid = $row['statusid'];
        $record->grade = $row['grade'];
        $record->acronym = $row['acronym'];
        $record->sessdate = $row['sessdate'];
        $record->attendanceid = $row['attendanceid'];
        $record->course = $row['course'];
        $record->lasttaken = $row['lasttaken'];
        
        if(!isset($result_return['content'][$record->studentid])){
            $result_return['content'][$record->studentid] = array();
        }
        
        if(!isset($result_return['content'][$record->studentid][$record->attendanceid])){
            $result_return['content'][$record->studentid][$record->attendanceid] = array();
        }
        
        $result_return['content'][$record->studentid][$record->attendanceid][] = $record;
        
    }
        
    }
    
    return $result_return;
}