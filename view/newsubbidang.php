<?php
session_start();
include 'bridge.php';
$tglnow=date('Y-m-d H:i:s');
?>
<div class="col-md-12">
<?php
//HAPUS DATA
if(isset($_GET['rem'])){
  if(!empty($_GET['rem'])){
    $id = $_GET['rem'];
    
    if($sql_delete = mysqli_query($koneksi,"DELETE from t_apms_bidang WHERE id_bidang='".$id."'")){
      
       echo "<div class='alert alert-success alert-dismissible'>
                  <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                  <h5><i class='icon fas fa-check'></i> Berhasil Delete Data!</h5>
            </div>";
         
    }else{
       echo "<div class='alert alert-danger alert-dismissible'>
                  <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                  <h5><i class='icon fas fa-check'></i> Gagal Delete Data!</h5>
            </div>";
    } 

  }
}

if(!empty($_GET['add']) && $_GET['add']=='yes'){

   $cek_id_bidang = mysqli_query($koneksi,"SELECT max(id_bidang) as maxid from t_apms_bidang");  

   $jml_cek_idbidang = mysqli_num_rows($cek_id_bidang);
   $data2 = mysqli_fetch_array($cek_id_bidang);  

  if($data2[0] <> NULL || $data2[0] <> '0')
  {
    $nilaimax= $data2[0];
  }else{
    $nilaimax= 0;
  }

  $sortnum = intval($nilaimax);
  $n=$sortnum+1;
  $nilaibaru = $n; //menambah 0 DI AWAL ANGKA
                                  
  $id_bidang = $nilaibaru;
 
 
  $sqlnya = mysqli_query($koneksi,"INSERT into t_apms_bidang(
                id_bidang,
                nm_bidang
                )values(
                '$id_bidang',
                '".$_POST['bidang']."'
              )");

               if($sqlnya){
                 $_SESSION['alert']="Sukses";
                 echo "<script type='text/javascript'>
                  setTimeout(function(){
                    Swal.fire({
                      position: 'center-top',
                      icon: 'success',
                      title: 'Berhasil Insert Data Surat Masuk',
                      showConfirmButton: false,
                      timer: 1500
                      });
                    },10);
                    window.setTimeout(function(){
                      document.location.href='index.php?page=addbidang';
                      },1500);
                 </script>";
               }else{
                echo "<script type='text/javascript'>
                  setTimeout(function(){
                    Swal.fire({
                      position: 'center-top',
                      icon: 'error',
                      title: 'Gagal Insert Data',
                      showConfirmButton: false,
                      timer: 1500
                      });
                    },10);
                    window.setTimeout(function(){
                      document.location.href='index.php?page=addbidang';
                      },1500);
                 </script>";
               } 



 
 
}else
{
?>

  <div class="callout callout-success">
                  <h5><i class="right fas fa-info-circle"></i> Perhatian :</h5>
                  <p>Menu ini digunakan untuk menginputkan Bidang Baru.</p>
                </div>
  <div class="card card-success">
                <div class="card-header">
                  <h3 class="card-title">Entry Bidang Baru</h3>
                </div>
                <!-- /.card-header -->
                <!-- form start -->
                <form action="index.php?page=addbidang&add=yes" method="post" enctype="multipart/form-data">
                  <div class="card-body">
                    <div class="form-group">
                      <div class="row">
                          <div class="col-12">
                            <label for="exampleInputEmail1">Nama Bidang</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" autocomplete="off" placeholder="Nama Bidang" name="bidang" required>
                          </div>
                      </div>
                    </div>
                  </div>
                  <!-- /.card-body -->
                  <div class="card-footer">
                    <input type="submit" class="btn btn-primary" value="Simpan">
                     <input type="reset" class="btn btn-danger" value="Reset">
                  </div>
              </div>
                </form>
    <div class="card">
              <div class="card-header">
                <h3 class="card-title">List Data Bidang</h3>
              </div>

              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                    <?php
                    $sql = mysqli_query($koneksi,"SELECT * from t_apms_bidang");
                    ?>
                    <tr align="center">
                      <th>ID Bidang</th>
                      <th>Nama Bidang</th>
                      <th>Aksi</th>
                    </tr>
                  </thead>
                   <tbody>
                    <?php
                    while($dt=mysqli_fetch_array($sql)){ 
                    ?>
                    <tr align="center">
                      <td><?=$dt[0];?></td>
                      <td align="left"><?=ucwords($dt[1]);?></td> 
                      <td>
                        <a href="index.php?page=addbidang&rem=<?=$dt[0];?>" id="btn-hapus"><i class="nav-icon fas fa-solid fa-trash"></i></a>
                      </td>
                    </tr>
                    <?php
                    } 
                    ?>
                   </tbody>
                 </table> 
    </div>               
            
  </div>
 
</div>

<?php 
}
?>

