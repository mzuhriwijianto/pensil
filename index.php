<!DOCTYPE html>
<?php
include 'bridge.php';
include 'pages.php';
include 'function/fungsi.php';
//require_once "function/custom.php";
date_default_timezone_set("Asia/Bangkok");
$tahun = date('Y');
session_start();
?>
<?php
if(!empty($_SESSION['userid'])){
  ?>
  <html lang="en">
  <?php include 'header.php';?>
  <body class="hold-transition sidebar-mini layout-fixed">
  <div class="wrapper">
      <!-- Preloader -->
      <?php include 'preloader.php';?>
      <!-- Navbar -->
      <?php include 'navbar.php';?>
      <!-- /.navbar -->
    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
      <!-- Brand Logo -->
      <?php include 'logo.php';?>
      <!-- Sidebar -->
      <?php include 'sidebar.php';?>
      <!-- /.sidebar -->
    </aside>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <?php include 'konten_header.php';?>
      <!-- /.content-header -->
      <?php include 'konten.php';?>
    </div>
      <!-- /.content-wrapper -->
      <?php include 'footer.php';?>
  </div>
  <!-- ./wrapper -->
</body>

<script>
$(document).on('click','#btn-hapus', function(e){
  e.preventDefault();
  var link = $(this).attr('href');
    Swal.fire({
        title: 'Apakah Yakin Menghapus data?',
        text: "Data akan dihapus!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#00a65a',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Ya, hapus!'
    }).then((result) => {
      if (result.isConfirmed) {
          window.location = link;
      }
  })
})
</script>
</html>
<?php
}else{
  include 'login.php';
}
?>
<!-- Page specific script -->
<script>
  //Date picker
  $('#reservationdate').datetimepicker({
    format: 'YYYY-MM-DD'
  });
</script>

<!-- Initialize Select2 Elements -->
<script>
  $(function () {
    //Initialize Select2 Elements
    $('.select2').select2()    
  })
