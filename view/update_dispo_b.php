<?php
include '../bridge.php';
date_default_timezone_set("Asia/Bangkok");
if(isset($_POST['simpan'])){
  if(!empty($_POST['notice'])){
  
  $tgl = date('Y-m-d h:i:s');
  $idx=$_POST['idx'];
  $idprojek=substr($idx,0,4);
  $idbid=$_POST['idbidang'];
  $idsbb=$_POST['idsubbidang'];
  $ntc =nl2br($_POST['notice']);
  $nosurat=$_POST['nosurat'];
  $staf=$_POST['staf'];
  $user = $_SESSION["userid"];

  $cek_id = mysqli_query($koneksi,"SELECT max(id_dispob) as maxid,id_staff,id_subbidang from t_apms_dispo_b where no_surat='$nosurat'");
  $data_id = mysqli_fetch_array($cek_id);
  
  if(is_null($data_id[0]) || $data_id[0]  === NULL){
    //BELUM ADA DISPO
    $nilaimax =  0;
    $status = '1004';
    $respon = '';
    $err = '1';
    
  }else{
      //SUDAH ADA DISPO
      $respon = $_POST['respon'];
      $staf = $data_id['id_staff'];
      $idsbb = $data_id['id_subbidang'];
      $nilaimax = $data_id[0];
      if($respon=='5'){
        $status = '1005';
      }elseif($respon=='4'){
        $status = '1008';
      }else{
        $status = '1007';
      }
      $err = '2';
   }
  

  $sortnum = intval($nilaimax);
  $n=$sortnum+1;
  $nilaibaru = sprintf("%06s",$n);
    
  $query=mysqli_query($koneksi,"INSERT into t_apms_dispo_b(id_dispob,id_project,id_bidang,id_subbidang,id_staff,no_surat,id_respon,notice,lampiran,tgl_kirim,userid)values(
      '$nilaibaru',
      '$idprojek',
      '$idbid',
      '$idsbb',
      '$staf',
      '$nosurat',
      '$respon',
      '$ntc',
      '',
      '$tgl',
      '$user'
      )"
  );

  $query2=mysqli_query($koneksi,"UPDATE t_apms_project SET status='$status',id_staff='$staf' WHERE id_project='$idprojek' AND id_bidang='$idbid' AND no_surat='$nosurat'");
  
   if($err==='1'){
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
       echo "<script type='text/javascript'>
                  setTimeout(function(){
                    Swal.fire({
                      position: 'center-top',
                      icon: 'success',
                      title: 'Sukses Validasi',
                      showConfirmButton: false,
                      timer: 1500
                      });
                    },10);
                    window.setTimeout(function(){
                      document.location.href='index.php?page=showvalidasi';
                      },1500);
                 </script>";
    }             
  }
}
?>