<?php
//////////////     made by alq0rsan   /////////////////////////

    $MyGold = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE `username`='".$session->username."'") or die(mysql_error());
    $golds = mysql_fetch_array($MyGold);

    $MyId = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE `username`='".$session->username."'") or die(mysql_error());
    $uuid = mysql_fetch_array($MyId);


    $MyVilId = mysql_query("SELECT * FROM ".TB_PREFIX."bdata WHERE `wid`='".$village->wid."'") or die(mysql_error());
    $uuVilid = mysql_fetch_array($MyVilId);


    $goldlog = mysql_query("SELECT * FROM ".TB_PREFIX."gold_fin_log") or die(mysql_error());

        $today = date("mdHi");

if (mysql_num_rows($MyGold)) {
	if($golds['6'] > 2) {

if (mysql_num_rows($MyGold)) {


if($golds['12'] == 0) {
mysql_query("UPDATE ".TB_PREFIX."users set plus = ('".mktime(date("H"),date("i"), date("s"),date("m") , date("d"), date("Y"))."')+".PLUS_TIME." where `username`='".$session->username."'") or die(mysql_error());
} else {
mysql_query("UPDATE ".TB_PREFIX."users set plus = '".($golds['12']+PLUS_TIME)."' where `username`='".$session->username."'") or die(mysql_error());
}


$done1 = "&nbsp;&nbsp;Plus Account";
    mysql_query("UPDATE ".TB_PREFIX."users set gold = ".($session->gold-10)." where `username`='".$session->username."'") or die(mysql_error());
    mysql_query("INSERT INTO ".TB_PREFIX."gold_fin_log VALUES ('".(mysql_num_rows($goldlog)+1)."', '".$village->wid."', 'Plus Account')") or die(mysql_error());

} else {
$done1 = "nothing has been done";
    mysql_query("INSERT INTO ".TB_PREFIX."gold_fin_log VALUES ('".(mysql_num_rows($goldlog)+1)."', '".$village->wid."', 'Failed Plus Account')") or die(mysql_error());

}
} else {
		$done1 = "&nbsp;&nbsp;You need more gold";
}
}


print "<BR><BR><BR><BR>";

echo $done1;

print "<BR>";

include("Templates/Plus/3.tpl");

 ?>