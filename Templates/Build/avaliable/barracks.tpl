<h2>Barracks</h2>

<table class="new_building" cellpadding="1" cellspacing="1">
	<tbody><tr>
		<td class="desc">In the barracks infantry can be trained. The higher its level the faster the troops are trained.</td>
		<td rowspan="3" class="bimg">
        <a href="#" onClick="return Popup(19,4);">
				<img class="building g19" src="img/x.gif" alt="Barracks" title="Barracks" /></a>
					</td>
	</tr>
	<tr>
		<?php
        $_GET['bid'] = 19;
        include("availupgrade.tpl");
        ?>
	</tr>
</table>