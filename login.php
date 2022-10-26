<?php
include 'bridge.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Asset Project Management System | Login</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- SweetAlert2 -->
  <link rel="stylesheet" href="plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
</head>
<body class="hold-transition login-page" style="background-image: url('img/gbr3.jpg')">
<div class="login-box">
  <div class="login-logo">
    <b>Pemantauan Disposisi Intensif Elektronik (PENSIL) | </b>Login
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">Sign in to start your session</p>

      <form action="cek_login.php" method="post">
        <div class="input-group mb-3">
          <input type="text" class="form-control" placeholder="Userid" name="userid">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control" placeholder="Password" name="pass">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
          
          <!-- /.col -->
          <div class="col-6">
            <button type="reset" class="btn btn-danger btn-block">Reset</button>
          </div>
          <div class="col-6">
            <button type="submit" class="btn btn-success btn-block">Log In</button>
          </div>
          <!-- /.col -->
        </div>
      </form>
      <!-- /.social-auth-links -->

    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<footer>
  <strong style="font-size:13px;">Copyright &copy; <?=date('2022')?> <a href="">Bidang Pengelolaan Aset BPKAD Bojonegoro</a>&nbsp;</strong>
</footer>
<!-- /.login-box -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- SweetAlert2 -->
<script src="plugins/sweetalert2/sweetalert2.min.js"></script>

</body>
<?php
if(isset($_GET['error'])){
  $x = $_GET['error'];
  if($x==1){
    echo "
    <script>var Toast = Swal.mixin({
      toast: true,
      position: 'center-top',
      showConfirmButton: false,
      timer: 3000
    });
    Toast.fire({
          icon: 'error',
          title: 'Opps...Anda Gagal Mengakses Aplikasi'
        })
    </script>    
    ";
  }elseif ($x==2) {
    echo "
    <script>var Toast = Swal.mixin({
      toast: true,
      position: 'center-top',
      showConfirmButton: false,
      timer: 3000
    });
    Toast.fire({
          icon: 'warning',
          title: 'Anda Belum Mengisi Userid dan Password'
        })
    </script>    
    ";
  }{
    echo "";
  }
}
?>
</html>
