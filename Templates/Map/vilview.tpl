<div id="content"  class="map">
<?php 
$basearray = $database->getMInfo($_GET['d']);
if($basearray['oasistype'] > 0) {
	$basearray = $database->getOMInfo($_GET['d']);
}
?>
<h1><?php echo !$basearray['occupied']? $basearray['fieldtype']? "Abandoned valley" : $basearray['conqured'] ? $basearray['name'] : "Unoccupied oasis" : $basearray['name']; echo " (".$basearray['x']."|".$basearray['y'].")"; ?></h1>
<?php if($basearray['occupied'] && $basearray['capital']) { echo "<div id=\"dmain\">(capital)</div>"; } ?>

<img src="img/x.gif" id="detailed_map" class="<?php echo ($basearray['fieldtype'] == 0)? 'w'.$basearray['oasistype'] : 'f'.$basearray['fieldtype'] ?>" alt="<?php 
switch($basearray['fieldtype']) {
case 1:
$tt =  "3-3-3-9";
break;
case 2:
$tt =  "3-4-5-6";
break;
case 3:
$tt =  "4-4-4-6";
break;
case 4:
$tt =  "4-5-3-6";
break;
case 5:
$tt =  "5-3-4-6";
break;
case 6:
$tt =  "1-1-1-15";
break;
case 7:
$tt =  "4-4-3-7";
break;
case 8:
$tt =  "3-4-4-7";
break;
case 9:
$tt =  "4-3-4-7";
break;
case 10:
$tt =  "3-5-4-6";
break;
case 11:
$tt =  "4-3-5-6";
break;
case 12:
$tt =  "5-4-3-6";
break;
case 0:
switch($basearray['oasistype']) {
case 1:
case 2:
$tt =  "+25% lumber per hour\" title=\"+25% lumber per hour";
break;
case 3:
$tt =  "+25% lumber and +25% crop per\" title=\"+25% lumber and +25% crop per";
break;
case 4:
case 5:
$tt =  "+25% clay per hour\" title=\"+25% clay per hour";
break;
case 6:
$tt =  "+25% clay and +25% crop per\" title=\"+25% lumber and +25% crop per";
break;
case 7:
case 8:
$tt =  "+25% iron per hour\" title=\"+25% iron per hour";
break;
case 9:
$tt =  "+25% iron and +25% crop per\" title=\"+25% iron and +25% crop per";
break;
case 10:
case 11:
$tt =  "+25% crop per hour\" title=\"+25% crop per hour";
break;
case 12:
$tt =  "+50% crop per hour\" title=\"+50% crop per hour";
break;
}
break;
}
echo $tt."\"";
$landd = explode("-",$tt);?> />

