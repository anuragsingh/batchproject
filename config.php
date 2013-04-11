<?php

define('PREFIX','mdl_');

$hostname = 'localhost';
$username = 'root';
$password = '';
$databasename = 'testing1';

$link = mysql_connect($hostname, $username, $password);
if (!$link) {
    die('Could not connect: ' . mysql_error());
}

$db_selected = mysql_select_db($databasename, $link);
if (!$db_selected) {
    die ("Can\'t use databasename : " . mysql_error());
}
