<?php
require_once('config.php');
require_once('lib.php');

define('BATCHFIELDNAME','batchno');
$days_number = array('MON'=>2,'Tue'=>3,'Wed'=>4,'Thu'=>5,'Fri'=>6,'Sat'=>7,'Sun'=>1);

if(isset($_GET['batchno'])){
    $batchnoselected = $_GET['batchno'];
}else{
    $batchnoselected = '';
}

header("Content-type:text/octect-stream");
header("Content-Disposition:attachment;filename=Report.xls");

$users = array();
$user_ids = array();

$sql = "SELECT u.id,u.username,u.firstname,u.lastname,u.email,u.city,u.country FROM ".PREFIX."user AS u INNER JOIN ".PREFIX.'user_info_data AS uid ON uid.userid=u.id INNER JOIN '.PREFIX.'user_info_field AS uif ON uif.id=uid.fieldid WHERE uid.data="'.$batchnoselected.'" AND uif.shortname="'.BATCHFIELDNAME.'"';
$result = mysql_query($sql);
while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) {
    $users[$row['id']] = $row;
    $user_ids[] = $row['id'];
}

$fields = get_all_profile_fields_with_display_order();
$attendance_result = get_attendance_header_content(get_all_users_course_assigned($user_ids));

$header = array();

print '<table border="1">';


        print "<tr>";
            for($i=1;$i<=count($fields);$i++){
                print "<td></td>";
            }
            if($attendance_result['head']){
            $previous_attandance = $attendance_result['head'][0]->attendanceid;
            $counter = 1;
            foreach($attendance_result['head'] as $headr){                
                if($previous_attandance == $headr->attendanceid){
                    print "<td>";print $days_number[date('D', $headr->sessdate)];print "</td>";
                }else{
                    print "<td></td>";print "<td></td>";
                    print "<td>";print $days_number[date('D', $headr->sessdate)];print "</td>";
                }                
                if($counter == count($attendance_result['head'])){
                    print "<td></td>";print "<td></td>";
                }
                $previous_attandance = $headr->attendanceid;
                $counter++;
            }
            }
            
        print "</tr>";
        
        print "<tr>";
            for($i=1;$i<=count($fields);$i++){
                print "<td></td>";
            }
            if($attendance_result['head']){
            $previous_attandance = $attendance_result['head'][0]->attendanceid;
            $counter = 1;
            foreach($attendance_result['head'] as $headr){                
                if($previous_attandance == $headr->attendanceid){
                    print "<td>";print date('D', $headr->sessdate);print "</td>";
                }else{
                    print "<td></td>";print "<td></td>";
                    print "<td>";print date('D', $headr->sessdate);print "</td>";
                }                
                if($counter == count($attendance_result['head'])){
                    print "<td></td>";print "<td></td>";
                }
                $previous_attandance = $headr->attendanceid;
                $counter++;
            }
            }
            
        print "</tr>";
        
        
        print "<tr>";
            for($i=1;$i<=count($fields);$i++){
                print "<td></td>";
            }
            if($attendance_result['head']){
            $previous_attandance = $attendance_result['head'][0]->attendanceid;
            $counter = 1;
            foreach($attendance_result['head'] as $headr){                
                if($previous_attandance == $headr->attendanceid){
                    print "<td>";print date('j-M-y', $headr->sessdate);print "</td>";
                }else{
                    print "<td></td>";print "<td></td>";
                    print "<td>";print date('j-M-y', $headr->sessdate);print "</td>";
                }                
                if($counter == count($attendance_result['head'])){
                    print "<td></td>";print "<td></td>";
                }
                $previous_attandance = $headr->attendanceid;
                $counter++;
            }
            }
            
        print "</tr>";


print '<tr style="background-color: #822433;color: #FFFFFF;font-weight: bold;">';

