<!DOCTYPE html>
<html>
<head>
	<title>Surat Kendali Masuk</title>
	<style type="text/css">
		table.a1,table.a1 tr,table.a1 tr td {
			font-size: 14px;
    		border-collapse: collapse;
    		text-align: left;

		}
		td {
			border-bottom: 0.05cm solid black;
			padding: 1cm 5px 5px 5px;
			vertical-align: text-top;
		}
		td.x1 {
			padding:5px 5px 5px 5px;
			vertical-align: text-top;
		}
	</style>
	<script type="text/javascript">
      window.onload = function() { window.print(); }
 </script>
</head>
<body >
	<?php
	include "fungsi_indotgl_jam.php";
	$sql2 = "select * from inbox_receiver where NId='".$_REQUEST["NId"]."'";
	$res2 = mysql_query($sql2);
	$dataq = mysql_fetch_array($res2);
	$roleid = $dataq["RoleId_To"];
	$msg = $dataq["Msg"];
	$kepadaa = $dataq["To_Id"];

	$sqlrole = "select * from people where PrimaryRoleId='".$roleid."'";
	$res3 = mysql_query($sqlrole);
	

	

	$sql = "select * from v_s_masuk where NId='".$_REQUEST["NId"]."'";
	$res = mysql_query($sql);
	$data[1] = "|";
	$data[2] = "|";
	while($ress3 = mysql_fetch_array($res3)){
	$data[1] .= ", " . $ress3["PeopleName"] . " (". $ress3["PeoplePosition"].") ";
}
	while($row = mysql_fetch_array($res)){
					
		$data[2] .= ", " . $row["tembusan_name"] ;
		$nomor = $row["Nomor"];
		$pengirim = $row["InstansiPengirim"];
		$tgl = tgl_indo($row["Tgl"]);	
		$masuk = $row["ReceiveDate"];
		$hal = $row["Hal"];
		$buat = $row["CreatedBy"];
		$berkasid = $row["BerkasId"];
	}

	$sql6 = "select * from inbox where NId='".$_REQUEST["NId"]."'";
	$res6 = mysql_query($sql6);
	$ress6 = mysql_fetch_array($res6);
	$nagenda = $ress6["NAgenda"]; 

	$sql7 = "select * from berkas where BerkasId='".$berkasid."'";
	$res7 = mysql_query($sql7);
	$ress7 = mysql_fetch_array($res7);
	$berkass = $ress7["Klasifikasi"];

	$sqlbuat = "select * from people where PeopleId='".$buat."'";
	$res4 = mysql_query($sqlbuat);
	$ress4 = mysql_fetch_array($res4);

	mysql_free_result($res);
	
	$data[1] = str_replace("|,", "", $data[1]);
	$data[2] = str_replace("|,", "", $data[2]);
	
	// get from disposisi
	$sql = "select * from inbox_disposisi 
			where NId='" . $_REQUEST["NId"] . "' 
			  and GIR_Id='" . $_REQUEST["GIR_Id"] . "'";
	$res = mysql_query($sql);
	while($row = mysql_fetch_array($res)){
		$data[4] = $row["NoIndex"];
		$data[5] = $row["Sifat"];
		$data[6] = $row["Disposisi"];
	}
	mysql_free_result($res);		
?>
&nbsp; <br clear="all" />
<div style="width: 15.5cm; height: 10.5cm; float: left; border:1px solid #000; max-height: 10.5cm; margin: 5px;">
	<div style="height: 10.5cm; width: 0.8cm; background: #000; float: left;"></div>
	<div style="height: 1cm; width: 10.5cm; transform: rotate(-90deg
	);  float: left; text-align: center; font-family: arial; position: relative; left: -4.75cm; top: 4.75cm;">
		<h5 style="margin: 0.30cm;">KARTU SURAT KELUAR</h5>
	</div>
	<div style="width: 13.7cm; height: 10.5cm;max-height: 10.5cm; float: left; position: relative; left: 1cm; top: -1cm;">
		<div style="width: 13.25cm; height: 9.5cm; background: #fff; margin: 0.5cm 0cm">
			<table class="a1">
				<tr>
					<td style="width: 1.5cm">Index :</td>
					<td style="width: 3cm; border-right: 0.05cm solid #000; text-align: right;"><?php echo $data[4]?></td>
					<td style="width: 1.5cm">Kode :</td>
					<td  style="width: 3.5cm; border-right: 0.05cm solid #000; text-align: right;"><?php echo $berkass?></td>
					<td style="width: 2cm;">No Urut :</td>
					<td style="width: 3cm; text-align: right;"><?php echo $nagenda?></td>
				</tr>
				<tr>
					<td style="width: 2.5cm; padding:5px 5px 1cm 5px;">Isi ringkas :</td>
					<td colspan="5" style="width: 1.5cm; padding: 5px;"><?php echo $hal?> </td>
				</tr>
				<tr>
					<td style="width: 1.5cm; padding:5px 5px 1cm 5px;">Kepada :</td>
					<td colspan="5" style="width: 1.5cm; padding: 5px;"><?php 
					if ($roleid == NULL) {
						echo $kepadaa;
					}
					else{
					echo $data[1];}
					?></td>
				</tr>
				<tr>
					<td class="x1" style="width: 1.5cm">Pengolah :</td>
					<td class="x1" style="width: 3cm;border-right: 0.05cm solid #000;"><?php echo $ress4["PeoplePosition"]?></td>
					<td class="x1" style="width: 2.6cm">Tgl. surat :</td>
					<td class="x1" style="width: 2.6cm;border-right: 0.05cm solid #000;"><?php echo $tgl?></td>
					<td class="x1" style="width: 2cm;">Lampiran :</td>
					<td class="x1" style="width: 3cm"></td>
				</tr>
				<tr>
					<td style="border:none; width: 1.5cm; padding:5px 5px 1cm 5px;">Catatan :</td>
					<td colspan="5" style="border:none; width: 1.5cm; padding: 5px;"><?php echo $msg?></td>
				</tr>
			</table>
		</div>
	</div>
</div>