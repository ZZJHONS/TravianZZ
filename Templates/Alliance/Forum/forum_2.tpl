<?php
//////////////// made by TTMTT ////////////////

$displayarray = $database->getUserArray($session->uid,1);
$forumcat = $database->ForumCat(htmlspecialchars($displayarray['alliance']));
?>
<table cellpadding="1" cellspacing="1" id="alliance"><thead>
		<tr>
	        <th colspan="4">Alliance Forum</th>
		</tr>

		<tr>
			<td></td>
			<td>Forum name</td>
			<td>&nbsp;Threads&nbsp;</td>
			<td>&nbsp;Last post&nbsp;</td>
		</tr></thead><tbody>
<?php
foreach($forumcat as $arr) {
	$countop = $database->CountCat($arr['id']);
	$ltopic = $database->LastTopic($arr['id']);
	foreach($ltopic as $las) {
	}
	$lpos = $database->LastPost($las['id']);
	foreach($lpos as $pos) {
	}
	if($database->CheckLastTopic($arr['id'])){
		if($database->CheckLastPost($las['id'])){
			$lpost = date('m/d/y H:i a',$pos['date']);
			$owner = $database->getUserArray($pos['owner'],1);
		}else{
			$lpost = date('m/d/y H:i a',$las[date]);
			$owner = $database->getUserArray($las['owner'],1);
		}
	}else{
		$lpost = "";
		$owner = "";
	}
echo	'<tr><td class="ico">';
if($database->CheckEditRes($aid)=="1"){
	echo '<a class="up_arr" href="allianz.php?s=2&fid='.$arr['id'].'&bid=0&admin=pos&res=-1" title="To top"><img src="img/x.gif" alt="To top" /></a><a class="edit" href="allianz.php?s=2&idf='.$arr['id'].'&admin=editforum" title="edit"><img src="img/x.gif" alt="edit" /></a><br /><a class="down_arr" href="allianz.php?s=2&fid='.$arr['id'].'&bid=0&admin=pos&res=1" title="To bottom"><img src="img/x.gif" alt="To bottom" /></a><a class="fdel" href="allianz.php?s=2&idf='.$arr['id'].'&admin=delforum" onClick="return confirm(\'confirm delete?\');" title="delete"><img src="img/x.gif" alt="delete" /></a>';
}else{
	echo '<img class="folder" src="img/x.gif" title="Thread without new posts" alt="Thread without new posts">';
}		
echo '</td><td class="tit"><a href="allianz.php?s=2&fid='.$arr['id'].'&pid='.$aid.'" title="'.$arr['forum_name'].'">'.$arr['forum_name'].'</a><br />'.$arr['forum_des'].'</td>
			<td class="cou">'.$countop.'</td>
			<td class="last">'.$lpost.'</span><span><br /><a href="spieler.php?uid='.$owner['id'].'">'.$owner['username'].'</a> <img class="latest_reply" src="img/x.gif" alt="Show last post" title="Show last post" /></td>
		</tr>';
		
}
?>
		</tbody></table><p>
		<?php
			$opt = $database->getAlliPermissions($session->uid, $aid);
			if($opt['opt5'] == 1){
				echo '<a href="allianz.php?s=2&admin=newforum"><img id="fbtn_newforum" class="dynamic_img" src="img/x.gif" alt="New forum" /></a>
				<a href="allianz.php?s='.$ids.'&admin=switch_admin" title="Toggle Admin mode"><img class="switch_admin dynamic_img" src="img/x.gif" alt="Toggle Admin mode" /></a>';
			}
		?>
</p>