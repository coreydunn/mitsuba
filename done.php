<?php
	function main()
	{
		$server_info=parse_ini_file("server_config.ini");
		$server_fqdn=$server_info['fqdn'];
		$server_port=$server_info['port'];
		$server_root=$server_info['root'];

		header("Location: http://$server_fqdn:$server_port/index.php");
		exit;
	}

	main();
?>

<html>
cool thanks bud
</html>
