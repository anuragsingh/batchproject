<link rel="stylesheet" type="text/css" href="batch.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/batch.js"></script>
<?php

require_once('config.php');
require_once('lib.php');

define('BATCHFIELDNAME','batchno');

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

if($batchnoselected != '' && $batchnoselected != 'selectbatch'){
    $users = array();
    $sql = "SELECT u.id,u.username,u.firstname,u.lastname,u.email,u.city,u.country FROM ".PREFIX."user AS u INNER JOIN ".PREFIX.'user_info_data AS uid ON uid.userid=u.id INNER JOIN '.PREFIX.'user_info_field AS uif ON uif.id=uid.fieldid WHERE uid.data="'.$batchnoselected.'" AND uif.shortname="'.BATCHFIELDNAME.'"';
    $result = mysql_query($sql);
    while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) {
        $users[$row['id']] = $row;
    }
        
//    echo '<pre>';var_dump(get_all_profile_fields_with_display_order());
//    var_dump($users);
    echo "<div>";
        echo "<a href = \"report_csv.php?batchno=$batchnoselected\">Download as CSV </a>";
    echo "</div>";
    
    $fields = get_all_profile_fields_with_display_order();
    echo "<div class='table-container'>";
    echo "<table>";
        echo "<tr>";
            foreach($fields as $fk => $f){
                echo "<th>";
                    $fname = get_field_name($fields, $fk);
                    echo $fname; 
                echo "</th>";
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
            echo "</tr>";
        }
    echo "</table>";
    echo "</div>";
}