<div id="map_details">
<?php if($basearray['fieldtype'] == 0 && !$basearray['conqured']) {
?>
<table cellpadding="1" cellspacing="1" id="troop_info" class="tableNone">
            <thead><tr>
                <th colspan="3">Troops:</th>
            </tr></thead>
            <tbody>
            <?php         
        $unit = $database->getUnit($_GET['d']);
        $unarray = array(31=>"Rat","Spider","Snake","Bat","Wild Boar","Wolf","Bear","Crocodile","Tiger","Elephant");     
        $a = 0;
        for ($i = 31; $i <= 40; $i++) {
          if($unit['u'.$i]){
            echo '<tr>';
                      echo '<td class="ico"><img class="unit u'.$i.'" src="img/x.gif" alt="'.$unarray[$i].'" title="'.$unarray[$i].'" /></td>';
                      echo '<td class="val">'.$unit['u'.$i].'</td>';
                      echo '<td class="desc">'.$unarray[$i].'</td>';
                      echo '</tr>';                                             
                  }else{
            $a = $a+1;
          }                   
        }
        if($a == 10){
        echo '<tr><td>no troops</td></tr>';
        }

     
      ?>
        </tbody>
        </table>

<?php
}
else if (!$basearray['occupied'] && !$basearray['conqured']) {
?>
	<table cellpadding="1" cellspacing="1" id="distribution" class="tableNone">

		<thead><tr>
			<th colspan="3">Land distribution</th>
		</tr></thead>
		<tbody>
						<tr>
				<td class="ico"><img class="r1" src="img/x.gif" alt="Lumber" title="Lumber" /></td>
				<td class="val"><?php echo $landd['0']; ?></td>
				<td class="desc">Woodcutters</td>

			</tr>
						<tr>
				<td class="ico"><img class="r2" src="img/x.gif" alt="Clay" title="Clay" /></td>
				<td class="val"><?php echo $landd['1']; ?></td>
				<td class="desc">Clay Pits</td>
			</tr>
						<tr>
				<td class="ico"><img class="r3" src="img/x.gif" alt="Iron" title="Iron" /></td>

				<td class="val"><?php echo $landd['2']; ?></td>
				<td class="desc">Iron Mines</td>
			</tr>
						<tr>
				<td class="ico"><img class="r4" src="img/x.gif" alt="Crop" title="Crop" /></td>
				<td class="val"><?php echo $landd['3']; ?></td>
				<td class="desc">Croplands</td>

			</tr>
					</tbody>
	</table>
    <?php
    }
    else if ($basearray['conqured']) {
    ?>
    <table cellpadding="1" cellspacing="1" id="village_info" class="tableNone">
        <?php 
        $uinfo = $database->getUserArray($basearray['owner'],1); ?>
		<tbody><tr>
			<th>Tribe</th>
			<td><?php switch($uinfo['tribe']) { case 1: echo TRIBE1; break; case 2: echo TRIBE2; break; case 3: echo TRIBE3; break; case 4: echo TRIBE4; break; case 5: echo TRIBE5; break;} ?></td>
		</tr>
		<tr>
			<th>Alliance</th>
			<?php if($uinfo['alliance'] == 0){
			echo '<td>-</td>';
			} else echo '
			<td><a href="allianz.php?aid='.$uinfo['alliance'].' ">'.$database->getUserAlliance($basearray['owner']).'</a></td>'; ?>
		</tr>
		<tr>
			<th>Owner</th>
			<td><a href="spieler.php?uid=<?php echo $basearray['owner']; ?>"><?php echo $database->getUserField($basearray['owner'],'username',0); ?></a></td>
		</tr>
		<tr>
			<th>Village</th>
			<td><a href="karte.php?d=<?php echo $basearray['conqured']; ?>&amp;c=<?php echo $generator->getMapCheck($basearray['conqured']); ?>"><?php echo $database->getVillageField($basearray['conqured'],"name"); ?></a></td>
		</tr></tbody>
	</table>
 
	<table cellpadding="1" cellspacing="1" id="troop_info" class="tableNone rep">
		<thead><tr>
			<th>Reports:</th>
		</tr></thead>
		<tbody>
							<tr>
					<td>There is no
<br>information available.</td>
				</tr>
					</tbody>
	</table>
    <?php } 
    else {
    ?>
    <table cellpadding="1" cellspacing="1" id="village_info" class="tableNone">
		<thead><tr>
			<th colspan="2"><div><?php echo $basearray['name']; ?></div>&nbsp;(<?php echo $basearray['x']; ?>|<?php echo $basearray['y']; ?>)</th>
		</tr></thead>
        <?php 
        $uinfo = $database->getUserArray($basearray['owner'],1); ?>
		<tbody><tr>
			<th>Tribe</th>
			<td><?php switch($uinfo['tribe']) { case 1: echo TRIBE1; break; case 2: echo TRIBE2; break; case 3: echo TRIBE3; break; case 4: echo TRIBE4; break; case 5: echo TRIBE5; break;} ?></td>
		</tr>
		<tr>
			<th>Alliance</th>
			<?php if($uinfo['alliance'] == 0){
			echo '<td>-</td>';
			} else echo '
			<td><a href="allianz.php?aid='.$uinfo['alliance'].' ">'.$database->getUserAlliance($basearray['owner']).'</a></td>'; ?>
		</tr>
		<tr>
			<th>Owner</th>
			<td><a href="spieler.php?uid=<?php echo $basearray['owner']; ?>"><?php echo $database->getUserField($basearray['owner'],'username',0); ?></a></td>
		</tr>
		<tr>
			<th>Population</th>
			<td><?php echo $basearray['pop']; ?></td>
		</tr></tbody>
	</table>
 
	<table cellpadding="1" cellspacing="1" id="troop_info" class="tableNone rep">
		<thead><tr>
			<th>Reports:</th>
		</tr></thead>
		<tbody>
							<tr>
					<td>There is no
<br>information available.</td>
				</tr>
					</tbody>
	</table>
    <?php } ?>
