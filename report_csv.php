<?php
require_once('config.php');
require_once('lib.php');

define('BATCHFIELDNAME','batchno');

if(isset($_GET['batchno'])){
    $batchnoselected = $_GET['batchno'];
}else{
    $batchnoselected = '';
}

header("Content-type:text/octect-stream");
header("Content-Disposition:attachment;filename=Report.xls");

$users = array();
$sql = "SELECT u.id,u.username,u.firstname,u.lastname,u.email,u.city,u.country FROM ".PREFIX."user AS u INNER JOIN ".PREFIX.'user_info_data AS uid ON uid.userid=u.id INNER JOIN '.PREFIX.'user_info_field AS uif ON uif.id=uid.fieldid WHERE uid.data="'.$batchnoselected.'" AND uif.shortname="'.BATCHFIELDNAME.'"';
$result = mysql_query($sql);
while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) {
    $users[$row['id']] = $row;
}

$fields = get_all_profile_fields_with_display_order();

$header = array();

print '<table border="1">';
print '<tr style="background-color: #822433;color: #FFFFFF;font-weight: bold;">';

foreach($fields as $fk => $f){
        $fname = get_field_name($fields, $fk);
        $header[] = $fname;
        print '<td width="100%">'. $fname.'</td>';
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
    print "</tr>";
}

print '</table>';
exit;
        