<link rel="stylesheet" type="text/css" href="batch.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/batch.js"></script>
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

$sql = 'SELECT uid.data, uid.id FROM '.PREFIX.'user_info_data AS uid INNER JOIN '.PREFIX.'user_info_field AS uif ON uid.fieldid=uif.id WHERE uif.shortname="'.BATCHFIELDNAME.'" GROUP BY uid.data';

$result = mysql_query($sql);

echo '<div class="selector-main">';
    echo '<div class="selector-text">';
        echo 'Select Batch Number';
    echo '</div>';
    echo '<div class="selector-selector">';
        echo '<select id="batchselector">';
            echo '<option value="selectbatch">Select Batch No.</option>';
            while ($row = mysql_fetch_object($result)) {
                if($row->data != ''){
                    if($batchnoselected == $row->data) {
                        echo "<option value=\"$row->data\" selected=\"selected\">$row->data</option>";
                    }else{
                        echo "<option value=\"$row->data\" >$row->data</option>";
                    }
                }
            }
        echo '</select>';
    echo '</div>';    
echo '</div>';

$user_ids = array();

if($batchnoselected != '' && $batchnoselected != 'selectbatch'){
    $users = array();
    $sql = "SELECT u.id,u.username,u.firstname,u.lastname,u.email,u.city,u.country FROM ".PREFIX."user AS u INNER JOIN ".PREFIX.'user_info_data AS uid ON uid.userid=u.id INNER JOIN '.PREFIX.'user_info_field AS uif ON uif.id=uid.fieldid WHERE uid.data="'.$batchnoselected.'" AND uif.shortname="'.BATCHFIELDNAME.'"';
    $result = mysql_query($sql);
    while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) {
        $users[$row['id']] = $row;
        $user_ids[] = $row['id'];
    }
        //get_all_users_course_assigned($user_ids);die;
