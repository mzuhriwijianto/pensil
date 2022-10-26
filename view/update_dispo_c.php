<?php
include '../bridge.php';
date_default_timezone_set("Asia/Bangkok");
if(isset($_POST['simpan'])){

    $idmail = $_POST['nosurat'];
    if(!empty($_FILES['lampiran'])){
        $dir ='lampiran/';  
        $nama    = basename($_FILES['lampiran']['name']);
        $file_type = strtolower(pathinfo($nama,PATHINFO_EXTENSION));
        $ukuran        = $_FILES['lampiran']['size'];
        $file_tmp    = $_FILES['lampiran']['tmp_name']; 
        $nama_baru = $id_project.$dispobid.'-'.$idmail.'-staf.'.$file_type;

        if($file_type != 'pdf'){
          echo "FILE Harus PDF";
        }else{
            if($ukuran > 5000000){
            echo "File Terlalu besar (di atas 5000Kb)";
            }else{
                 move_uploaded_file($_FILES['lampiran']['tmp_name'],$dir.$nama_baru);
            }
        }     
    }else{
      $nama_baru = '';
    }  


    if(!empty($_POST['notice'])){
    $tgl = date('Y-m-d h:i:s');
    $idx=$_POST['idx'];
    $idprojek=substr($idx,0,4);
    $idbid=$_POST['idbidang'];
    $idsbb=$_SESSION['idsubbidang'];;
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
    //echo ($nilaibaru);
    


    $query=mysqli_query($koneksi,"INSERT into t_apms_dispo_c(id_dispoc,id_project,id_bidang,id_subbidang,id_staff,no_surat,id_respon,notice,lampiran,tgl_kirim,userid)values(
        '$nilaibaru',
        '$idprojek',
        '$idbid',
        '$idsbb',
        '$staf',
        '$nosurat',
        '$respon',
        '$ntc',
        '$namabaru',
        '$tgl',
        '$user'
        )
      ");

    $cek_status = mysqli_query($koneksi,"SELECT * from t_apms_project WHERE no_surat='$nosurat' and status='1005'");
    $jml_cekstatus = mysqli_num_rows($cek_status);
    
    if($jml_cekstatus <> 0){
        $query2=mysqli_query($koneksi,"UPDATE t_apms_project SET status='1006' WHERE id_project='$idprojek' AND id_bidang='$idbid' AND no_surat='$nosurat'");
        
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
        $query3=mysqli_query($koneksi,"UPDATE t_apms_project SET status='1005' WHERE id_project='$idprojek' AND id_bidang='$idbid' AND no_surat='$nosurat'");
              echo "<script type='text/javascript'>
                          setTimeout(function(){
                            Swal.fire({
                              position: 'center-top',
                              icon: 'success',
                              title: 'Berhasil Reply Data',
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

}
?>