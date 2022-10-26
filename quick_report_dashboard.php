<!-- Info boxes -->
<?php
//kaban dan admin
$jab = $_SESSION['akses'];
$bid = $_SESSION["idbidang"];

if($_SESSION['akses']=='1' || $_SESSION['akses']=='9' || $_SESSION['akses']=='5'){
  $all_project = "SELECT * from t_apms_project";
  $blm_progres = "SELECT * from t_apms_project where status='1000'";
  $sdg_progres = "SELECT * from t_apms_project where status > '1000' and status < '1010'";
  $sdh_selesai = "SELECT * from t_apms_project where status = '1010'";
}elseif($_SESSION['akses']=='2') {
  $all_project = "SELECT * from t_apms_project where id_bidang='$bid'";
  $blm_progres = "SELECT * from t_apms_project where id_bidang='$bid' and status='1000'";
  $sdg_progres = "SELECT * from t_apms_project where id_bidang='$bid' and status > '1000' and status < '1010'";
  $sdh_selesai = "SELECT * from t_apms_project where id_bidang='$bid' and status = '1010'";
}elseif($_SESSION['akses']=='3') {
  $all_project = "SELECT * from t_apms_project where id_bidang='$bid' and id_subbidang='".$_SESSION['idsubbidang']."'";
  $blm_progres = "SELECT * from t_apms_project where id_bidang='$bid' and id_subbidang='".$_SESSION['idsubbidang']."' and status='1002'";
  $sdg_progres = "SELECT * from t_apms_project where id_bidang='$bid' and id_subbidang='".$_SESSION['idsubbidang']."' and status > '1002' and status < '1010'";
  $sdh_selesai = "SELECT * from t_apms_project where id_bidang='$bid' and id_subbidang='".$_SESSION['idsubbidang']."' and status = '1010'";
}elseif($_SESSION['akses']=='4') {
  $all_project = "SELECT * from t_apms_project where id_bidang='$bid' and id_subbidang='".$_SESSION['idsubbidang']."' and id_staff='".$_SESSION['idstaff']."' ";
  $blm_progres = "SELECT * from t_apms_project where id_bidang='$bid' and id_subbidang='".$_SESSION['idsubbidang']."' and id_staff='".$_SESSION['idstaff']."' and status='1004'";
  $sdg_progres = "SELECT * from t_apms_project where id_bidang='$bid' and id_subbidang='".$_SESSION['idsubbidang']."' and id_staff='".$_SESSION['idstaff']."' and status >= '1005' and status < '1010'";
  $sdh_selesai = "SELECT * from t_apms_project where id_bidang='$bid' and id_subbidang='".$_SESSION['idsubbidang']."' and id_staff='".$_SESSION['idstaff']."' and status = '1010'";
}else{}

?>
        <div class="row" style="font-size:20px;font-family: calibri;">
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box">
              <span class="info-box-icon bg-info elevation-1"><i class="fas fa-database"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Jumlah Surat Masuk</span>
                <span class="info-box-number">
                  <?php
                  $sqlnya = mysqli_query($koneksi,$all_project);
                  $jml = mysqli_num_rows($sqlnya);
                  echo $jml;
                  ?>
                  <small>Project</small>
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-success elevation-1"><i class="fas fa-thumbs-up"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Sudah diselesaikan</span>
                <span class="info-box-number">
                  <?php
                  $sqlnya2 = mysqli_query($koneksi,$sdh_selesai);
                  $jml2 = mysqli_num_rows($sqlnya2);
                  echo $jml2;
                  ?>
                  <small>Project</small>
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->

          <!-- fix for small devices only -->
          <div class="clearfix hidden-md-up"></div>

          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-warning elevation-1"><i class="fas fa-hourglass-half"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Sedang diproses</span>
                <span class="info-box-number">
                  <?php
                  $sqlnya2 = mysqli_query($koneksi,$sdg_progres);
                  $jml2 = mysqli_num_rows($sqlnya2);
                  echo $jml2;
                  ?>
                  <small>Project</small>
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-danger elevation-1"><i class="fas fa-exclamation"></i></span>
              <?php
                $sql_blm_proses = mysqli_query($koneksi,$blm_progres);
                $jml_blm_proses = mysqli_num_rows($sql_blm_proses);
              ?>
              <div class="info-box-content">
                <span class="info-box-text">Belum diproses</span>
                <span class="info-box-number"><?=$jml_blm_proses;?>
                <small>Project</small>
              </span>
              </div>
              <!-- /.info-box-content -->
            </div>
           </div>
          </div>
