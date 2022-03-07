<?php	

		$server_mysql_local = 'localhost';

		$user_mysql_local = 'root';

		$password_mysql_local = 'Blctelkom2018';

		$database_mysql_local = 'db_sikd_J39l6ynFNG';

		$con_mysql_local = @mysql_connect($server_mysql_local, $user_mysql_local, $password_mysql_local);

		if(!$con_mysql_local){

			if(file_exists('install/index3.php')){
				$filename = 'index3.php';
			}else{
				$filename = 'index_install.php';
			}
			header('location:install/' . $filename . '?option=server_error');

		}

		mysql_select_db($database_mysql_local , $con_mysql_local);

		
		$gaSql[server] = 'localhost';

		$gaSql[user] = 'root';

		$gaSql[password] = 'Blctelkom2018';

		$gaSql[db] = 'db_sikd_J39l6ynFNG';

		

		?>