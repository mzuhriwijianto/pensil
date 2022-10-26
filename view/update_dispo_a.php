<?php
include '../bridge.php';
date_default_timezone_set("Asia/Bangkok");
if(isset($_POST['simpan'])){
  if(!empty($_POST['notice'])){
  
  $tgl = date('Y-m-d h:i:s');
  $idx=$_POST['idx'];
  $idprojek=substr($idx,0,4);
  $idbid=$_POST['idbidang'];
  $idsbb=$_POST['subbid'];
  $ntc =nl2br($_POST['notice']);
  $nosurat=$_POST['nosurat'];
  $user = $_SESSION["userid"];
  

  $cek_id = mysqli_query($koneksi,"SELECT max(id_dispoa) as maxid,id_subbidang from t_apms_dispo_a where id_project='$idprojek' and id_bidang='$idbid' and no_surat='$nosurat'");
  $data_id = mysqli_fetch_array($cek_id);
  
  if(is_null($data_id[0]) || $data_id[0]  === NULL){
    $nilaimax =  0;
    $status = '1002';
    $respon = '';
    $err = '1';
  }else{
    $nilaimax = $data_id[0];
    $idsbb = $data_id[1];
    $respon = $_POST['respon'];
    if($respon=='6'){
      $status = '1010';
    }elseif($respon=='7'){
      $status = '1009';
    }
    $err = '2';
  }
  

  $sortnum = intval($nilaimax);
  $n=$sortnum+1;
  $nilaibaru = sprintf("%06s",$n);
  /*
  echo 'NILAI BARU ='.($nilaibaru).'<br>';
  echo 'STATUS ='.($status).'<br>';
  echo 'PROJECT ='.$idprojek.'<br>';
  echo 'BIDANG ='.$idbid.'<br>';
  echo 'SUBBIDANG ='.$idsbb.'<br>';
  echo 'Ntc ='.$ntc.'<br>';
  echo 'NO SURAT ='.$nosurat.'<br>';
  echo 'ERROR ='.$err.'<br>'; 
   */
  $query=mysqli_query($koneksi,"INSERT into t_apms_dispo_a(id_dispoa,id_project,id_bidang,id_subbidang,no_surat,id_respon,notice,lampiran,tgl_kirim,userid)values(
      '$nilaibaru',
      '$idprojek',
      '$idbid',
      '$idsbb',
      '$nosurat',
      '$respon',
      '$ntc',
      '',
      '$tgl',
      '$user'
      )
    ");

  $query2=mysqli_query($koneksi,"UPDATE t_apms_project SET status='$status',id_subbidang='$idsbb' WHERE id_project='$idprojek' AND id_bidang='$idbid' AND no_surat='$nosurat'");
  
  
  if($err==='1'){
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