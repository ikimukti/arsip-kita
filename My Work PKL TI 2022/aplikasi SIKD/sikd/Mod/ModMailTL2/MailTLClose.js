<script type="text/javascript">
	function setSave(){
		var RoleOri, RoleCurrent;
		RoleOri = document.forms.form1.txt1;
		RoleCurrent = document.forms.form1.txt2;
		
		if(window.confirm('Apakah Anda Yakin Akan Melakukan Proses Ini ?') == false){
			return false;	
		}
		
		if (RoleOri.value != RoleCurrent.value){
			var msg = window.confirm("Apakah Anda Akan Memindahkan Berkas ini dari Unit Kerja Semula ? \nPilih 'Cancel' jika tidak, dan sistem akan tetap melakukan proses ini tanpa memindahkan Berkas ke Unit Kerja lain.");
			document.forms.form1.txt4.value = msg;
		}
		
		document.forms.form1.submit();
	}
	
	function done(str){
		if(str == 'closed'){
			alert('Berkas Berhasil Ditutup..! Dan hanya akan bisa Dibuka Kembali oleh Administrator Pusat.');
		}
		window.close();
	}
   
</script>