<?php
/*============================+
+ Travian File: 37_train.tpl  +
+ Developed by vnnbot.net     +
+=============================*/


//check if there is unit needed in the village

$result = mysql_query("SELECT * FROM ".TB_PREFIX."units WHERE `vref` = ".$village->wid."");
$units = mysql_fetch_array($result);

$output="<table cellpadding=1 cellspacing=1 class=\"build_details\">
        <thead>
            <tr>
                <th colspan=2>Train New Hero</th>
            </tr>
        </thead>";
        
if($session->tribe == 1) {
    $output.=" <tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u1\" src=\"img/x.gif\" alt=\"Legionnaire\" title=\"Legionnaire\" />
						Legionnaire
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"Wood\" />".$u1['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\" title=\"Clay\" />".$u1['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\" title=\"Iron\" />".$u1['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\" title=\"Crop\" />".$u1['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Crop consumption\" title=\"Crop consumption\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"Duration\" />";
     $output.=$generator->getTimeFormat(round($u1['time'] / SPEED)*3);
     $output.="</div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

                
    if($village->awood < $u1['wood'] || $village->aclay < $u1['clay'] || $village->airon < $u1['iron'] || $village->acrop < $u1['crop'])      
        $output.="<span class=\"none\">Not enough resources</span>";    
    elseif($units['u1'] == 0) 
        $output.="<span class=\"none\">Not available units</span>";      
    else $output.="<a href=\"build.php?id=".$id."&train=1\">Train</a>";
        
    
    $output.="</center></td>
</tr>";
  
        
    
    if($database->checkIfResearched($village->wid, 't2') != 0){ 
        $output.="<tr>
                    <td class=\"desc\">
        				<div class=\"tit\">
        					<img class=\"unit u2\" src=\"img/x.gif\" alt=\"Praetorian\" title=\"Praetorian\" />
        					Praetorian
        				</div>
        				<div class=\"details\">
        					<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"Wood\" />".$u2['wood']."|
                            <img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\" title=\"Clay\" />".$u2['clay']."|
                            <img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\" title=\"Iron\" />".$u2['iron']."|
                            <img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\" title=\"Crop\" />".$u2['crop']."|
                            <img class=\"r5\" src=\"img/x.gif\" alt=\"Crop consumption\" title=\"Crop consumption\" />6|
                            <img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"Duration\" />";
        $output.=$generator->getTimeFormat(round($u2['time'] / SPEED)*3);
        
        $output.="</div>
        				</td>
        				
                        <td class=\"val\" width=\"20%\"><center>";
                        
        if($village->awood < $u2['wood'] OR $village->aclay < $u2['clay'] OR $village->airon < $u2['iron'] OR $village->acrop < $u2['crop']) 
           $output.="<span class=\"none\">Not enough resources</span>"; 
        elseif($units['u2'] == 0)
            $output.="<span class=\"none\">Not available units</span>"; 
        else 
            $output.="<a href=\"build.php?id=".$id."&train=2\">Train</a>";
                         
        $output.="</center></td>
                    </tr>";
    } 
        
    if($database->checkIfResearched($village->wid, 't3') != 0){
            
        $output.="<tr>
                        <td class=\"desc\">
        					<div class=\"tit\">
        						<img class=\"unit u3\" src=\"img/x.gif\" alt=\"Imperian\" title=\"Imperian\" />
        						Imperian
        					</div>
        					<div class=\"details\">
        						<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"Wood\" />".$u3['wood']."|
                                <img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\" title=\"Clay\" />".$u3['clay']."|
                                <img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\" title=\"Iron\" />".$u3['iron']."|
                                <img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\" title=\"Crop\" />".$u3['crop']."|
                                <img class=\"r5\" src=\"img/x.gif\" alt=\"Crop consumption\" title=\"Crop consumption\" />6|
                                <img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"Duration\" />";
                                
         $output.=  $generator->getTimeFormat(round($u3['time'] / SPEED)*3);
        
        $output.= "</div>
        				</td>
        				
                        <td class=\"val\" width=\"20%\"><center>";
        
        if($village->awood < $u3['wood'] OR $village->aclay < $u3['clay'] OR $village->airon < $u3['iron'] OR $village->acrop < $u3['crop']) { 
            $output.="<span class=\"none\">Not enough resources</span>"; 
        }else if($units['u3'] == 0){ 
            $output.="<span class=\"none\">Not available units</span>"; 
        }else {
            $output.="<a href=\"build.php?id=".$id."&train=3\">Train</a>";
        }  
                 "</center></td>
                    </tr> " ;     
    }         
    
    if($database->checkIfResearched($village->wid, 't5') != 0){  
        $output.= "<tr>
                    <td class=\"desc\">
    					<div class=\"tit\">
    						<img class=\"unit u5\" src=\"img/x.gif\" alt=\"Equites Imperatoris\" title=\"Equites Imperatoris\" />
    						Equites Imperatoris
    					</div>
    					<div class=\"details\">
    						<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"Wood\" />".$u5['wood']."|
                            <img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\" title=\"Clay\" />".$u5['clay']."|
                            <img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\" title=\"Iron\" />".$u5['iron']."|
                            <img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\" title=\"Crop\" />".$u5['crop']."|
                            <img class=\"r5\" src=\"img/x.gif\" alt=\"Crop consumption\" title=\"Crop consumption\" />6|
                            <img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"Duration\" />".
    				        $generator->getTimeFormat(round($u5['time'] / SPEED)*3)."
                        </div>
    				</td>
    				
                    <td class=\"val\" width=\"20%\"><center>";
        
        if($village->awood < $u5['wood'] OR $village->aclay < $u5['clay'] OR $village->airon < $u5['iron'] OR $village->acrop < $u5['crop']) { 
            $output.= "<span class=\"none\">Not enough resources</span>"; 
        }else if($units['u5'] == 0){ 
            $output.= "<span class=\"none\">Not available units</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=5\">Train</a>";
        } 
        $output.="</center></td>
                </tr>";
    }      
    
    if($database->checkIfResearched($village->wid, 't6') != 0){ 
        $output.="<tr>
                    <td class=\"desc\">
    					<div class=\"tit\">
    						<img class=\"unit u6\" src=\"img/x.gif\" alt=\"Equites Caesaris\" title=\"Equites Caesaris\" />
    						Equites Caesaris
    					</div>
    					<div class=\"details\">
    						<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"Wood\" />".$u6['wood']."|
                            <img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\" title=\"Clay\" />".$u6['clay']."|
                            <img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\" title=\"Iron\" />".$u6['iron']."|
                            <img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\" title=\"Crop\" />".$u6['crop']."|
                            <img class=\"r5\" src=\"img/x.gif\" alt=\"Crop consumption\" title=\"Crop consumption\" />6|
                            <img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"Duration\" />".
    				        $generator->getTimeFormat(round($u6['time'] / SPEED)*3)."
                        </div>
    				</td>
    				
                    <td class=\"val\" width=\"20%\"><center>   ";
      
        if($village->awood < $u6['wood'] OR $village->aclay < $u6['clay'] OR $village->airon < $u6['iron'] OR $village->acrop < $u6['crop']) { 
            $output.= "<span class=\"none\">Not enough resources</span>"; 
        }else if($units['u6'] == 0){ 
            $output.= "<span class=\"none\">Not available units</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=6\">Train</a>";
        }  
        
        $output.="</center></td>
                </tr>";
    }    
}    

if($session->tribe == 2) {

$output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u11\" src=\"img/x.gif\" alt=\"Clubswinger\" title=\"Clubswinger\" />
						Clubswinger
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"Wood\" />".$u11['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\" title=\"Clay\" />".$u11['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\" title=\"Iron\" />".$u11['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\" title=\"Crop\" />".$u11['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Crop consumption\" title=\"Crop consumption\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"Duration\" />".
				        $generator->getTimeFormat(round($u11['time'] / SPEED)*3)."
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u11['wood'] OR $village->aclay < $u11['clay'] OR $village->airon < $u11['iron'] OR $village->acrop < $u11['crop']) { 
            $output.= "<span class=\"none\">Not enough resources</span>"; 
        }else if($units['u11'] == 0){ 
            $output.= "<span class=\"none\">Not available units</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=11\">Train</a>";
        }  
    $output.="</center></td>
            </tr>";
            
            
    if($database->checkIfResearched($village->wid, 't12') != 0){    
        $output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u12\" src=\"img/x.gif\" alt=\"Clubswinger\" title=\"Clubswinger\" />
						Clubswinger
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"Wood\" />".$u12['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\" title=\"Clay\" />".$u12['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\" title=\"Iron\" />".$u12['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\" title=\"Crop\" />".$u12['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Crop consumption\" title=\"Crop consumption\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"Duration\" />".
				        $generator->getTimeFormat(round($u12['time'] / SPEED)*3)."
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u12['wood'] OR $village->aclay < $u12['clay'] OR $village->airon < $u12['iron'] OR $village->acrop < $u12['crop']) { 
            $output.= "<span class=\"none\">Not enough resources</span>"; 
        }else if($units['u12'] == 0){ 
            $output.= "<span class=\"none\">Not available units</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=12\">Train</a>";
        }  
        $output.="</center></td>
            </tr>";
    }    

  
    if($database->checkIfResearched($village->wid, 't13') != 0){    
        $output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u13\" src=\"img/x.gif\" alt=\"Clubswinger\" title=\"Clubswinger\" />
						Clubswinger
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"Wood\" />".$u13['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\" title=\"Clay\" />".$u13['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\" title=\"Iron\" />".$u13['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\" title=\"Crop\" />".$u13['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Crop consumption\" title=\"Crop consumption\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"Duration\" />".
				        $generator->getTimeFormat(round($u13['time'] / SPEED)*3)."
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u13['wood'] OR $village->aclay < $u13['clay'] OR $village->airon < $u13['iron'] OR $village->acrop < $u13['crop']) { 
            $output.= "<span class=\"none\">Not enough resources</span>"; 
        }else if($units['u13'] == 0){ 
            $output.= "<span class=\"none\">Not available units</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=13\">Train</a>";
        }  
        $output.="</center></td>
            </tr>";
    }   
    
    if($database->checkIfResearched($village->wid, 't15') != 0){    
        $output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u15\" src=\"img/x.gif\" alt=\"Clubswinger\" title=\"Clubswinger\" />
						Clubswinger
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"Wood\" />".$u15['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\" title=\"Clay\" />".$u15['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\" title=\"Iron\" />".$u15['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\" title=\"Crop\" />".$u15['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Crop consumption\" title=\"Crop consumption\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"Duration\" />".
				        $generator->getTimeFormat(round($u15['time'] / SPEED)*3)."
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u15['wood'] OR $village->aclay < $u15['clay'] OR $village->airon < $u15['iron'] OR $village->acrop < $u15['crop']) { 
            $output.= "<span class=\"none\">Not enough resources</span>"; 
        }else if($units['u15'] == 0){ 
            $output.= "<span class=\"none\">Not available units</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=15\">Train</a>";
        }  
        $output.="</center></td>
            </tr>";
    }  
    
    
    if($database->checkIfResearched($village->wid, 't16') != 0){    
        $output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u16\" src=\"img/x.gif\" alt=\"Clubswinger\" title=\"Clubswinger\" />
						Clubswinger
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"Wood\" />".$u16['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\" title=\"Clay\" />".$u16['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\" title=\"Iron\" />".$u16['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\" title=\"Crop\" />".$u16['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Crop consumption\" title=\"Crop consumption\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"Duration\" />".
				        $generator->getTimeFormat(round($u16['time'] / SPEED)*3)."
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u16['wood'] OR $village->aclay < $u16['clay'] OR $village->airon < $u16['iron'] OR $village->acrop < $u16['crop']) { 
            $output.= "<span class=\"none\">Not enough resources</span>"; 
        }else if($units['u16'] == 0){ 
            $output.= "<span class=\"none\">Not available units</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=16\">Train</a>";
        }  
        $output.="</center></td>
            </tr>";
    }  
}


if($session->tribe == 3) {

$output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u21\" src=\"img/x.gif\" alt=\"Phalanx\" title=\"Phalanx\" />
						Phalanx
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"Wood\" />".$u21['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\" title=\"Clay\" />".$u21['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\" title=\"Iron\" />".$u21['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\" title=\"Crop\" />".$u21['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Crop consumption\" title=\"Crop consumption\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"Duration\" />".
				        $generator->getTimeFormat(round($u21['time'] / SPEED)*3)."
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u21['wood'] OR $village->aclay < $u21['clay'] OR $village->airon < $u21['iron'] OR $village->acrop < $u21['crop']) { 
            $output.= "<span class=\"none\">Not enough resources</span>"; 
        }else if($units['u21'] == 0){ 
            $output.= "<span class=\"none\">Not available units</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=21\">Train</a>";
        }  
    $output.="</center></td>
            </tr>";
            
            
    if($database->checkIfResearched($village->wid, 't22') != 0){    
        $output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u22\" src=\"img/x.gif\" alt=\"Clubswinger\" title=\"Clubswinger\" />
						Clubswinger
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"Wood\" />".$u22['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\" title=\"Clay\" />".$u22['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\" title=\"Iron\" />".$u22['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\" title=\"Crop\" />".$u22['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Crop consumption\" title=\"Crop consumption\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"Duration\" />".
				        $generator->getTimeFormat(round($u22['time'] / SPEED)*3)."
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u22['wood'] OR $village->aclay < $u22['clay'] OR $village->airon < $u22['iron'] OR $village->acrop < $u22['crop']) { 
            $output.= "<span class=\"none\">Not enough resources</span>"; 
        }else if($units['u22'] == 0){ 
            $output.= "<span class=\"none\">Not available units</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=22\">Train</a>";
        }  
        $output.="</center></td>
            </tr>";
    }    

  
    if($database->checkIfResearched($village->wid, 't24') != 0){    
        $output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u24\" src=\"img/x.gif\" alt=\"Clubswinger\" title=\"Clubswinger\" />
						Clubswinger
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"Wood\" />".$u24['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\" title=\"Clay\" />".$u24['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\" title=\"Iron\" />".$u24['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\" title=\"Crop\" />".$u24['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Crop consumption\" title=\"Crop consumption\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"Duration\" />".
				        $generator->getTimeFormat(round($u24['time'] / SPEED)*3)."
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u24['wood'] OR $village->aclay < $u24['clay'] OR $village->airon < $u24['iron'] OR $village->acrop < $u24['crop']) { 
            $output.= "<span class=\"none\">Not enough resources</span>"; 
        }else if($units['u24'] == 0){ 
            $output.= "<span class=\"none\">Not available units</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=24\">Train</a>";
        }  
        $output.="</center></td>
            </tr>";
    }   
    
    if($database->checkIfResearched($village->wid, 't25') != 0){    
        $output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u25\" src=\"img/x.gif\" alt=\"Clubswinger\" title=\"Clubswinger\" />
						Clubswinger
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"Wood\" />".$u25['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\" title=\"Clay\" />".$u25['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\" title=\"Iron\" />".$u25['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\" title=\"Crop\" />".$u25['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Crop consumption\" title=\"Crop consumption\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"Duration\" />".
				        $generator->getTimeFormat(round($u25['time'] / SPEED)*3)."
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u25['wood'] OR $village->aclay < $u25['clay'] OR $village->airon < $u25['iron'] OR $village->acrop < $u25['crop']) { 
            $output.= "<span class=\"none\">Not enough resources</span>"; 
        }else if($units['u25'] == 0){ 
            $output.= "<span class=\"none\">Not available units</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=25\">Train</a>";
        }  
        $output.="</center></td>
            </tr>";
    }  
    
    
    if($database->checkIfResearched($village->wid, 't26') != 0){    
        $output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u26\" src=\"img/x.gif\" alt=\"Clubswinger\" title=\"Clubswinger\" />
						Clubswinger
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"Wood\" />".$u26['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\" title=\"Clay\" />".$u26['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\" title=\"Iron\" />".$u26['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\" title=\"Crop\" />".$u26['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Crop consumption\" title=\"Crop consumption\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"Duration\" />".
				        $generator->getTimeFormat(round($u26['time'] / SPEED)*3)."
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u26['wood'] OR $village->aclay < $u26['clay'] OR $village->airon < $u26['iron'] OR $village->acrop < $u26['crop']) { 
            $output.= "<span class=\"none\">Not enough resources</span>"; 
        }else if($units['u26'] == 0){ 
            $output.= "<span class=\"none\">Not available units</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=26\">Train</a>";
        }  
        $output.="</center></td>
            </tr>";
    }  
}



        //HERO TRAINING            
        if($session->tribe == 1){
                if($_GET['train'] == 1){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
                    mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`) VALUES ('".$session->uid."', '" . $village->wid . "', '0', '1', '".$session->username."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u1['time'] / SPEED)*3))."', '50')");
					mysql_query("UPDATE " . TB_PREFIX . "units SET `u1` = `u1` - 1 WHERE `vref` = '" . $village->wid . "'");
					header("Location: build.php?id=".$id."");                    
                }
                if($_GET['train'] == 2){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
                    mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`) VALUES (''".$session->uid."', '" . $village->wid . "', '0', '2', '".$session->username."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u2['time'] / SPEED)*3))."', '50')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u2` = `u2` - 1 WHERE `vref` = '" . $village->wid . "'");
					header("Location: build.php?id=".$id.""); 
                }
                if($_GET['train'] == 3){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
                    mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`) VALUES (''".$session->uid."', '" . $village->wid . "', '0', '3', '".$session->username."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u3['time'] / SPEED)*3))."', '50')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u3` = `u3` - 1 WHERE `vref` = '" . $village->wid . "'");
					header("Location: build.php?id=".$id.""); 
                }
                if($_GET['train'] == 5){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
                    mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`) VALUES (''".$session->uid."', '" . $village->wid . "', '0', '5', '".$session->username."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u5['time'] / SPEED)*3))."', '50')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u5` = `u5` - 1 WHERE `vref` = '" . $village->wid . "'");
					header("Location: build.php?id=".$id.""); 
                }
                if($_GET['train'] == 6){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
                    mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`) VALUES (''".$session->uid."', '" . $village->wid . "', '0', '6', '".$session->username."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u6['time'] / SPEED)*3))."', '50')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u6` = `u6` - 1 WHERE `vref` = '" . $village->wid . "'");
					header("Location: build.php?id=".$id.""); 
                }
            }      
        if($session->tribe == 2){
                if($_GET['train'] == 11){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
                    mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`) VALUES (''".$session->uid."', '" . $village->wid . "', '0', '11', '".$session->username."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u11['time'] / SPEED)*3))."', '50')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u11` = `u11` - 1 WHERE `vref` = '" . $village->wid . "'");
					//echo headers_sent();
                    header("Location: build.php?id=".$id.""); 
                    //echo "<script>document.location.herf=\"./build.php?id=".$id."\"</script>";
                }
                if($_GET['train'] == 12){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
                    mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`) VALUES (''".$session->uid."', '" . $village->wid . "', '0', '12', '".$session->username."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u12['time'] / SPEED)*3))."', '50')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u12` = `u12` - 1 WHERE `vref` = '" . $village->wid . "'");
					header("Location: build.php?id=".$id.""); 
                }
                if($_GET['train'] == 13){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
                    mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`) VALUES (''".$session->uid."', '" . $village->wid . "', '0', '13', '".$session->username."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u13['time'] / SPEED)*3))."', '50')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u13` = `u13` - 1 WHERE `vref` = '" . $village->wid . "'");
					header("Location: build.php?id=".$id.""); 
                }
                if($_GET['train'] == 15){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
                    mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`) VALUES (''".$session->uid."', '" . $village->wid . "', '0', '15', '".$session->username."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u15['time'] / SPEED)*3))."', '50')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u15` = `u15` - 1 WHERE `vref` = '" . $village->wid . "'");
					header("Location: build.php?id=".$id.""); 
                }
                if($_GET['train'] == 16){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
                    mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`) VALUES (''".$session->uid."', '" . $village->wid . "', '0', '16', '".$session->username."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u16['time'] / SPEED)*3))."', '50')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u16` = `u16` - 1 WHERE `vref` = '" . $village->wid . "'");
					header("Location: build.php?id=".$id.""); 
                }
            }
        if($session->tribe == 3){
                if($_GET['train'] == 21){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
                    mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`) VALUES (''".$session->uid."', '" . $village->wid . "', '0', '21', '".$session->username."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u21['time'] / SPEED)*3))."', '50')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u21` = `u21` - 1 WHERE `vref` = '" . $village->wid . "'");
					header("Location: build.php?id=".$id.""); 
                }
                if($_GET['train'] == 22){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
                    mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`) VALUES (''".$session->uid."', '" . $village->wid . "', '0', '22', '".$session->username."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u22['time'] / SPEED)*3))."', '50')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u22` = `u22` - 1 WHERE `vref` = '" . $village->wid . "'");
					header("Location: build.php?id=".$id.""); 
                }
                if($_GET['train'] == 24){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
                    mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`) VALUES (''".$session->uid."', '" . $village->wid . "', '0', '24', '".$session->username."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u24['time'] / SPEED)*3))."', '50')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u24` = `u24` - 1 WHERE `vref` = '" . $village->wid . "'");
					header("Location: build.php?id=".$id.""); 
                }
                if($_GET['train'] == 25){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
                    mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`) VALUES (''".$session->uid."', '" . $village->wid . "', '0', '25', '".$session->username."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u25['time'] / SPEED)*3))."', '50')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u25` = `u25` - 1 WHERE `vref` = '" . $village->wid . "'");
					header("Location: build.php?id=".$id.""); 
                }
                if($_GET['train'] == 26){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
                    mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`) VALUES (''".$session->uid."', '" . $village->wid . "', '0', '26', '".$session->username."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u26['time'] / SPEED)*3))."', '50')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u26` = `u26` - 1 WHERE `vref` = '" . $village->wid . "'");
					header("Location: build.php?id=".$id.""); 
                }
            }
        
        

echo  $output;  

?>
</table>