<!-- /.info-box -->
<!-- PIE CHART -->
<div class="row" style="font-size:20px;font-family: calibri;">
  <div class="col-12 col-sm-6 col-md-6">
            <div class="card card-success">
              <div class="card-header">
                <h3 class="card-title">Surat Masuk <?php
              if(!empty($_SESSION['idbidang'])){
              $sql_bid = mysqli_query($koneksi,"SELECT nm_bidang from t_apms_bidang where id_bidang='".$_SESSION['idbidang']."'");
              $dt = mysqli_fetch_array($sql_bid);
              echo ucwords($dt[0]);
              }
              ?></h3>
                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <div>
                <canvas id="subbid"></canvas>
              </div>
              <!-- /.card-body -->
            </div>
  </div>
  <div class="col-12 col-sm-6 col-md-6">
            <div class="card" style="background-color:#FFC107;">
              <div class="card-header">
                <h3 class="card-title">Chart By Sifat Surat <?php
              if(!empty($_SESSION['idbidang'])){
              $sql_bid = mysqli_query($koneksi,"SELECT nm_bidang from t_apms_bidang where id_bidang='".$_SESSION['idbidang']."'");
              $dt = mysqli_fetch_array($sql_bid);
              echo ucwords($dt[0]);
              }
              ?></h3>
                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <div style="background-color:#ffffff;">
                <canvas id="sifat_surat"></canvas>
              </div>
              <!-- /.card-body -->
            </div>
  </div>
</div>
<?php
if($_SESSION['akses']=='2' || $_SESSION['akses']=='3' || $_SESSION['akses']=='4' || $_SESSION['akses']=='5'){
?>
<!-- PIE CHART PER SUBBID-->
<div class="row" style="font-size:20px;font-family: calibri;">
  <?php
$cek_subbid = mysqli_query($koneksi,"SELECT * from t_apms_subbidang WHERE id_bidang='".$_SESSION['idbidang']."'");
$jml_ceksubbid = mysqli_num_rows($cek_subbid);
$col = 12/$jml_ceksubbid;
while($hasilnya=mysqli_fetch_array($cek_subbid)){
    $all_project_subbid = "SELECT * from t_apms_project where id_bidang='$bid' and id_subbidang='".$hasilnya['id_subbid']."'";
    $blm_progres_subbid = "SELECT * from t_apms_project where id_bidang='$bid' and id_subbidang='".$hasilnya['id_subbid']."' and (status > '1001' and status <='1003')";
    $sdg_progres_subbid = "SELECT * from t_apms_project where id_bidang='$bid' and id_subbidang='".$hasilnya['id_subbid']."' and status >= '1004' and status < '1010'";
    $sdh_selesai_subbid = "SELECT * from t_apms_project where id_bidang='$bid' and id_subbidang='".$hasilnya['id_subbid']."' and status = '1010'";

  ?>
  <div class="col-12 col-sm-<?=$col;?> col-md-<?=$col;?>">
            <!-- /.card -->
            <div class="card">
              <div class="card-header" style="background-color:<?=$hasilnya['warna'];?>;color: #ffffff;">
                <h3 class="card-title"><b><?=ucwords($hasilnya['nm_subbid']);?></b></h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th style="width: 10px">No</th>
                      <th>Keterangan</th>

                      <th style="width: 40px">Jumlah</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1.</td>
                      <td>Total Surat Masuk</td>

                      <td><span class="badge bg-info">
                        <?php
                        $sql1 = mysqli_query($koneksi,$all_project_subbid);
                        $jml1 = mysqli_num_rows($sql1);
                        echo $jml1;
                        ?>
                  </span></td>
                    </tr>
                    <tr>
                      <td>2.</td>
                      <td>Sudah Diselesaikan</td>

                      <td><span class="badge bg-success">
                        <?php
                        $sql2 = mysqli_query($koneksi,$sdh_selesai_subbid);
                        $jml2 = mysqli_num_rows($sql2);
                        echo $jml2;
                        ?>
                      </span></td>
                    </tr>
                    <tr>
                      <td>3.</td>
                      <td>Sedang Diproses</td>

                      <td><span class="badge bg-warning">
                        <?php
                        $sql3 = mysqli_query($koneksi,$sdg_progres_subbid);
                        $jml3 = mysqli_num_rows($sql3);
                        echo $jml3;
                        ?>
                      </span></td>
                    </tr>
                    <tr>
                      <td>4.</td>
                      <td>Belum Diproses</td>

                      <td><span class="badge bg-danger">
                        <?php
                        $sql4 = mysqli_query($koneksi,$blm_progres_subbid);
                        $jml4 = mysqli_num_rows($sql4);
                        echo $jml4;
                        ?></span></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
  </div>
  <?php
}
  ?>
</div>
<?php
}else{}
?>
