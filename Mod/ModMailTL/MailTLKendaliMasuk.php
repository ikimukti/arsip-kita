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
<body><?php
include "fungsi_indotgl_jam.php";

	$sql2 = "select * from inbox_receiver where NId='".$_REQUEST["NId"]."'";
	$res2 = mysql_query($sql2);
	$dataq = mysql_fetch_array($res2);
	$roleid = $dataq["RoleId_To"];
	$msg = $dataq["Msg"];


	$sqlrole = "select * from people where PrimaryRoleId='".$roleid."'";
	$res3 = mysql_query($sqlrole);
	$ress3 = mysql_fetch_array($res3);

	$sql = "select * from v_s_masuk where NId='".$_REQUEST["NId"]."'";
	$res = mysql_query($sql);
	$data[1] = "|";
	$data[2] = "|";
	while($row = mysql_fetch_array($res)){
		$data[1] .= ", " . $ress3["PeopleName"] . " (". $ress3["PeoplePosition"].") ";			
		$data[2] .= ", " . $row["tembusan_name"] ;
		$nomor = $row["Nomor"];
		$pengirim = $row["InstansiPengirim"];
		$tgl = tgl_indo($row["Tgl"]);	
		$masuk = tgl_indo($row["ReceiveDate"]);
		$hal = $row["Hal"];
		$buat = $row["CreatedBy"];
		$berkasid = $row["BerkasId"];
	}
	mysql_free_result($res);

	
	
	$sqlbuat = "select * from people where PeopleId = '".$buat."'";
	$res4 = mysql_query($sqlbuat);
	$ress4 = mysql_fetch_array($res4);
	$nama = $ress4["PeoplePosition"];

	$sql4 = "select * from inbox where NId='".$_REQUEST["NId"]."'";
	$res4 = mysql_query($sql4);
	$ress4 = mysql_fetch_array($res4);
	$nagenda = $ress4["NAgenda"]; 

	$sql5 = "select * from berkas where BerkasId='".$berkasid."'";
	$res5 = mysql_query($sql5);
	$ress5 = mysql_fetch_array($res5);
	$berkass = $ress5["Klasifikasi"];

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
	<div style="height: 10.5cm; width: 0.8cm; float: left;"></div>
	<div style="height: 1cm; width: 10.5cm; transform: rotate(-90deg
	);  float: left; text-align: center; font-family: arial; position: relative; left: -4.75cm; top: 4.75cm;">
		<h4 style="margin: 0.30cm;">KARTU SURAT MASUK</h4>
	</div>
	<div style="width: 13.7cm; height: 10.5cm;max-height: 10.5cm; float: left; position: relative; left: 1cm; top: -1cm;">
		<div style="width: 13.25cm; height: 9.5cm; background: #fff; margin: 0.5cm 0cm">
			<table class="a1">
				<tr>
					<td style="width: 1.5cm">Index</td>
					<td style="width: 3cm; border-right: 0.05cm solid #000;"></td>
					<td style="width: 1.5cm">Kode :</td>
					<td  style="width: 3.5cm; border-right: 0.05cm solid #000;"><?php echo $berkass;?></td>
					<td style="width: 2cm;">No Urut :</td>
					<td style="width: 3cm; "><?php echo $nagenda;?></td>
				</tr>
				<tr>
					<td style="width: 2.6cm; padding:5px 5px 1cm 5px;">Isi ringkas :</td>
					<td colspan="5" style="width: 1.5cm; padding: 5px;"><?php echo $hal;?></td>
				</tr>
				<tr>
					<td style="width: 1.5cm; padding:5px 5px 1cm 5px;">Dari :</td>
					<td colspan="5" style="width: 1.5cm; padding: 5px;"><?php echo $pengirim;?> </td>
				</tr>
				<tr>
					<td class="x1" style="width: 1.5cm">Tanggal Surat :</td>
					<td class="x1" style="width: 3cm;border-right: 0.05cm solid #000;"><?php echo $tgl;?></td>
					<td class="x1" style="width: 2.2cm">Nomor <br>Surat :</td>
					<td class="x1" style="width: 3cm;border-right: 0.05cm solid #000;"><br><?php echo $nomor;?></td>
					<td class="x1" style="width: 2cm;">Lampiran :</td>
					<td class="x1" style="width: 3cm"></td>
				</tr>
				<tr>
					<td class="x1" style="width: 1.5cm">Pengolah :</td>
					<td class="x1" style="width: 3cm;border-right: 0.05cm solid #000;"><?php echo $nama ;?></td>
					<td class="x1" style="width: 2.6cm">Tgl. diteruskan :</td>
					<td class="x1" style="width: 2.6cm;border-right: 0.05cm solid #000;"><?php echo $masuk;?></td>
					<td class="x1" style="width: 2cm;">Tanda Terima :</td>
					<td class="x1" style="width: 3cm"></td>
				</tr>
				<tr>
					<td style="border:none; width: 1.5cm; padding:5px 5px 1cm 5px;">Catatan :</td>
					<td colspan="5" style="border:none; width: 1.5cm; padding: 5px;"><?php echo $msg;?></td>
				</tr>
			</table>
		</div>
	</div>
</div>
