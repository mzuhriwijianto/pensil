
<?php
include 'bridge.php';
error_reporting(E_ALL ^ (E_NOTICE | E_WARNING));
$userid = $_POST['userid'];
$enc_pass = md5($_POST['pass']);
$query=mysqli_query($koneksi,"SELECT * from t_apms_user where userid='$userid' AND password='$enc_pass'");

$jml_=mysqli_num_rows($query);
$hasil=mysqli_fetch_array($query);
 
if($jml_ == 1)
{
	//CREATE A SESSION USER LOGIN	
	session_start();
	$_SESSION["userid"]=$userid;
	$_SESSION["nama"]=$hasil['nama'];
	$_SESSION["pass"]=$hasil['password'];
	$_SESSION["status"]=$hasil['status'];
	$_SESSION["akses"]=$hasil['id_akses'];
	$_SESSION["idbidang"]=$hasil['id_bidang'];
	
	if($hasil['id_akses']<>0){
		$jab = mysqli_query($koneksi,"SELECT * from t_apms_jabatan WHERE id_jab='".$hasil['id_akses']."'");
		$row = mysqli_fetch_array($jab);
		$_SESSION["jabatan"]=$row['ket_jab'];
	}

	if($hasil['id_subbidang']<>0){
		$_SESSION["idsubbidang"]=$hasil['id_subbidang'];	
	}
	if($hasil['id_staff']<>0){
		$_SESSION["idsubbidang"]=$hasil['id_subbidang'];
		$_SESSION["idstaff"]=$hasil['id_staff'];	
	}			
	
	$active=1;
	$update_status=mysqli_query($koneksi,"UPDATE t_apms_user SET status='$active' WHERE userid='".$_SESSION['userid']."'");
	header("location:index.php");
	echo "<script type='text/javascript'>
                  setTimeout(function(){
                    Swal.fire({
                      position: 'center-top',
                      icon: 'success',
                      title: 'Berhasil Disposisi Data Ke Sub Bidang',
                      showConfirmButton: false,
                      timer: 1500
                      });
                    },10);
                 </script>";
	
}elseif($userid == '' || $enc_pass == '')
{	
	header("location:login.php?error=2");	
}else{
	header("location:login.php?error=1");
}

?>
