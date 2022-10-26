<?php
session_start();
?>
<!-- Content Wrapper. Contains page content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            

<?php
//HAPUS DATA
if(isset($_GET['rem'])){
  if(!empty($_GET['rem'])){
    $id = $_GET['rem'];
    $nosurat = explode('-',$id);
    $cek_lamp = mysqli_query($koneksi,"SELECT lampiran FROM t_apms_project WHERE no_surat='".$nosurat[1]."'");
    $cek_lamp_c = mysqli_query($koneksi,"SELECT lampiran FROM t_apms_dispo_c WHERE no_surat='".$nosurat[1]."' and lampiran <> ''");

    $datalamp = mysqli_fetch_array($cek_lamp);
    $datalamp_c = mysqli_fetch_array($cek_lamp_c);
    
    $linklamp = "lampiran/".$datalamp[0];
    $linklamp_c = "lampiran/".$datalamp_c[0];

    if($sql_delete = mysqli_query($koneksi,"DELETE from t_apms_project WHERE no_surat='".$nosurat[1]."'")){
      $cek_dispoa = mysqli_query($koneksi,"DELETE from t_apms_dispo_a WHERE no_surat='".$nosurat[1]."'");
      $cek_dispob = mysqli_query($koneksi,"DELETE from t_apms_dispo_b WHERE no_surat='".$nosurat[1]."'");
      $cek_dispoc = mysqli_query($koneksi,"DELETE from t_apms_dispo_c WHERE no_surat='".$nosurat[1]."'");

       unlink($linklamp);
       unlink($linklamp_c); 


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

  }else{}
}
?>
            <!-- /.card -->
            <div class="card">
              <div class="card-header" style="background-color: #83d56e; color: #000000;">
                <h3 class="card-title">List Data Surat Masuk
              <?php 
              if(!empty($_SESSION['idbidang'])){
              $sql_bid = mysqli_query($koneksi,"SELECT nm_bidang from t_apms_bidang where id_bidang='".$_SESSION['idbidang']."'");
              $dt = mysqli_fetch_array($sql_bid);
              echo ucwords($dt[0]);
              }
              ?></h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <?php 
                    $bid = $_SESSION["idbidang"];
                    if($_SESSION['akses']=='1' || $_SESSION['akses']=='9'){
                    $menu = 1;  
                    $sql_project = mysqli_query($koneksi,"SELECT 
                      a.id_project,
                      a.id_bidang,
                      a.no_surat as nosurat,
                      a.pengirim,
                      a.tgl_surat as tgl_surat,
                      a.tgl_terima,
                      a.judul as judul,
                      a.status,
                      a.lampiran as file,
                      a.no_agenda,
                      b.nm_bidang as nm_bidang,
                      c.ket_status as status,
                      d.nm_opd as pengirim,
                      e.isi_disposisi as isidispo
                      from t_apms_project a inner join t_apms_bidang b on a.id_bidang=b.id_bidang 
                      inner join t_apms_status c on a.status=c.id_status
                      inner join t_apms_opd d on a.pengirim=d.id_opd
                      inner join t_apms_isidispo e on a.id_isidispo=e.id_isidispo
                     
                      ");
                    }elseif($_SESSION['akses']=='2'){
                      $menu = 2;
                      $sql_project = mysqli_query($koneksi,"SELECT 
                      a.id_project,
                      a.id_bidang as idbidang,
                      a.no_surat as nosurat,
                      a.pengirim,
                      a.tgl_surat as tgl_surat,
                      a.tgl_terima as tgl_terima,
                      a.judul as judul,
                      a.status as kdstatus,
                      a.lampiran as file,
                      a.no_agenda,
                      b.nm_bidang as nm_bidang,
                      c.ket_status as status, 
                      d.nm_opd as pengirim,
                      e.isi_disposisi as isidispo,
                      f.keterangan as ket
                      from t_apms_project a inner join t_apms_bidang b on a.id_bidang=b.id_bidang 
                      inner join t_apms_status c on a.status=c.id_status
                      inner join t_apms_opd d on a.pengirim=d.id_opd
                      inner join t_apms_isidispo e on a.id_isidispo=e.id_isidispo
                      inner join t_apms_sifatproject f on a.sifat=f.id_sifatproject
                      where a.id_bidang='$bid'
                     
                      ");
                    }elseif($_SESSION['akses']=='3'){
                      $menu = 3;
                    $sql_project = mysqli_query($koneksi,"SELECT
                                          a.id_project,
                                          a.id_bidang as idbidang,
                                          a.no_surat as nosurat,
                                          a.pengirim,
                                          a.tgl_surat as tgl_surat,
                                          a.tgl_terima as tgl_terima,
                                          a.judul as judul,
                                          a.status as kdstatus,
                                          a.lampiran as file,
                                          a.no_agenda,
                                          a.id_subbidang as idsubbidang,
                                          b.nm_bidang as nm_bidang,
                                          c.ket_status as status, 
                                          d.nm_opd as pengirim,
                                          e.isi_disposisi as isidispo,
                                          f.keterangan as ket
                                          from t_apms_project a inner join t_apms_bidang b on a.id_bidang=b.id_bidang 
                                          inner join t_apms_status c on a.status=c.id_status
                                          inner join t_apms_opd d on a.pengirim=d.id_opd
                                          inner join t_apms_isidispo e on a.id_isidispo=e.id_isidispo
                                          inner join t_apms_sifatproject f on a.sifat=f.id_sifatproject
                                          where a.id_bidang='$bid' and a.id_subbidang='".$_SESSION['idsubbidang']."'                      
                                          ");

                    }elseif($_SESSION['akses']=='4'){
                      $menu = 4;
                      
                      $sql_project = mysqli_query($koneksi,"SELECT
                      a.id_project,
                      a.id_bidang as idbidang,
                      a.no_surat as nosurat,
                      a.pengirim,
                      a.tgl_surat as tgl_surat,
                      a.tgl_terima as tgl_terima,
                      a.judul as judul,
                      a.status as kdstatus,
                      a.lampiran as file,
                      a.no_agenda,
                      a.id_subbidang,
                      a.id_staff,
                      b.nm_bidang as nm_bidang,
                      c.ket_status as status, 
                      d.nm_opd as pengirim,
                      e.isi_disposisi as isidispo,
                      f.keterangan as ket
                     
                      from t_apms_project a inner join t_apms_bidang b on a.id_bidang=b.id_bidang 
                      inner join t_apms_status c on a.status=c.id_status
                      inner join t_apms_opd d on a.pengirim=d.id_opd
                      inner join t_apms_isidispo e on a.id_isidispo=e.id_isidispo
                      inner join t_apms_sifatproject f on a.sifat=f.id_sifatproject
                      
                      where a.id_bidang='$bid' and a.id_subbidang='".$_SESSION['idsubbidang']."' and a.id_staff='".$_SESSION['idstaff']."'                      
                      ");

                    }elseif($_SESSION['akses']=='5'){
                      $menu = 5;  
                      $sql_project = mysqli_query($koneksi,"SELECT 
                      a.id_project,
                      a.id_bidang,
                      a.no_surat as nosurat,
                      a.pengirim,
                      a.tgl_surat as tgl_surat,
                      a.tgl_terima,
                      a.judul as judul,
                      a.status,
                      a.lampiran as file,
                      a.no_agenda,
                      b.nm_bidang as nm_bidang,
                      c.ket_status as status,
                      d.nm_opd as pengirim,
                      e.isi_disposisi as isidispo,
                      f.keterangan as sifat
                      from t_apms_project a inner join t_apms_bidang b on a.id_bidang=b.id_bidang 
                      inner join t_apms_status c on a.status=c.id_status
                      inner join t_apms_opd d on a.pengirim=d.id_opd
                      inner join t_apms_isidispo e on a.id_isidispo=e.id_isidispo
                      inner join t_apms_sifatproject f on a.sifat=f.id_sifatproject
                     
                        ");
                    }else{}
                    ?>
                    <thead>
                    <?php 
                    /* USER KABAN dan ADMIN*/
                    if($menu=='1'){ 
                    ?>
                    <tr align="center">
                      <th>ID Project</th>
                      <th>Pengirim</th>
                      <th>Tgl. Surat</th>
                      <th>Judul</th>
                      <th>Bidang</th>
                      <th>Disposisi</th>
                      <th>Lampiran</th>
                      <th>Status</th>
                      <th>Aksi</th>
                    </tr>
                    </thead>
                    <tbody>
                      <?PHP
                      while($dtnya = mysqli_fetch_array($sql_project)) 
                      {
                      ?>
                    <tr>
                      <td align="center"><a href=""><?=$dtnya[0];?></a></td>
                      <td><?=strtoupper($dtnya['pengirim']);?></td>
                      <td align="center"><?=$dtnya['tgl_surat'];?></td>
                      <td><?=ucwords(strtolower($dtnya['judul']));?></td>
                      <td><?=ucwords($dtnya['nm_bidang']);?></td>
                      <td><?=ucwords($dtnya['isidispo']);?></td>
                      <td><i class="nav-icon fas fa-file-pdf-o"></i>&nbsp;<a href="lampiran/<?=$dtnya['file']?>" target="_blank">Lihat File</a></td>
                      <td><?=ucwords($dtnya['status']);?></td>
                      <td align="center">
                        <a href="index.php?page=showproject&rem=<?=$dtnya[0].'-'.$dtnya['nosurat'];?>" id="btn-hapus"><i class="nav-icon fas fa-solid fa-trash"></i></a>
                        <i class="nav-icon fas fa-solid fa-address-book"></i>
                      </td>
                    </tr>
                    <?php
                      }
                    }elseif($menu=='2'){/* USER KABID*/
                      ?>
                    <tr align="center">
                      <th>ID Project</th>
                      <th>Pengirim</th>
                      <th>Tgl. Surat</th>
                      <th>Judul</th>
                      <th>Disposisi</th>
                      <th>Sub Bidang</th>
                      <th>Sifat</th>
                      <th>Lampiran</th>
                      <th>Status</th>
                      <th>Waktu</th>
                      <th>Aksi</th>
                    </tr>
                    </thead>
                    <tbody>
                      <?PHP
                      while($dtnya = mysqli_fetch_array($sql_project)) 
                      {
                        $idx= $dtnya[0].'#'.$dtnya[1].'#'.$dtnya[2];
                      ?> <tr> <td align="center"><a
                         href="index.php?page=timeline&id=<?=$dtnya
                         [0];?>"><?=$dtnya[0];?></a></td> <td><?=strtoupper
                         ($dtnya['pengirim']);?></td> <td
                         align="center"><?=$dtnya
                         ['tgl_surat'];?></td> <td><?=ucwords(strtolower
                         ($dtnya['judul']));?></td><td align="center">
                          <a href="view/create_pdf.php?id=<?=$dtnya['nosurat']?>&p=<?=$dtnya[0]?>" target="_blank"><i class="nav-icon fas fa-regular fa-file-pdf"></i></a></td> <!--LAMPIRAN DISPOSISI--> 
                         <td align="center"> <?php
                         $cek_dispoa = mysqli_query
                         ($koneksi,"SELECT id_dispoa from t_apms_dispo_a
                         where id_project='".$dtnya[0]."' and
                         id_bidang='".$dtnya['idbidang']."'
                          ");
                        $show=0;
                        $jml_cek_dispoa = mysqli_num_rows($cek_dispoa);
                        if($jml_cek_dispoa>0){
                          $show=1;
                            $query=mysqli_query($koneksi,"SELECT distinct(id_subbidang) from t_apms_dispo_a WHERE id_project='".$dtnya[0]."' and id_bidang='".$dtnya['idbidang']."'");
                            $hasil=mysqli_fetch_array($query);
                            $query2 = mysqli_query($koneksi,"SELECT nm_subbid,warna from t_apms_subbidang WHERE id_bidang='".$dtnya['idbidang']."' and id_subbid='".$hasil[0]."'");
                            $hasil2=mysqli_fetch_array($query2);

                            echo "<span class='right badge badge-success' style='background-color:$hasil2[1];'>".ucwords($hasil2[0])."</span>";
                        }else{
                          $show=0;
                          echo "<span class='right badge badge-danger'>"."belum ada disposisi ke sub bid"."</span>";
                        }
                        ?>
                      </td>
                      <td><?=ucwords($dtnya['ket']);?></td>
                      <td align="center"><i class="nav-icon fas fa-regular fa-file-pdf"></i>&nbsp;<a href="lampiran/<?=$dtnya['file']?>" target="_blank">Lihat File</a></td>
                      <td align="justify-content-between">
                        <?php 
                        $cek_lamp = mysqli_query($koneksi,"SELECT lampiran,id_dispoc FROM t_apms_dispo_c WHERE no_surat='".$dtnya['nosurat']."' and lampiran <> ''");
                        $row = mysqli_fetch_array($cek_lamp);
                        if(!empty($row[0])){
                        ?>
                        <a href="lampiran/<?=$row['lampiran'];?>" target="_blank"><?php
                            ambilExt($row['lampiran']);
                          ?></a>
                        <?php
                        }else{}
                        ?>
                        <?php
                        echo ucwords($dtnya['status']);
                        if($dtnya['kdstatus'] >= '1004' and $dtnya['kdstatus'] <= '1006' or $dtnya['kdstatus'] <= '1007' or $dtnya['kdstatus'] <= '1007' or $dtnya['kdstatus'] <= '1008' or $dtnya['kdstatus'] <= '1009' or $dtnya['kdstatus'] <= '1010'){
                          $cek_stafke=mysqli_query($koneksi,"SELECT distinct(a.id_staff),b.nama 
                            from t_apms_dispo_b a INNER JOIN t_apms_user b ON (a.id_bidang=b.id_bidang and a.id_subbidang=b.id_subbidang and a.id_staff=b.id_staff) 
                            WHERE a.id_project='".$dtnya[0]."' and a.id_bidang='".$dtnya['idbidang']."' and a.id_subbidang='".$hasil[0]."'
                            ");
                          $hasil4=mysqli_fetch_array($cek_stafke);
                          if($dtnya['kdstatus']=='1004'){
                            echo (" ke ".$hasil4[1]);
                          }elseif($dtnya['kdstatus']=='1005'){
                            echo (" ".$hasil4[1]);
                          }elseif($dtnya['kdstatus']=='1006'){
                            echo (" ".$hasil4[1]);
                          }elseif($dtnya['kdstatus']=='1007'){
                            echo (" ".$hasil4[1]);
                          }elseif($dtnya['kdstatus']=='1008'){
                            echo (" ".$hasil4[1]);
                          }elseif($dtnya['kdstatus']=='1009'){
                            echo (" ".$hasil4[1]);
                          }elseif($dtnya['kdstatus']=='1010'){
                            echo (" ".$hasil4[1]);
                          }else{} 
                        }
                        ?>
                      </td>
                      <td align="center">
                        <?php
                        if($dtnya['kdstatus']==='1010'){
                            $waktu_approve = mysqli_query($koneksi,"SELECT tgl_kirim 
                              from t_apms_dispo_a 
                              WHERE id_project='".$dtnya[0]."' 
                              ORDER BY tgl_kirim DESC limit 0,1");
                            $hsl = mysqli_fetch_array($waktu_approve);
                            $tglapp = substr($hsl[0],0,10);
                            $cutoff = new DateTime($tglapp);
                            $warna = "hijau";

                            $selisihwaktu = new DateTime($dtnya['tgl_terima']);
                            $diff = $cutoff->diff($selisihwaktu);
                            echo $diff->m.' Bulan';
                            echo " ";
                            echo $diff->d.' Hari';

                        }elseif($dtnya['kdstatus']==='1000'){
                            $cutoff = new DateTime();
                            $warna = "";

                            $selisihwaktu = new DateTime($dtnya['tgl_terima']);
                            $diff = $cutoff->diff($selisihwaktu);
                            echo $diff->m.' Bulan';
                            echo " ";
                            echo $diff->d.' Hari';
                        }else{
                            $cutoff = new DateTime();
                            $argo = mysqli_query($koneksi,"SELECT a.id_project,b.waktu 
                              from t_apms_project a inner join t_apms_sifatproject b on a.sifat=b.id_sifatproject
                              WHERE a.id_project='".$dtnya[0]."'");
                            $jml_argo = mysqli_fetch_array($argo);
                            $selisihwaktu = new DateTime($dtnya['tgl_terima']);
                            $diff = $cutoff->diff($selisihwaktu);
                            echo $diff->m.' Bulan';
                            echo " ";
                            echo $diff->d.' Hari';

                            if(intval($diff->days) <= $jml_argo[1]){
                              $warna = "kuning";
                            }else{
                              $warna = "merah";
                            }
                        }
                        ?>
                      </td>
                      <td align="center"
                        <?php 
                          //indikator warna
                          if($warna==="hijau"){ // SUDAH SELESAI
                             echo 'style="background-color:green"';
                             $ket="no";
                             $lebih="no";
                          }elseif($warna==="merah"){ // MELEBIHI ARGO
                             echo 'style="background-color:red;color:#ffffff;"';
                             $ket="yes";
                             $lebih="yes"; 
                          }elseif($warna==="kuning"){ // PROSES TIDAK MELEBIHI ARGO
                            echo 'style="background-color:yellow"';
                            $ket="yes";
                            $lebih="no";
                          }else{ 
                          }
                            echo '>';
                        ?>
                        <?php
                        if($show==0){
                        ?>
                        <a href="" id="tombolUbah" data-toggle="modal" data-target="#modal-lg"
                        data-id="<?=$idx;?>" 
                        data-idpro="<?=$dtnya[0];?>"
                        data-nm_opd="<?=strtoupper($dtnya['pengirim']);?>" 
                        data-idbid="<?=$dtnya[1];?>" 
                        data-idsur="<?=$dtnya[2];?>" 
                        data-tgl_a="<?=$dtnya['tgl_surat'];?>"
                        data-tgl_b="<?=$dtnya['tgl_terima'];?>"
                        data-sifat="<?=strtoupper($dtnya['ket']);?>"
                        data-noagenda="<?=$dtnya['no_agenda'];?>"
                        data-lamp="<?=$dtnya['file'];?>"
                        data-nosurat="<?=$dtnya['nosurat']?>"
                        >
                        <i class="nav-icon fas fa-edit"></i></a>
                        <?php
                        }elseif($show==1){
                          if($ket=="no"){

                          }else{
                            if($lebih=="no"){
                             echo "<b>"."Max ".$jml_argo[1]."</b> Hari";
                            }else{
                              echo "<b>"." > ".$jml_argo[1]."</b> Hari";
                            }
                          }
                        }
                        ?>
                      </td>
                    </tr>
                      <?php
                      }
                    }elseif($menu=='3'){/* USER KA SUBBID*/
                      ?>
                    <tr align="center">
                      <th>ID Project</th>
                      <th>Pengirim</th>
                      <th>Tgl. Surat</th>
                      <th>Judul</th>
                      <th>Disposisi Kabid</th>
                      <th>Delegasi Staff</th>
                      <th>Lampiran</th>
                      <th>Status</th>
                      <th>Waktu</th>
                      <th>Aksi</th>
                    </tr>
                    </thead>
                    <tbody>
                      <?PHP
                      while($dtnya = mysqli_fetch_array($sql_project)) 
                      {
                        $idx= $dtnya[0].'#'.$dtnya[1].'#'.$dtnya[2];
                      ?>
                    <tr>
                      <td align="center"><?=$dtnya[0];?></td>
                      <td><?=strtoupper($dtnya['pengirim']);?></td>
                      <td align="center"><?=$dtnya['tgl_surat'];?></td>
                      <td><?=ucwords(strtolower($dtnya['judul']));?></td>
                      <!--LAMPIRAN DISPOSISI-->
                      <td align="center">
                          <a href="view/create_pdf.php?id=<?=$dtnya['nosurat'];?>&p=<?=$dtnya[0]?>" target="_blank"><i class="nav-icon fas fa-regular fa-file-pdf"></i></a>
                      </td> 
                      <td align="center">
                        <?php
                        $cek_dispob = mysqli_query($koneksi,"SELECT id_dispob from t_apms_dispo_b where 
                          id_project='".$dtnya[0]."' and 
                          id_bidang='".$dtnya['idbidang']."' and 
                          id_subbidang='".$dtnya['idsubbidang']."'
                          ");

                        $show=0;
                        $jml_cek_dispob = mysqli_num_rows($cek_dispob);
                        
                        if($jml_cek_dispob > 0){
                          $show=1;

                          $que2=mysqli_query($koneksi,"SELECT id_staff from t_apms_dispo_b WHERE 
                            id_project='".$dtnya[0]."' and 
                            id_bidang='".$dtnya['idbidang']."' and 
                            id_subbidang='".$dtnya['idsubbidang']."'
                            ");

                          $hasil3=mysqli_fetch_array($que2);
                            
                          $que3 = mysqli_query($koneksi,"SELECT * from t_apms_staf WHERE 
                            id_bidang='".$dtnya['idbidang']."' and 
                            id_subbid='".$dtnya['idsubbidang']."' and
                            id_staf='".$hasil3[0]."'
                            ");

                          $que4 = mysqli_query($koneksi,"SELECT * from t_apms_user WHERE
                            id_bidang='".$dtnya['idbidang']."' and 
                            id_subbidang='".$dtnya['idsubbidang']."' and
                            id_staff='".$hasil3[0]."'
                            ");
                          $row3=mysqli_fetch_array($que3);
                          $row4=mysqli_fetch_array($que4);
                            echo "<span class='right badge badge-success'>".ucwords($row4['nama'])."</span>";
                        }else{
                          $show=0;
                          echo "<span class='right badge badge-danger'>"."belum ada disposisi ke staf"."</span>";
                        }

                        ?>
                      </td>
                      <td align="center"><i class="nav-icon fas fa-regular fa-file-pdf"></i>&nbsp;<a href="lampiran/<?=$dtnya['file']?>" target="_blank">Lihat File</a></td>
                      <td>
                        <?php 
                        $cek_lamp = mysqli_query($koneksi,"SELECT lampiran,id_dispoc FROM t_apms_dispo_c WHERE no_surat='".$dtnya['nosurat']."' and lampiran <> ''");
                        $row = mysqli_fetch_array($cek_lamp);
                        if(!empty($row[0])){
                        ?>
                        <a href="lampiran/<?=$row['lampiran'];?>" target="_blank"><a href="lampiran/<?=$row['lampiran'];?>" target="_blank"><?php
                            ambilExt($row['lampiran']);
                          ?></a>
                        <?php
                        //echo ($row['lampiran']);
                        }else{}
                        ?>
                        <?php 
                        if($dtnya['kdstatus']=='1010'){
                          echo "&nbsp;<span class='right badge badge-info' style='font-size:14px;'>"."Approve/Done"."&nbsp;<i class='nav-icon fas fa-regular fa-check-circle'></i></span>";
                           $warna = "hijau";
                        }elseif($dtnya['kdstatus']=='1007'){
                          echo "&nbsp;<span class='right badge badge-danger' style='font-size:14px;'>"."Menunggu Validasi Ka Subbid"."&nbsp;<i class='nav-icon fas fa-regular fa-info-circle'></i></span>";
                           $warna = "";
                        }elseif($dtnya['kdstatus']=='1008'){
                          echo "&nbsp;<span class='right badge badge-danger' style='font-size:14px;'>"."Menunggu Validasi Kabid"."&nbsp;<i class='nav-icon fas fa-regular fa-info-circle'></i></span>";
                           $warna = "";
                        }else{
                          $warna = "";
                          echo ucwords($dtnya['status']);
                        }
                        ?></td>
                      <td>
                        <?php
                        if($dtnya['kdstatus']==='1010'){
                            $waktu_approve = mysqli_query($koneksi,"SELECT tgl_kirim 
                              from t_apms_dispo_a 
                              WHERE id_project='".$dtnya[0]."' 
                              ORDER BY tgl_kirim DESC limit 0,1");
                            $hsl = mysqli_fetch_array($waktu_approve);
                            $tglapp = substr($hsl[0],0,10);
                            $cutoff = new DateTime($tglapp);
                            $warna = "hijau";

                            $selisihwaktu = new DateTime($dtnya['tgl_terima']);
                            $diff = $cutoff->diff($selisihwaktu);
                            echo $diff->m.' Bulan';
                            echo " ";
                            echo $diff->d.' Hari';

                        }elseif($dtnya['kdstatus']==='1000'){
                            $cutoff = new DateTime();
                            $warna = "";

                            $selisihwaktu = new DateTime($dtnya['tgl_terima']);
                            $diff = $cutoff->diff($selisihwaktu);
                            echo $diff->m.' Bulan';
                            echo " ";
                            echo $diff->d.' Hari';
                        }else{
                            $cutoff = new DateTime();
                            $argo = mysqli_query($koneksi,"SELECT a.id_project,b.waktu 
                              from t_apms_project a inner join t_apms_sifatproject b on a.sifat=b.id_sifatproject
                              WHERE a.id_project='".$dtnya[0]."'");
                            $jml_argo = mysqli_fetch_array($argo);
                            $selisihwaktu = new DateTime($dtnya['tgl_terima']);
                            $diff = $cutoff->diff($selisihwaktu);
                            echo $diff->m.' Bulan';
                            echo " ";
                            echo $diff->d.' Hari';

                            if(intval($diff->days) <= $jml_argo[1]){
                              $warna = "kuning";
                            }else{
                              $warna = "merah";
                            }
                        }
                        ?>  
                      </td>
                      <td align="center"
                        <?php
                          //indikator warna
                          if($warna==="hijau"){ // SUDAH SELESAI
                             echo 'style="background-color:green"';
                             $ket="no";
                             $lebih="no";
                          }elseif($warna==="merah"){ // MELEBIHI ARGO
                             echo 'style="background-color:red;color:#ffffff;"';
                             $ket="yes";
                             $lebih="yes"; 
                          }elseif($warna==="kuning"){ // PROSES TIDAK MELEBIHI ARGO
                            echo 'style="background-color:yellow"';
                            $ket="yes";
                            $lebih="no";
                          }else{ 
                          }
                            echo '>';
                        ?>
                        <?php
                        if($show==0){
                        ?>
                        <a href="" id="tombolUbah2" data-toggle="modal" data-target="#modal-subbid"
                        data-id="<?=$idx;?>" 
                        data-idpro="<?=$dtnya[0];?>"
                        data-nm_opd="<?=strtoupper($dtnya['pengirim']);?>" 
                        data-idbid="<?=$dtnya[1];?>" 
                        data-idsur="<?=$dtnya[2];?>" 
                        data-tgl_a="<?=$dtnya['tgl_surat'];?>"
                        data-tgl_b="<?=$dtnya['tgl_terima'];?>"
                        data-sifat="<?=strtoupper($dtnya['ket']);?>"
                        data-noagenda="<?=$dtnya['no_agenda'];?>"
                        data-lamp="<?=$dtnya['file'];?>"
                        data-nosurat="<?=$dtnya['nosurat'];?>"
                        data-subbid="<?=$dtnya['idsubbidang'];?>"
                        >
                        <i class="nav-icon fas fa-edit"></i></a>
                        <?php
                        }elseif($show==1){
                          if($ket=="no"){

                          }else{
                            if($lebih=="no"){
                             echo "<b>"."Max ".$jml_argo[1]."</b> Hari";
                            }else{
                              echo "<b>"." > ".$jml_argo[1]."</b> Hari";
                            }
                          }
                        }
                        ?>
                      </td>
                    </tr>
                      <?php
                      }
                    }elseif($menu=='4'){/* USER STAFF*/
                      ?>
                    <tr align="center">
                      <th>ID Project</th>
                      <th>Pengirim</th>
                      <th>Tgl. Surat</th>
                      <th>Judul</th>
                      <th>Disposisi Sub Bidang</th>
                      <th>Respon Staff</th>
                      <th>Lampiran</th>
                      <th>Status</th>
                      <th>Aksi</th>
                    </tr>
                    </thead>
                    <tbody>
                      <?PHP
                      while($dtnya = mysqli_fetch_array($sql_project)) 
                      {
                        $idx= $dtnya[0].'#'.$dtnya[1].'#'.$dtnya[2];
                      ?>
                    <tr>
                      <td align="center"><?=$dtnya[0];?></td>
                      <td><?=strtoupper($dtnya['pengirim']);?></td>
                      <td align="center"><?=$dtnya['tgl_surat'];?></td>
                      <td><?=ucwords(strtolower($dtnya['judul']));?></td>
                      <!--LAMPIRAN DISPOSISI-->
                      <td align="center">
                          <a href="view/create_pdf.php?id=<?=$dtnya['nosurat'];?>&p=<?=$dtnya[0]?>" target="_blank"><i class="nav-icon fas fa-regular fa-file-pdf"></i></a>
                      </td> 
                      <td align="center">
                         <?php
                        $cek_status = mysqli_query($koneksi,"SELECT status from t_apms_project WHERE no_surat='".$dtnya['nosurat']."'");
                        $datax = mysqli_fetch_array($cek_status);

                        if($datax[0] < '1005'){
                           echo "<span class='right badge badge-danger'>"."Belum ada respon"."</span>";
                         }elseif($datax[0] > '1006' and $datax[0] < '1010'){
                          echo "<span class='right badge badge-success'>"."Sudah direspon"."</span>";
                         }elseif($datax[0] == '1005'){
                          echo "<span class='right badge badge-success'>"."Sudah direspon"."</span>";
                         }elseif($datax[0] == '1010'){
                          echo "<span class='right badge badge-success'>"."Done"."</span>";
                         }
                          ?>
                      </td>
                      <td align="center"><i class="nav-icon fas fa-regular fa-file-pdf"></i>&nbsp;<a href="lampiran/<?=$dtnya['file']?>" target="_blank">Lihat File</a></td>
                      <td align="center">
                        <?php 
                        $cek_lamp = mysqli_query($koneksi,"SELECT lampiran,id_dispoc FROM t_apms_dispo_c WHERE no_surat='".$dtnya['nosurat']."' and lampiran <> ''");
                        $row = mysqli_fetch_array($cek_lamp);
                        if(!empty($row[0])){
                        ?>
                        <a href="lampiran/<?=$row['lampiran'];?>" target="_blank"><?php
                            ambilExt($row['lampiran']);
                          ?></a> 
                        <?php
                        }else{}
                        ?>
                        <?php 
                        if($dtnya['kdstatus']=='1010'){
                          echo "&nbsp;<span class='right badge badge-info' style='font-size:14px;'>"."Approve/Done"."&nbsp;<i class='nav-icon fas fa-regular fa-check-circle'></i></span>";
                           $warna = "hijau";
                        }else{
                          $warna = "";
                          echo ucwords($dtnya['status']);
                        }
                        ?>
                      </td>
                      <td align="center"
                      <?php
                      if($warna==="hijau"){ // SUDAH SELESAI
                             echo 'style="background-color:green"';
                             $ket="no";
                             $lebih="no";
                          }elseif($warna==="merah"){ // MELEBIHI ARGO
                             echo 'style="background-color:red;color:#ffffff;"';
                             $ket="yes";
                             $lebih="yes"; 
                          }elseif($warna==="kuning"){ // PROSES TIDAK MELEBIHI ARGO
                            echo 'style="background-color:yellow"';
                            $ket="yes";
                            $lebih="no";
                          }else{ 
                          }
                          echo '>'; 
                        ?>
                        <?php
                        if($show==0){
                           $cek_status_project = mysqli_query($koneksi,"SELECT status FROM t_apms_project WHERE no_surat='".$dtnya['nosurat']."'");
                           $list = mysqli_fetch_array($cek_status_project);
                           /* belum fix) */
                            if($list['status'] =='1004' or $list['status'] =='1006'){
                        ?>
                        <a href="" id="tombolUbah3" data-toggle="modal" data-target="#modal-staf"
                        data-id="<?=$idx;?>" 
                        data-idpro="<?=$dtnya[0];?>"
                        data-nm_opd="<?=strtoupper($dtnya['pengirim']);?>" 
                        data-idbid="<?=$dtnya[1];?>" 
                        data-idsur="<?=$dtnya[2];?>" 
                        data-tgl_a="<?=$dtnya['tgl_surat'];?>"
                        data-tgl_b="<?=$dtnya['tgl_terima'];?>"
                        data-sifat="<?=strtoupper($dtnya['ket']);?>"
                        data-lamp="<?=$dtnya['file'];?>"
                        data-noagenda="<?=$dtnya['no_agenda'];?>"
                        data-nosurat="<?=$dtnya['nosurat'];?>"
                        data-subbid="<?=$dtnya['idsubbidang'];?>"
                        data-idstaf="<?=$_SESSION['idstaff']?>"
                        >
                        
                        <i class="nav-icon fas fa-edit"></i></a>
                        <?php
                            }elseif($list['status'] =='1010'){
                                echo "<i class='nav-icon fas fa-eye'></i>";
                            }elseif($list['status'] =='1005' or $list['status'] =='1009'){
                        ?>
                        <a href="" id="tombolUbah4" data-toggle="modal" data-target="#modal-replystaf"
                        data-id="<?=$idx;?>" 
                        data-idpro="<?=$dtnya[0];?>"
                        data-nm_opd="<?=strtoupper($dtnya['pengirim']);?>" 
                        data-idbid="<?=$dtnya[1];?>" 
                        data-idsur="<?=$dtnya[2];?>" 
                        data-tgl_a="<?=$dtnya['tgl_surat'];?>"
                        data-tgl_b="<?=$dtnya['tgl_terima'];?>"
                        data-sifat="<?=strtoupper($dtnya['ket']);?>"
                        data-lamp="<?=$dtnya['file'];?>"
                        data-noagenda="<?=$dtnya['no_agenda'];?>"
                        data-nosurat="<?=$dtnya['nosurat'];?>"
                        data-subbid="<?=$dtnya['idsubbidang'];?>"
                        data-idstaf="<?=$_SESSION['idstaff']?>"
                        >
                        <i class="nav-icon fas fa-edit"></i></a>
                        <?php
                            }else{
                              echo "<i class='nav-icon fas fa-eye'></i>";
                            }
                        }elseif($show==1){
                           $cek_status_project = mysqli_query($koneksi,"SELECT status FROM t_apms_project WHERE no_surat='".$dtnya['nosurat']."'");
                           $list = mysqli_fetch_array($cek_status_project);
                           
                           if($list['status']<>'1007'){
                          ?> 
                        <a href="" id="tombolUbah4" data-toggle="modal" data-target="#modal-replystaf"
                        data-id="<?=$idx;?>" 
                        data-idpro="<?=$dtnya[0];?>"
                        data-nm_opd="<?=strtoupper($dtnya['pengirim']);?>" 
                        data-idbid="<?=$dtnya[1];?>" 
                        data-idsur="<?=$dtnya[2];?>" 
                        data-tgl_a="<?=$dtnya['tgl_surat'];?>"
                        data-tgl_b="<?=$dtnya['tgl_terima'];?>"
                        data-sifat="<?=strtoupper($dtnya['ket']);?>"
                        data-lamp="<?=$dtnya['file'];?>"
                        data-noagenda="<?=$dtnya['no_agenda'];?>"
                        data-nosurat="<?=$dtnya['nosurat'];?>"
                        data-subbid="<?=$dtnya['idsubbidang'];?>"
                        data-idstaf="<?=$_SESSION['idstaff']?>"
                        >
                        <i class="nav-icon fas fa-edit"></i></a>
                        <?php
                          }elseif($list['status']=='1010'){
                            echo "<i class='nav-icon fas fa-eye'></i>";
                          }elseif($list['status'] == '1007'){
                             echo "<i class='nav-icon fas fa-eye'></i>";
                          }
                        }else{
                            echo "C";
                        }
                        ?>
                      </td>
                    </tr>
                      <?php
                      }
                    }elseif($menu=='5'){/* USER OPERATOR*/
                      ?>
                    <tr align="center">
                      <th>ID Project</th>
                      <th>Pengirim</th>
                      <th>Tgl. Surat</th>
                      <th>Judul</th>
                      <th>Bidang</th>
                      <th>Sifat</th>
                      <th>Lampiran</th>
                      <th>Aksi</th>
                    </tr>
                    </thead>
                    <tbody>
                      <?PHP
                      while($dtnya = mysqli_fetch_array($sql_project)) 
                      {
                        $idx= $dtnya[0].'#'.$dtnya[1].'#'.$dtnya[2];
                      ?> <tr> <td align="center"><a
                         href="index.php?page=timeline&id=<?=$dtnya
                         [0];?>"><?=$dtnya[0];?></a></td> <td><?=strtoupper
                         ($dtnya['pengirim']);?></td> <td
                         align="center"><?=$dtnya
                         ['tgl_surat'];?></td> <td><?=ucwords(strtolower
                         ($dtnya['judul']));?></td>
                      <td><?=ucwords($dtnya['nm_bidang']);?></td>
                      <td align="center"><?=ucwords($dtnya['sifat']);?></td>
                      <td align="center"><i class="nav-icon fas fa-regular fa-file-pdf"></i>&nbsp;<a href="lampiran/<?=$dtnya['file']?>" target="_blank">Lihat File</a></td>
                      <td align="center">
                        <a href="index.php?page=showproject&rem=<?=$dtnya[0].'-'.$dtnya['nosurat'];?>" id="btn-hapus"><i class="nav-icon fas fa-solid fa-trash"></i></a>
                        <i class="nav-icon fas fa-solid fa-address-book"></i>
                      </td>
                    </tr>
                      <?php
                      }
                    }else{}
                    ?>
                        </tbody>
                </table>
              </div>
              <!-- /.modal 1 -->
              <form action="?page=dispoa&edita=yes" method="POST">
                <div class="modal fade" id="modal-lg">
                  <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h4 class="modal-title">Disposisi <?=ucwords($dt[0]);?></h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                        <div class="form-group">
                          <div class="row">
                            <div class="col-6">
                              <label for="exampleInputEmail1">Surat Dari</label>
                              <input type="text" class="form-control" id="nm_opd" disabled>
                              <input type="hidden" name="idx" id="idx">
                              <input type="hidden" name="nosurat" id="nosurat">
                            </div>
                            <div class="col-6">
                              <label for="exampleInputEmail1">Diterima Tanggal</label>
                              <input type="text" class="form-control" id="tgl_b" disabled>
                            </div>
                            <div class="col-6">
                              <label for="exampleInputEmail1">Tanggal Surat</label>
                              <input type="text" class="form-control" id="tgl_a" disabled>
                            </div>
                            <div class="col-6">
                              <label for="exampleInputEmail1">No. Agenda</label>
                              <input type="text" class="form-control" id="agenda" disabled>
                              <input type="hidden" name="noagenda" id="agenda">
                              <input type="hidden" name="idbidang" id="bidang">
                            </div>
                            <div class="col-6">
                              <label for="exampleInputEmail1">No. Surat</label>
                              <input type="text" class="form-control" id="nomor" disabled>
                            </div>
                            <div class="col-6">
                              <label for="exampleInputEmail1">Sifat</label>
                              <input type="text" class="form-control" id="sifat" disabled>
                            </div>
                          </div>
                          <!--
                          <div class="row" style="margin-top:10px; height: 300px;">
                            <embed type="application/pdf" src="view/create_pdf.php?id=402.022" width="100%" id=""></embed>
                          </div>
                          -->
                          <div class="row" style="margin-top:10px;">
                            <div class="col-12">
                              <label>Disposisi</label>
                              <select class="form-control select2" name="subbid" required>
                                <option value="">-- Pilih --</option>
                                <?php
                                $sql=mysqli_query($koneksi,"SELECT * from t_apms_subbidang WHERE id_bidang='".$_SESSION['idbidang']."'"); 
                                while($hsl_sb=mysqli_fetch_array($sql)){   
                                  ?>
                                  <option value="<?=$hsl_sb[1]?>"><?=ucwords($hsl_sb['nm_subbid']);?></option>
                                  <?php
                                }
                                ?>
                              </select>
                            </div>
                          </div>
                          <div class="row" style="margin-top:10px;">
                            <div class="col-sm-12">
                              <div class="form-group">
                                <label>Notice</label>
                                <textarea class="form-control" rows="3" placeholder="Enter ..." name="notice" required></textarea>
                              </div>
                            </div>
                          </div>      
                        </div> <!-- /.end form group -->
                      </div>
                      <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <input type="submit" class="btn btn-primary" name="simpan" value="Save changes"></input>
                      </div>

                    </div>
                  </div>
                </div>
              </form>
              <!-- /.modal 2 -->
              <form action="?page=dispob&edita=yes" method="POST">
                <div class="modal fade" id="modal-subbid">
                  <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h4 class="modal-title">Disposisi Kasubbid</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                        <div class="form-group">
                          <div class="row">
                            <div class="col-6">
                              <label for="exampleInputEmail1">Surat Dari</label>
                              <input type="text" class="form-control" id="nm_opd" disabled>
                              <input type="hidden" name="idx" id="idx">
                              <input type="hidden" name="nosurat" id="nosurat">
                            </div>
                            <div class="col-6">
                              <label for="exampleInputEmail1">Diterima Tanggal</label>
                              <input type="text" class="form-control" id="tgl_b" disabled>
                            </div>
                            <div class="col-6">
                              <label for="exampleInputEmail1">Tanggal Surat</label>
                              <input type="text" class="form-control" id="tgl_a" disabled>
                            </div>
                            <div class="col-6">
                              <label for="exampleInputEmail1">No. Agenda</label>
                              <input type="text" class="form-control" id="noagenda" disabled>
                              <input type="hidden" name="idbidang" id="bidang">
                              <input type="hidden" name="idsubbidang" id="subbidang">
                            </div>
                            <div class="col-6">
                              <label for="exampleInputEmail1">No. Surat</label>
                              <input type="text" class="form-control" id="nomor" disabled>
                            </div>
                            <div class="col-6">
                              <label for="exampleInputEmail1">Sifat</label>
                              <input type="text" class="form-control" id="sifat" disabled>
                            </div>
                          </div>
                          <!--
                          <div class="row" style="margin-top:10px; height: 300px;">
                            <embed type="application/pdf" src="lampiran/" width="100%" id=""></embed>
                          </div>
                        -->  
                          <div class="row" style="margin-top:10px;">
                            <div class="col-12">
                              <label>Disposisi Staff</label>
                              <select class="form-control select2" name="staf" required>
                                <option value="">-- Pilih --</option>
                                <?php
                                $sql2=mysqli_query($koneksi,"SELECT * from t_apms_user WHERE id_bidang='".$_SESSION['idbidang']."' and id_subbidang='".$_SESSION['idsubbidang']."' and id_staff<>0"); 
                                while($hsl_sb2=mysqli_fetch_array($sql2)){   
                                  ?>
                                  <option value="<?=$hsl_sb2['id_staff']?>"><?=ucwords($hsl_sb2['nama']);?></option>
                                  <?php
                                }
                                ?>
                              </select>
                            </div>
                          </div>
                          <div class="row" style="margin-top:10px;">
                            <div class="col-sm-12">
                              <div class="form-group">
                                <label>Notice</label>
                                <textarea class="form-control" rows="3" placeholder="Enter ..." name="notice" required></textarea>
                              </div>
                            </div>
                          </div>      
                        </div>
                      </div>
                      <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <input type="submit" class="btn btn-primary" name="simpan" value="Save changes"></input>
                      </div>
                    </div>
                  </div>
                </div>
              </form>
              <!-- /.end modal2 -->
              <!-- /.modal 3 -->
              <form action="?page=dispoc&edita=yes" method="POST">
                <div class="modal fade" id="modal-staf">
                  <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h4 class="modal-title">Respon Staf</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                        <div class="form-group">
                          <div class="row">
                            <div class="col-6">
                              <label for="exampleInputEmail1">Surat Dari</label>
                              <input type="text" class="form-control" id="nm_opd" disabled>
                              <input type="hidden" name="idx" id="idx">
                              <input type="hidden" name="nosurat" id="nosurat">
                            </div>
                            <div class="col-6">
                              <label for="exampleInputEmail1">Diterima Tanggal</label>
                              <input type="text" class="form-control" id="tgl_b" disabled>
                            </div>
                            <div class="col-6">
                              <label for="exampleInputEmail1">Tanggal Surat</label>
                              <input type="text" class="form-control" id="tgl_a" disabled>
                            </div>
                            <div class="col-6">
                              <label for="exampleInputEmail1">No. Agenda</label>
                              <input type="text" class="form-control" id="noagenda" disabled>
                              <input type="hidden" name="idbidang" id="bidang">
                              <input type="hidden" name="idsubbidang" id="subbidang">
                              <input type="hidden" name="idstaf" id="staf">
                            </div>
                            <div class="col-6">
                              <label for="exampleInputEmail1">No. Surat</label>
                              <input type="text" class="form-control" id="nomor" disabled>
                            </div>
                            <div class="col-6">
                              <label for="exampleInputEmail1">Sifat</label>
                              <input type="text" class="form-control" id="sifat" disabled>
                            </div>
                          </div>
                          <!--
                          <div class="row" style="margin-top:10px; height: 300px;">
                            <embed type="application/pdf" src="lampiran/" width="100%" id=""></embed>
                          </div>
                        -->
                          <div class="row" style="margin-top:10px;">
                            <div class="col-12">
                              <label>Respon Staff</label>
                              <select class="form-control select2" name="respon" required>
                                <option value="">-- Pilih --</option>
                                <?php
                                $query_respon=mysqli_query($koneksi,"SELECT * from t_apms_respon WHERE id_respon < 4"); 
                                while($data_respon=mysqli_fetch_array($query_respon)){   
                                  ?>
                                  <option value="<?=$data_respon[0]?>"><?=ucwords($data_respon['keterangan']);?></option>
                                  <?php
                                }
                                ?>
                              </select>
                            </div>
                          </div>
                          <div class="row" style="margin-top:10px;">
                            <div class="col-sm-12">
                              <div class="form-group">
                                <label>Notice</label>
                                <textarea class="form-control" rows="3" placeholder="Enter ..." name="notice" required></textarea>
                              </div>
                            </div>
                          </div>      
                        </div>
                      </div>
                      <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <input type="submit" class="btn btn-primary" name="simpan" value="Save changes"></input>
                      </div>
                    </div>
                  </div>
                </div>
              </form>
              <!-- /.end modal 4 REPLY STAFF-->
              <!-- /.modal 4 -->
              <form action="?page=responstaf&edita=yes" method="POST" enctype="multipart/form-data">
                <div class="modal fade" id="modal-replystaf">
                  <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h4 class="modal-title">Progres Staf</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                        <div class="form-group">
                          <div class="row">
                            <div class="col-6">
                              <label for="exampleInputEmail1">Surat Dari</label>
                              <input type="text" class="form-control" id="nm_opd" disabled>
                              <input type="hidden" name="idx" id="idx">
                              <input type="hidden" name="nosurat" id="nosurat">
                            </div>
                            <div class="col-6">
                              <label for="exampleInputEmail1">Diterima Tanggal</label>
                              <input type="text" class="form-control" id="tgl_b" disabled>
                            </div>
                            <div class="col-6">
                              <label for="exampleInputEmail1">Tanggal Surat</label>
                              <input type="text" class="form-control" id="tgl_a" disabled>
                            </div>
                            <div class="col-6">
                              <label for="exampleInputEmail1">No. Agenda</label>
                              <input type="text" class="form-control" id="noagenda" disabled>
                              <input type="hidden" name="idbidang" id="bidang">
                              <input type="hidden" name="idsubbidang" id="subbidang">
                              <input type="hidden" name="idstaf" id="staf">
                            </div>
                            <div class="col-6">
                              <label for="exampleInputEmail1">No. Surat</label>
                              <input type="text" class="form-control" id="nomor" disabled>
                            </div>
                            <div class="col-6">
                              <label for="exampleInputEmail1">Sifat</label>
                              <input type="text" class="form-control" id="sifat" disabled>
                            </div>
                          </div>
                          <!--
                          <div class="row" style="margin-top:10px; height: 300px;">
                            <embed type="application/pdf" src="lampiran/" width="100%" id=""></embed>
                          </div>
                        -->
                          <div class="row" style="margin-top:10px;">
                            <div class="col-12">
                              <label>Respon Staff</label>
                              <select class="form-control select2" name="respon" required>
                                <option value="">-- Pilih --</option>
                                <?php
                                $query_respon=mysqli_query($koneksi,"SELECT * from t_apms_respon WHERE id_respon > '1' and id_respon < '4'"); 
                                while($data_respon=mysqli_fetch_array($query_respon)){   
                                  ?>
                                  <option value="<?=$data_respon[0]?>"><?=ucwords($data_respon['keterangan']);?></option>
                                  <?php
                                }
                                ?>
                              </select>
                            </div>
                          </div>
                          <div class="form-group">
                            <label for="exampleInputFile">File Lampiran</label>
                            <div class="input-group">
                             <div class="custom-file">
                              <input type="file" class="custom-file-input" id="customFile" name="lampiran">
                              <label class="custom-file-label" for="customFile">File Scan Surat</label>
                            </div>
                            </div>
                          </div>
                          <div class="row" style="margin-top:10px;">
                            <div class="col-sm-12">
                              <div class="form-group">
                                <label>Notice</label>
                                <textarea class="form-control" rows="3" placeholder="Enter ..." name="notice" required></textarea>
                              </div>
                            </div>
                          </div>      
                        </div>
                      </div>
                      <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <input type="submit" class="btn btn-primary" name="simpan" value="Save changes"></input>
                      </div>
                    </div>
                  </div>
                </div>
              </form>
              <!-- /.end modal 3 -->
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->