//    echo '<pre>';var_dump(get_all_profile_fields_with_display_order());
//    var_dump($users);
    echo "<div>";
        echo "<a href = \"report_csv.php?batchno=$batchnoselected\">Download as CSV </a>";
    echo "</div>";
    
    $fields = get_all_profile_fields_with_display_order();
    $attendance_result = get_attendance_header_content(get_all_users_course_assigned($user_ids));//var_dump($attendance_result);die;
    
    echo "<div class='table-container'>";
    echo "<table>";
        
        echo "<tr>";
            for($i=1;$i<=count($fields);$i++){
                echo "<th></th>";
            }
            if($attendance_result['head']){
            $previous_attandance = $attendance_result['head'][0]->attendanceid;
            $counter = 1;
            foreach($attendance_result['head'] as $headr){                
                if($previous_attandance == $headr->attendanceid){
                    echo "<th>";echo $days_number[date('D', $headr->sessdate)];echo "</th>";
                }else{
                    echo "<th></th>";echo "<th></th>";
                    echo "<th>";echo $days_number[date('D', $headr->sessdate)];echo "</th>";
                }                
                if($counter == count($attendance_result['head'])){
                    echo "<th></th>";echo "<th></th>";
                }
                $previous_attandance = $headr->attendanceid;
                $counter++;
            }
            }
            
        echo "</tr>";
        
        echo "<tr>";
            for($i=1;$i<=count($fields);$i++){
                echo "<th></th>";
            }
            if($attendance_result['head']){
            $previous_attandance = $attendance_result['head'][0]->attendanceid;
            $counter = 1;
            foreach($attendance_result['head'] as $headr){                
                if($previous_attandance == $headr->attendanceid){
                    echo "<th>";echo date('D', $headr->sessdate);echo "</th>";
                }else{
                    echo "<th></th>";echo "<th></th>";
                    echo "<th>";echo date('D', $headr->sessdate);echo "</th>";
                }                
                if($counter == count($attendance_result['head'])){
                    echo "<th></th>";echo "<th></th>";
                }
                $previous_attandance = $headr->attendanceid;
                $counter++;
            }
            }
            
        echo "</tr>";
        
        echo "<tr>";
            for($i=1;$i<=count($fields);$i++){
                echo "<th></th>";
            }
            if($attendance_result['head']){
            $previous_attandance = $attendance_result['head'][0]->attendanceid;
            $counter = 1;
            foreach($attendance_result['head'] as $headr){                
                if($previous_attandance == $headr->attendanceid){
                    echo "<th>";echo date('j-M-y', $headr->sessdate);echo "</th>";
                }else{
                    echo "<th></th>";echo "<th></th>";
                    echo "<th>";echo date('j-M-y', $headr->sessdate);echo "</th>";
                }                
                if($counter == count($attendance_result['head'])){
                    echo "<th></th>";echo "<th></th>";
                }
                $previous_attandance = $headr->attendanceid;
                $counter++;
            }
            }
            
        echo "</tr>";
        
        echo "<tr>";
            foreach($fields as $fk => $f){
                echo "<th>";
                    $fname = get_field_name($fields, $fk);
                    echo $fname; 
                echo "</th>";
            }
            
            if($attendance_result['head']){
            $previous_attandance = $attendance_result['head'][0]->attendanceid;
            $counter = 1;
            foreach($attendance_result['head'] as $headr){                
                if($previous_attandance == $headr->attendanceid){
                    echo "<th>";echo 'Days '.$counter;echo "</th>";
                }else{
                    echo "<th>Total Attendance</th>";echo "<th>Attendance (%)</th>";$counter = 1;
                    echo "<th>";echo 'Days '.$counter;echo "</th>";
                    $previous_attandance = $headr->attendanceid;
                    $counter++;
                    //continue;
                }     
                echo $counter;echo count($attendance_result['head']);
                if($counter == count($attendance_result['head'])){
                    echo "<th>Total Attendance</th>";echo "<th>Attendance (%)</th>";$counter = 1;
                }
                $previous_attandance = $headr->attendanceid;
                $counter++;
            }
            }
        
            
        echo "</tr>";
        foreach($users as $uk => $user){
            $sql = "SELECT * FROM ".PREFIX."user_info_data WHERE userid=".$user['id'];
            $result = mysql_query($sql);
            $user_fields = array();
            while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) {
                $user_fields[$row['fieldid']] = $row;
            }
            //var_dump($user_fields);die;
            echo "<tr>";
                foreach($fields as $fk => $f){
                    echo "<td>";
                        if($f['customfield'] == 1){
                            if(isset($user_fields[$f['id']]['data']) && $user_fields[$f['id']]['data'] != ''){
                                echo $user_fields[$f['id']]['data'];
                            }else{
                                echo '-';
                            }
                        }else{
                            if($fk == 'username'){
                                echo $user['firstname'].' '.$user['lastname'];
                            }else{
                                echo $user[$fk];
                            }
                        }
                    echo "</td>";
                }
                
                if($attendance_result['head']){
                $previous_attandance = $attendance_result['head'][0]->attendanceid;
                $counter = 1;$user_attendance = 0;$is_user_assigned = 0;$total_counter = 1;
                if(isset($attendance_result['content'][$user['id']])){
                    $is_user_assigned = 1;
                }
                foreach($attendance_result['head'] as $headr){                
                    if($previous_attandance == $headr->attendanceid){
                        echo "<td>";
                        if($is_user_assigned){
                            if($attendance_result['content'][$user['id']][$headr->attendanceid][$counter-1]->acronym == 'P'){
                                echo '1';$user_attendance++;
                            }
                        }
                        echo "</td>";
                    }else{
                        if($is_user_assigned){
                            echo "<td>";echo $user_attendance; echo"</td>";
                            echo "<td>";echo round(($user_attendance/$counter)*100,2).'%'; echo"</td>";
                            echo "<td>";
                            $user_attendance = 0;$counter = 1;
                            if($is_user_assigned){
                                if($attendance_result['content'][$user['id']][$headr->attendanceid][$counter-1]->acronym == 'P'){
                                    echo '1';$user_attendance++;
                                }
                            }
                            echo "</td>";
                        }else{
                            echo "<td></td>";echo "<td></td>";
                            $user_attendance = 0;$counter = 1;
                        }
                        //continue;
                    }                
                    if($total_counter == count($attendance_result['head'])){
                        if($is_user_assigned){
                            echo "<td>";echo $user_attendance; echo"</td>";
                            echo "<td>";echo round(($user_attendance/$counter)*100,2).'%'; echo"</td>";
                        }else{
                            echo "<td></td>";echo "<td></td>";
                        }
                        $user_attendance = 0;$counter = 1;//continue;
                    }
                    $previous_attandance = $headr->attendanceid;
                    $counter++;$total_counter++;
                }
                }
                
            echo "</tr>";
        }
    echo "</table>";
    echo "</div>";
}