foreach($fields as $fk => $f){
        $fname = get_field_name($fields, $fk);
        $header[] = $fname;
        print '<td width="100%">'. $fname.'</td>';
}
    
        if($attendance_result['head']){
            $previous_attandance = $attendance_result['head'][0]->attendanceid;
            $counter = 1;$total_counter = 1;
            foreach($attendance_result['head'] as $headr){                
                if($previous_attandance == $headr->attendanceid){
                    print "<td width='100%'>";print 'Days '.$counter;print "</td>";
                }else{
                    print "<td width='100%'>Total Attendance</td>";print "<td width='100%'>Attendance (%)</td>";$counter = 1;
                    print "<td width='100%'>";print 'Days '.$counter;print "</td>";
                    $previous_attandance = $headr->attendanceid;
                    //$counter++;
                    //continue;
                }
                if($total_counter == count($attendance_result['head'])){
                    print "<td width='100%'>Total Attendance</td>";print "<td width='100%'>Attendance (%)</td>";$counter = 1;
                }
                $previous_attandance = $headr->attendanceid;
                $counter++;$total_counter++;
            }
        }

print '</tr>';


foreach($users as $uk => $user){
    $sql = "SELECT * FROM ".PREFIX."user_info_data WHERE userid=".$user['id'];
    $result = mysql_query($sql);
    $user_fields = array();
    while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) {
        $user_fields[$row['fieldid']] = $row;
    }
    print "<tr>";
        foreach($fields as $fk => $f){
            print '<td width="100%">';
                if($f['customfield'] == 1){
                    if(isset($user_fields[$f['id']]['data']) && $user_fields[$f['id']]['data'] != ''){
                        print $user_fields[$f['id']]['data'];
                    }else{
                        print '-';
                    }
                }else{
                    if($fk == 'username'){
                        print $user['firstname'].' '.$user['lastname'];
                    }else{
                        print $user[$fk];
                    }
                }
            print "</td>";
        }
        
        if($attendance_result['head']){
                $previous_attandance = $attendance_result['head'][0]->attendanceid;
                $counter = 1;$user_attendance = 0;$is_user_assigned = 0;$total_counter = 1;
                /*if(isset($attendance_result['content'][$user['id']])){
                    $is_user_assigned = 1;
                }*/
                foreach($attendance_result['head'] as $headr){
                    $user_courses = get_all_users_course_assigned(array($user['id']));
                    if(in_array($headr->course, $user_courses)){
                        $is_user_assigned = 1;
                    }
                    if($previous_attandance == $headr->attendanceid){
                        print "<td>";
                        if($is_user_assigned){
                            if($attendance_result['content'][$user['id']][$headr->attendanceid][$counter-1]->acronym == 'P'){
                                print '1';$user_attendance++;
                            }
                        }
                        print "</td>";
                    }else{
                        if($is_user_assigned){
                            print "<td>";print $user_attendance; print"</td>";
                            print "<td>";print round(($user_attendance/$counter)*100,2).'%'; print"</td>";
                            print "<td>";
                            $user_attendance = 0;$counter = 1;
                            if($is_user_assigned){
                                if($attendance_result['content'][$user['id']][$headr->attendanceid][$counter-1]->acronym == 'P'){
                                    print '1';$user_attendance++;
                                }
                            }
                            print "</td>";
                        }else{
                            print "<td></td>";print "<td></td>";print "<td></td>";
                            $user_attendance = 0;$counter = 1;
                        }
                        //continue;
                    }                
                    if($total_counter == count($attendance_result['head'])){
                        if($is_user_assigned){
                            print "<td>";print $user_attendance; print"</td>";
                            print "<td>";print round(($user_attendance/$counter)*100,2).'%'; print"</td>";
                        }else{
                            print "<td></td>";print "<td></td>";
                        }
                        $user_attendance = 0;$counter = 1;//continue;
                    }
                    $previous_attandance = $headr->attendanceid;
                    $counter++;$total_counter++;
                }
          }
        
    print "</tr>";
}

print '</table>';
exit;
        