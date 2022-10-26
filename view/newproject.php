<?php
session_start();
include 'bridge.php';
$tglnow=date('Y-m-d H:i:s');
?>
<?php
if(!empty($_GET['add']) && $_GET['add']=='yes'){
  $idmail= $_POST['idsurat'];

  $cek_idsurat = mysqli_query($koneksi,"SELECT * from t_apms_project where no_surat='$idmail'");

  $jml_cek_idsurat=mysqli_fetch_array($cek_idsurat);

  if(!empty($jml_cek_idsurat[0])){
    echo "<script type='text/javascript'>
                      setTimeout(function(){
                        Swal.fire({
                          position: 'center-top',
                          icon: 'error',
                          title: 'Nomor Surat Sudah ada Sebelumnya',
                          showConfirmButton: false,
                          timer: 1500
                          });
                        },10);
                        window.setTimeout(function(){
                          document.location.href='index.php?page=addproject';
                          },1500);
                     </script>";
  }else{
      $cek_id_project = mysqli_query($koneksi,"SELECT max(id_project) as maxid from t_apms_project 
          where (substr(tgl_surat,1,4)='$tahun')");  

       $jml_cek_idproject = mysqli_num_rows($cek_id_project);
       $data2 = mysqli_fetch_array($cek_id_project);  

      if($data2[0] <> NULL || $data2[0] <> '0')
      {
        $nilaimax= $data2[0];
      }else{
        $nilaimax= 0;
      }

      $sortnum = intval($nilaimax);
      $n=$sortnum+1;
      $nilaibaru = sprintf("%04s", $n); //menambah 0 DI AWAL ANGKA
                                      
      $id_project = $nilaibaru;
      $status = '1000'; //dikirim
      $dispobid = $_POST['dispobid'];
      

      /* UPLOAD LAMPIRAN PDF*/
      
      if(!empty($_FILES['lampiran'])){
        $dir ='lampiran/';  
        $nama    = basename($_FILES['lampiran']['name']);
        $file_type = strtolower(pathinfo($nama,PATHINFO_EXTENSION));
        $ukuran        = $_FILES['lampiran']['size'];
        $file_tmp    = $_FILES['lampiran']['tmp_name']; 
        $nama_baru = $id_project.$dispobid.'-'.$idmail.'.'.$file_type;

        if($nama==''){
          echo "anda belum upload file lampiran";
        }else{
          if($file_type != 'pdf'){
            echo "FILE Harus PDF";
          }else{
            if($ukuran > 20000000){
              echo "File Terlalu besar (di atas 20 MB)";
            }else{
                 if(move_uploaded_file($_FILES['lampiran']['tmp_name'],$dir.$nama_baru)){

                  $sqlnya = mysqli_query($koneksi,"INSERT into t_apms_project(
                    id_project,
                    id_bidang,
                    id_subbidang,
                    id_staff,
                    no_surat,
                    tgl_surat,
                    tgl_terima,
                    pengirim,
                    judul,
                    status,
                    lampiran,
                    id_isidispo,
                    sifat,
                    no_agenda,
                    userid
                    )values(
                    '$id_project',
                    '".$_POST['dispobid']."',
                    '',
                    '',
                    '".$_POST['idsurat']."',
                    '".$_POST['tgl_surat']."',
                    '$tglnow',
                    '".$_POST['pengirim']."',
                    '".$_POST['judul']."',
                    '$status',
                    '$nama_baru',
                    '".$_POST['isidispo']."',
                    '".$_POST['sifat']."',
                    '".$_POST['noagenda']."',
                    '".$_SESSION['userid']."'
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
                          document.location.href='index.php?page=addproject';
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
                          document.location.href='index.php?page=addproject';
                          },1500);
                     </script>";
                   } 


                  }

            }
          }
        }

      }else{
        echo "iki";
      }
      
  }

}else
{
?>
<div class="col-md-12">
  <div class="callout callout-info">
                  <h5><i class="right fas fa-info-circle"></i> Perhatian :</h5>
                  <p>Menu ini digunakan untuk menginputkan Surat Masuk Baru.</p>
                </div>
  <div class="card card-info">
                <div class="card-header">
                  <h3 class="card-title">Entry Surat Masuk Baru</h3>
                </div>
                <!-- /.card-header -->
                <!-- form start -->
                <form action="index.php?page=addproject&add=yes" method="post" enctype="multipart/form-data">
                  <div class="card-body">
                    <div class="form-group">
                      <div class="row">
                          <div class="col-3">
                              <label>Pengirim</label>
                              <select class="form-control select2" name="pengirim" style="width:100%;height: auto;padding-top: 10px;border: 1px solid #ffffff;" required>
                                  <option value="">-- Pilih --</option>
                                <?php
                                  $sql=mysqli_query($koneksi,"SELECT * from t_apms_opd"); 
                                  while($hsl=mysqli_fetch_array($sql)){   
                                ?>
                                <option value="<?=$hsl[0];?>"><?=ucwords($hsl['nm_opd']);?></option>
                                <?php
                                  }
                                ?>
                              </select>
                          </div>
                          <div class="col-3">
                            <label for="exampleInputEmail1">Nomor Surat</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" autocomplete="off" placeholder="Masukkan Nomor Surat" name="idsurat" required>
                          </div>
                          <div class="col-3">
                            <label for="exampleInputEmail1">Nomor Agenda</label>
                            <input type="text" class="form-control" maxlength="8" exampleInputEmail1" placeholder="Masukkan Nomor Agenda" autocomplete="off" name="noagenda" required>
                          </div>
                        
                          <div class="col-3">
                            <label>Tanggal Surat</label>
                            <div class="input-group date" id="reservationdate" data-target-input="nearest">
                                <input type="text" name="tgl_surat" autocomplete="off" placeholder="Tanggal Surat" class="form-control datetimepicker-input" data-target="#reservationdate"required/>
                                <div class="input-group-append" data-target="#reservationdate" data-toggle="datetimepicker">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>
                            </div>
                          </div>  
                        </div>
                        <div class="row" style="margin-top:10px;">
                          <div class="col-4">
                               <label>Sifat</label>
                              <select class="form-control select2" name="sifat" required style="width:100%;height: auto;padding-top: 10px;border: 1px solid #ffffff;">
                                <option value="">-- Pilih --</option>
                                <?php
                              $sql2=mysqli_query($koneksi,"SELECT * from t_apms_sifatproject"); 
                              while($hsl2=mysqli_fetch_array($sql2)){   
                                ?>
                                <option value="<?=$hsl2[0]?>"><?=ucwords($hsl2['keterangan']);?></option>
                                <?php
                              }
                              ?>
                              </select>
                          </div>
                          <div class="col-4">
                            <label>Disposisi Bidang</label>
                            <select class="form-control select2" name="dispobid" required style="width:100%;height: auto;padding-top: 10px;border: 1px solid #ffffff;">
                              <?php
                              if(!empty($_SESSION['idbidang'])){
                                $sql=mysqli_query($koneksi,"SELECT * from t_apms_bidang where id_bidang='".$_SESSION['idbidang']."'"); 
                                while($hsl=mysqli_fetch_array($sql)){   
                                  echo "<option value='".$hsl[0]."'>".ucwords($hsl['nm_bidang'])."</option>";
                                  }
                              }else{
                                echo "<option value=''>-- Pilih --</option>";
                                $sql=mysqli_query($koneksi,"SELECT * from t_apms_bidang"); 
                                while($hsl=mysqli_fetch_array($sql)){   
                                   echo "<option value='".$hsl[0]."'>".ucwords($hsl['nm_bidang'])."</option>";
                                  }
                              }
                              ?>
                            </select>
                          </div>
                           <div class="col-4">
                            <label>Isi Disposisi</label>
                            <select class="form-control select2" name="isidispo" required style="width:100%;height: auto;padding-top: 10px;border: 1px solid #ffffff;">
                              <option value="">-- Pilih --</option>
                              <?php
                              $sql=mysqli_query($koneksi,"SELECT * from t_apms_isidispo"); 
                              while($hsl=mysqli_fetch_array($sql)){   
                                ?>
                                <option value="<?=$hsl[0]?>"><?=ucwords($hsl['isi_disposisi']);?></option>
                                <?php
                              }
                              ?>
                            </select>
                          </div>  
                        </div>
                    </div>  
                    <div class="form-group">
                      <label for="exampleInputEmail1">Judul</label>
                      <input type="text" class="form-control" autocomplete="off" id="exampleInputEmail1" placeholder="Ketikkan Judul Surat" name="judul" required>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputFile">File Lampiran</label>
                      <div class="input-group">
                       <div class="custom-file">
                        <input type="file" class="custom-file-input" id="customFile" name="lampiran" required>
                        <label class="custom-file-label" for="customFile">File Scan Surat</label>
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
  </div>

</div>
<?php 
}
?>
