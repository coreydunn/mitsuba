<?php		
//echo "<body style=\"display:flex;flex-direction:column;\">";
echo "<style>body{font-family:sans-serif;color:white;background:#eef2fe;}</style>";
echo "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">";

// colors: ( fg: #d8daef | bg: #eef2fe )

function main()
{
	$server_info=parse_ini_file("server_config.ini");
	$server_fqdn=$server_info['fqdn'];
	$server_port=$server_info['port'];
	$server_root=$server_info['root'];

	//echo "user:".exec('whoami')."<br>";

	// try to open database
	try
	{
		$db=new SQLite3("$server_root/db/posts.db");
	}
	catch(Exception $e)
	{
		echo "SQLite3 error:<br>";
		echo "$e";
	}

	// Select all texts and print from database
	$res=$db->query('select rowid,* from data;');
	while($row=$res->fetchArray())
	{
		//var_dump($row);
		echo "<p style=\"color:black;background:#d8daef;padding: 10px; border: 0px solid #777777;\">";
		echo "<font size=1>";
		echo $row['_date']." ".$row['_time'];
		printf(" No. %09d<br>",$row['rowid']);
		echo "</font>";
		echo $row['text']."<br>";
		echo "</p>";
	}

	$text='';
	// User textbox and submit
	echo "
		<form method=post action=index.php>
		<input style=\"color:black;background:#d8daef;width:80%;\" type=textarea name='text' value=''>
		<input style=\"color:black;background:#d8daef;\" type=submit value=Submit>
		";

	// Collect user input
	if(isset($_POST['text']))
	{
		$text=$_POST['text'];
		echo $text;

		if(!empty($text))
		{
			// Insert new post into database
			try
			{
				//$db->exec("insert into data values ('ok ok ok');");
				$s=$db->prepare("insert into data values ('$text',date('now'),time('now'));");
				$s->execute();

				//header("Location: https://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]");
				header("Location: http://$server_fqdn:$server_port/done.php");
				exit;

			}
			catch(Exception $e)
			{
				echo "SQLite3 prepare error:<br>";
			}
		}
	}

}

main();

//echo "</body>";
?>

<footer>
	<hr>
	<font size="1">
		---
	</font>
</footer>
