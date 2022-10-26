<?php
include '../bridge.php';
date_default_timezone_set("Asia/Bangkok");
if(isset($_POST['simpan'])){
    $tgl = date('Y-m-d h:i:s');
    $idx=$_POST['idx'];
    $idprojek=substr($idx,0,4);
    $idbid=$_POST['idbidang'];
    $idsbb=$_SESSION['idsubbidang'];
    $ntc =nl2br($_POST['notice']);
    $respon =$_POST['respon'];
    $nosurat=$_POST['nosurat'];
    $staf=$_POST['idstaf'];
    $user = $_SESSION["userid"];
   

    $cek_id = mysqli_query($koneksi,"SELECT max(id_dispoc) as maxid from t_apms_dispo_c where no_surat='$nosurat'");
    $data_id = mysqli_fetch_array($cek_id);
    
    if($data_id[0] <> NULL || $data_id[0] <> '0'){
      $nilaimax = $data_id[0];
    }else{
      $nilaimax =  0;
    }
    

    $sortnum = intval($nilaimax);
    $n=$sortnum+1;
    $nilaibaru = sprintf("%06s",$n);
    $id_project = $nilaibaru;
    
    if(!empty($_FILES['lampiran'])){
        $idmail = $_POST['nosurat'];
        $ekstensi_diperbolehkan = array('pdf','jpeg','jpg');
        $dir ='lampiran/';  
        $nama    = basename($_FILES['lampiran']['name']);
        $file_type = strtolower(pathinfo($nama,PATHINFO_EXTENSION));
        $ukuran        = $_FILES['lampiran']['size'];
        $file_tmp    = $_FILES['lampiran']['tmp_name']; 
        $nama_baru = $id_project.$dispobid.'-'.$idmail.'-staf.'.$file_type;


        if(empty($file_type)){
            $pesan = "Harus Upload Lampiran Hasil Kerja";
            $error = 1;
        }else{
            if(in_array($file_type,$ekstensi_diperbolehkan)===false){
                $pesan = "Dilarang Upload ".$file_type.", FILE Harus PDF/jpeg";
                $error = 1;
            }else{
                if($ukuran > 20000000){
                  $pesan ="File Terlalu besar (di atas 20000Kb)";
                  $error = 1;
                }else{
                  $error = 0;
                  //$pesan ="File ANDA SUDAH BENAR ".$file_type;
                  #hapus dahulu file lampiran yg revisi
                  
                  $cek_lamp_c = mysqli_query($koneksi,"SELECT lampiran,id_dispoc FROM t_apms_dispo_c WHERE no_surat='$nosurat' and lampiran <> ''");
                  $datalamp_c = mysqli_fetch_array($cek_lamp_c);
                  $linklamp_c = "lampiran/".$datalamp_c[0];

                  $update_lamp_dispo_revisi=mysqli_query($koneksi,"UPDATE t_apms_dispo_c SET lampiran='' WHERE id_dispoc='".$datalamp_c[1]."' AND id_project='$idprojek' AND id_bidang='$idbid' AND no_surat='$nosurat'");

                  unlink($linklamp_c); 
                
                  move_uploaded_file($_FILES['lampiran']['tmp_name'],$dir.$nama_baru);
                }
            }
        }
            
    }else{
       $pesan = "Error File Lampiran";
       $error = 1;
    }

    
    if($error==0){
      echo $pesan;
      
      $query=mysqli_query($koneksi,"INSERT into t_apms_dispo_c(id_dispoc,id_project,id_bidang,id_subbidang,id_staff,no_surat,id_respon,notice,lampiran,tgl_kirim,userid)values(
          '$nilaibaru',
          '$idprojek',
          '$idbid',
          '$idsbb',
          '$staf',
          '$nosurat',
          '$respon',
          '$ntc',
          '$nama_baru',
          '$tgl',
          '$user'
          )
        ");


      if($query){
        $cek_status = mysqli_query($koneksi,"SELECT * from t_apms_project WHERE no_surat='$nosurat' and (status='1005' or status='1009')");
        $jml_cekstatus = mysqli_num_rows($cek_status);

        if($jml_cekstatus <> 0){
          $query2=mysqli_query($koneksi,"UPDATE t_apms_project SET status='1007' WHERE id_project='$idprojek' AND id_bidang='$idbid' AND no_surat='$nosurat'");
          
                 echo "<script type='text/javascript'>
                      setTimeout(function(){
                        Swal.fire({
                          position: 'center-top',
                          icon: 'success',
                          title: 'Berhasil Disposisi Data ke Staf',
                          showConfirmButton: false,
                          timer: 1500
                          });
                        },10);
                        window.setTimeout(function(){
                          document.location.href='index.php?page=showproject';
                          },1500);
                     </script>";
          
          }else{ 
              echo "persib";
          }

      
      }else{
           echo "<script type='text/javascript'>
                      setTimeout(function(){
                        Swal.fire({
                          position: 'center-top',
                          icon: 'error',
                          title: 'Gagal Reply Staf',
                          showConfirmButton: false,
                          timer: 1500
                          });
                        },10);
                        window.setTimeout(function(){
                          document.location.href='index.php?page=showproject';
                          },1500);
                     </script>";
      }
      
    }else{
        echo "<script type='text/javascript'>
                    setTimeout(function(){
                      Swal.fire({
                        position: 'center-top',
                        icon: 'error',
                        title: 'Gagal Reply Staf => ".$pesan."',
                        showConfirmButton: false,
                        timer: 1500
                        });
                      },10);
                      window.setTimeout(function(){
                        document.location.href='index.php?page=showproject';
                        },1500);
                   </script>";
    }


}
?>