</script>
<!-- data tables -->
<script>
  $(function () {
    $("#example1").DataTable({
      "responsive": true, "lengthChange": false, "autoWidth": false,
      "order" : [0,'DESC'],
      "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });
</script>
<script>
$(function () {
  bsCustomFileInput.init();
});
</script>
<script>
  $(document).on("click","#tombolUbah",function(){
    let idx=$(this).data('id');
    let idpro=$(this).data('idpro');
    let idbid=$(this).data('idbid');
    let idsur=$(this).data('idsur');
    let nm_opd=$(this).data('nm_opd');
    let tgl_a=$(this).data('tgl_a');
    let tgl_b=$(this).data('tgl_b');
    let sifat=$(this).data('sifat');
    let lamp=$(this).data('lamp');
    let noagenda=$(this).data('noagenda');
    let nosurat=$(this).data('nosurat');
    
    $(".modal-body #nomor").val(idpro);
    $(".modal-body #bidang").val(idbid);
    $(".modal-body #pengirim").val(idsur);    
    $(".modal-body #nm_opd").val(nm_opd);
    $(".modal-body #tgl_a").val(tgl_a);
    $(".modal-body #tgl_b").val(tgl_b);
    $(".modal-body #sifat").val(sifat);
    $(".modal-body #lamp").val(lamp);
    $(".modal-body #idx").val(idx);
    $(".modal-body #agenda").val(noagenda);
    $(".modal-body #nosurat").val(nosurat);
  });
</script>
<script>
  $(document).on("click","#tombolUbah2",function(){
    let idx=$(this).data('id');
    let idpro=$(this).data('idpro');
    let idbid=$(this).data('idbid');
    let idsur=$(this).data('idsur');
    let nm_opd=$(this).data('nm_opd');
    let tgl_a=$(this).data('tgl_a');
    let tgl_b=$(this).data('tgl_b');
    let sifat=$(this).data('sifat');
    let lamp=$(this).data('lamp');
    let noagenda=$(this).data('noagenda');
    let nosurat=$(this).data('nosurat');
    let idsubbid=$(this).data('subbid');
    
    $(".modal-body #nomor").val(idpro);
    $(".modal-body #bidang").val(idbid);
    $(".modal-body #pengirim").val(idsur);    
    $(".modal-body #nm_opd").val(nm_opd);
    $(".modal-body #tgl_a").val(tgl_a);
    $(".modal-body #tgl_b").val(tgl_b);
    $(".modal-body #sifat").val(sifat);
    $(".modal-body #lamp").val(lamp);
    $(".modal-body #idx").val(idx);
    $(".modal-body #nosurat").val(nosurat);
    $(".modal-body #noagenda").val(noagenda);
    $(".modal-body #subbidang").val(idsubbid);
  });
</script>
<script>
  $(document).on("click","#tombolUbah3",function(){
    let idx=$(this).data('id');
    let idpro=$(this).data('idpro');
    let idbid=$(this).data('idbid');
    let idsur=$(this).data('idsur');
    let nm_opd=$(this).data('nm_opd');
    let tgl_a=$(this).data('tgl_a');
    let tgl_b=$(this).data('tgl_b');
    let sifat=$(this).data('sifat');
    let lamp=$(this).data('lamp');
    let noagenda=$(this).data('noagenda');
    let nosurat=$(this).data('nosurat');
    let idsubbid=$(this).data('subbid');
    let idstaf=$(this).data('idstaf');
    
    $(".modal-body #nomor").val(idpro);
    $(".modal-body #bidang").val(idbid);
    $(".modal-body #pengirim").val(idsur);    
    $(".modal-body #nm_opd").val(nm_opd);
    $(".modal-body #tgl_a").val(tgl_a);
    $(".modal-body #tgl_b").val(tgl_b);
    $(".modal-body #sifat").val(sifat);
    $(".modal-body #lamp").val(lamp);
    $(".modal-body #idx").val(idx);
    $(".modal-body #nosurat").val(nosurat);
    $(".modal-body #noagenda").val(noagenda);
    $(".modal-body #subbidang").val(idsubbid);
    $(".modal-body #staf").val(idstaf);
  });
</script>
<script>
  $(document).on("click","#tombolUbah4",function(){
    let idx=$(this).data('id');
    let idpro=$(this).data('idpro');
    let idbid=$(this).data('idbid');
    let idsur=$(this).data('idsur');
    let nm_opd=$(this).data('nm_opd');
    let tgl_a=$(this).data('tgl_a');
    let tgl_b=$(this).data('tgl_b');
    let sifat=$(this).data('sifat');
    let lamp=$(this).data('lamp');
    let noagenda=$(this).data('noagenda');
    let nosurat=$(this).data('nosurat');
    let idsubbid=$(this).data('subbid');
    let idstaf=$(this).data('idstaf');
    
    $(".modal-body #nomor").val(idpro);
    $(".modal-body #bidang").val(idbid);
    $(".modal-body #pengirim").val(idsur);    
    $(".modal-body #nm_opd").val(nm_opd);
    $(".modal-body #tgl_a").val(tgl_a);
    $(".modal-body #tgl_b").val(tgl_b);
    $(".modal-body #sifat").val(sifat);
    $(".modal-body #lamp").val(lamp);
    $(".modal-body #idx").val(idx);
    $(".modal-body #nosurat").val(nosurat);
    $(".modal-body #noagenda").val(noagenda);
    $(".modal-body #subbidang").val(idsubbid);
    $(".modal-body #staf").val(idstaf);
  });
</script>
<script>
  $(document).on("click","#tombolUbah5",function(){
    let idx=$(this).data('id');
    let idpro=$(this).data('idpro');
    let idbid=$(this).data('idbid');
    let idsur=$(this).data('idsur');
    let nm_opd=$(this).data('nm_opd');
    let tgl_a=$(this).data('tgl_a');
    let tgl_b=$(this).data('tgl_b');
    let sifat=$(this).data('sifat');
    let lamp=$(this).data('lamp');
    let noagenda=$(this).data('noagenda');
    let nosurat=$(this).data('nosurat');
    let idsubbid=$(this).data('subbid');
    let idstaf=$(this).data('idstaf');
    
    $(".modal-body #nomor").val(idpro);
    $(".modal-body #bidang").val(idbid);
    $(".modal-body #pengirim").val(idsur);    
    $(".modal-body #nm_opd").val(nm_opd);
    $(".modal-body #tgl_a").val(tgl_a);
    $(".modal-body #tgl_b").val(tgl_b);
    $(".modal-body #sifat").val(sifat);
    $(".modal-body #lamp").val(lamp);
    $(".modal-body #idx").val(idx);
    $(".modal-body #nosurat").val(nosurat);
    $(".modal-body #noagenda").val(noagenda);
    $(".modal-body #subbidang").val(idsubbid);
    $(".modal-body #staf").val(idstaf);
  });
</script>
<script>
  $(document).on("click","#tombolUbah6",function(){
    let idx=$(this).data('id');
    let idpro=$(this).data('idpro');
    let idbid=$(this).data('idbid');
    let idsur=$(this).data('idsur');
    let nm_opd=$(this).data('nm_opd');
    let tgl_a=$(this).data('tgl_a');
    let tgl_b=$(this).data('tgl_b');
    let sifat=$(this).data('sifat');
    let lamp=$(this).data('lamp');
    let noagenda=$(this).data('noagenda');
    let nosurat=$(this).data('nosurat');
    let idsubbid=$(this).data('subbid');
    let idstaf=$(this).data('idstaf');
    
    $(".modal-body #nomor").val(idpro);
    $(".modal-body #bidang").val(idbid);
    $(".modal-body #pengirim").val(idsur);    
    $(".modal-body #nm_opd").val(nm_opd);
    $(".modal-body #tgl_a").val(tgl_a);
    $(".modal-body #tgl_b").val(tgl_b);
    $(".modal-body #sifat").val(sifat);
    $(".modal-body #lamp").val(lamp);
    $(".modal-body #idx").val(idx);
    $(".modal-body #nosurat").val(nosurat);
    $(".modal-body #noagenda").val(noagenda);
    $(".modal-body #subbidang").val(idsubbid);
    $(".modal-body #staf").val(idstaf);
  });
</script>
<?php
include 'grafik.php';
?>