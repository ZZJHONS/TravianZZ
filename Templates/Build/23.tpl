<div id="build" class="gid23"><a href="#" onClick="return Popup(23,4);" class="build_logo">
	<img class="building g23" src="img/x.gif" alt="Cranny" title="Cranny" />
</a>
<h1>Cranny <span class="level">Level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">The cranny is used to hide some of your resources when the village is attacked. These resources cannot be stolen.</p>


	<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>Currently hidden units per resource:</th>
		<td><b><?php echo $bid23[$village->resarray['f'.$id]]['attri']; ?></b> units</td>
	</tr>
	<tr>
<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
		<th>Hidden units per resource at level <?php echo $village->resarray['f'.$id]+1; ?>:</th>
		<td><b><?php echo $bid23[$village->resarray['f'.$id]+1]['attri']; ?></b> units</td>
        <?php
            }
            ?>
	</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>