</div>
<table cellpadding="1" cellspacing="1" id="options" class="tableNone">
	<thead><tr>
		<th>Options</th>
	</tr></thead>
	<tbody><tr>

		<td><a href="karte.php?z=<?php echo $_GET['d']; ?>">&raquo; Centre map.</a></td>
	</tr>
    <?php if(!$basearray['occupied']) {
    ?>
			<tr>
			<td class="none"><?php 
      $mode = CP; 
      $total = count($database->getProfileVillages($session->uid)); 
      $need_cps = ${'cp'.$mode}[$total+1]; 
      $cps = $session->cp;      
      
      if($cps >= $need_cps) {
        $enough_cp = true;
      } else {
        $enough_cp = false;
      }
      
			$otext = ($basearray['occupied'] == 1)? "occupied" : "unoccupied"; 
			if($village->unitarray['u'.$session->tribe.'0'] >= 3 AND $enough_cp) {
        $test = "<a href=\"a2b.php?id=".$_GET['d']."&amp;s=1\">&raquo;  Found new village.</a>";
      } elseif($village->unitarray['u'.$session->tribe.'0'] >= 3 AND !$enough_cp) {
        $test = "&raquo; Found new village. ($cps/$need_cps culture points)";
      } else {
        $test = "&raquo; Found new village. (".$village->unitarray['u'.$session->tribe.'0']."/3 settlers available)";
      }
 	
		echo ($basearray['fieldtype']==0)? 
		($village->resarray['f39']==0)? 
		($basearray['owner'] == $session->uid)?
		
		
		"<a href=\"build.php?id=39\">&raquo; Raid $otext oasis. (build a rally point)</a>" : 
		"&raquo; Raid $otext oasis. (build a rally point)" : 
		
		
		"<a href=\"a2b.php?z=".$_GET['d']."&o\">&raquo;&nbsp;".($basearray['conqured'] ? "Send troops" : "Raid unoccupied oasis")."</a>" :
		"$test"
			?>
		</tr>
        <?php } 
        else if ($basearray['occupied'] && $basearray['wref'] != $_SESSION['wid']) {?>
        <tr>
					<td class="none">
          <?php 
          $query1 = mysql_query('SELECT * FROM `' . TB_PREFIX . 'vdata` WHERE `wref` = ' . mysql_escape_string($_GET['d']));
          $data1 = mysql_fetch_assoc($query1);
          $query2 = mysql_query('SELECT * FROM `' . TB_PREFIX . 'users` WHERE `id` = ' . $data1['owner']);
          $data2 = mysql_fetch_assoc($query2);
           if($data2['access']=='0') {
            echo "&raquo; Send troops. (Player is banned)";
          } else if($data2['protect'] < time()) {
            echo $village->resarray['f39']? "<a href=\"a2b.php?z=".$_GET['d']."\">&raquo; Send troops." : "&raquo; Send troops. (build a rally point)"; 
          } else {
            echo "&raquo; Send troops. (beginners protection)";
          }
          ?>
          </td>
          
          
				</tr>
					    	<tr>
					<td class="none"><?php echo $building->getTypeLevel(17)? "<a href=\"build.php?z=".$_GET['d']."&id=" . $building->getTypeField(17) . "\">&raquo; Send merchant(s)." : "&raquo; Send merchant(s). (build marketplace)"; ?></td>
				</tr>
                <?php } ?>
		</tbody>
</table>

</div>
