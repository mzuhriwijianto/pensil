  <!-- Main content -->
    <section class="content">
      <?php 
include '../bridge.php';
session_start();      
if(isset($_GET['id'])){      
  if($_GET['id']){
    $cek_project = mysqli_query($koneksi,"SELECT * from t_apms_project WHERE id_project='".$_GET['id']."'");
    $data=mysqli_fetch_array($cek_project);     
  }
}
      ?>

      <div class="container-fluid">
        <!-- Timelime example  -->
        <div class="row">
          <div class="col-md-12">
            <!-- The time line -->
            <div class="timeline">
              <!-- timeline time label -->
              <?php

              $sql_1 = mysqli_query($koneksi,"SELECT
                      a.id_project,
                      a.id_bidang as idbidang,
                      a.no_surat as nosurat,
                      a.pengirim as pengirim,
                      a.tgl_surat as tgl_surat,
                      a.tgl_terima as tgl_terima,
                      a.judul as judul,
                      a.status,
                      a.lampiran as file,
                      b.nm_bidang as nm_bidang,
                      c.ket_status as status, 
                      d.nm_opd as pengirim,
                      e.isi_disposisi as isidispo,
                      f.keterangan as ket,
                      g.notice as dispokabid,
                      g.id_subbidang as idsubbidang,
                      g.lampiran,
                      g.tgl_kirim as tgl_a,
                      h.notice as disposubbid,
                      h.lampiran,
                      h.id_staff as staf
                      from t_apms_project a inner join t_apms_bidang b on a.id_bidang=b.id_bidang 
                      inner join t_apms_status c on a.status=c.id_status
                      inner join t_apms_opd d on a.pengirim=d.id_opd
                      inner join t_apms_isidispo e on a.id_isidispo=e.id_isidispo
                      inner join t_apms_sifatproject f on a.sifat=f.id_sifatproject
                      inner join t_apms_dispo_a g on (a.id_project=g.id_project and a.id_bidang=g.id_bidang)
                      inner join t_apms_dispo_b h on (a.id_project=h.id_project and a.id_bidang=h.id_bidang)
                      where a.id_project='".$_GET['id']."'");


              while($hasil = mysqli_fetch_array($sql_1)){
              ?>
              <div class="time-label">
                <span class="bg-red"><?=$data[3]?></span>
              </div>
              <!-- /.timeline-label -->
              <!-- timeline item -->
              <div>
                <i class="fas fa-envelope bg-blue"></i>
                <div class="timeline-item">
                  <span class="time"><i class="fas fa-clock"></i><?=substr($hasil['tgl_terima'],10,6)?></span>
                  <h3 class="timeline-header"><a href="#"><?=ucwords($hasil['pengirim']);?></a> mengirim surat dengan nomor <b><?=$hasil['nosurat'];?></b></h3>
                  <div class="timeline-body" style="border: 0px solid #eee;">
                    <!--<embed type="application/pdf" src="lampiran/<?=$hasil['file'];?>" width="100%" height="800" id=""></embed>-->
                    <iframe src="lampiran/<?=$hasil['file'];?>" width="100%" height="800"></iframe>
                  </div>
                  <h3 class="timeline-header no-border"><a href="#">Disposisi</a> <?=strtoupper($hasil['isidispo']);?></h3>
                </div>
              </div>
              <?php
              if($hasil['dispokabid']<>''){
                $subbid = mysqli_query($koneksi,"SELECT * from t_apms_subbidang 
                  WHERE id_bidang='".$_SESSION['idbidang']."' and id_subbid='".$hasil['idsubbidang']."'");
                $hasil2 = mysqli_fetch_array($subbid);
              ?>
              <div class="time-label">
                <span class="bg-red"><?=substr($hasil['tgl_a'],0,10)?></span>
              </div>
              <div>
               <i class="fas fa-user bg-green"></i>
                <div class="timeline-item">
                  <span class="time"><i class="fas fa-clock"></i> <?=substr($hasil['tgl_a'],10,6)?></span>
                  <h3 class="timeline-header"><a href="#"><?=ucwords($_SESSION['jabatan'].' '.$hasil['nm_bidang']);?> Meneruskan  Surat kepada <?=ucwords($hasil2[2]);?></h3>
                   <h3 class="timeline-header no-border"><a href="#">Disposisi</a> <?=strtoupper($hasil['dispokabid']);?></h3>
                </div>
              </div>
              <?php
                  if($hasil['disposubbid']<>''){
                     $staf = mysqli_query($koneksi,"SELECT * from t_apms_staf 
                      WHERE id_bidang='".$_SESSION['idbidang']."' and id_subbid='".$hasil['idsubbidang']."' and id_staf='".$hasil['staf']."'");
                    $hasil3 = mysqli_fetch_array($staf);
              ?>
              <div>
               <i class="fas fa-user bg-red"></i>
                <div class="timeline-item">
                  <span class="time"><i class="fas fa-clock"></i> 12:05</span>
                  <h3 class="timeline-header"><a href="#"><?=ucwords($hasil2[2]);?> Meneruskan Surat kepada <?=ucwords($hasil3[3]);?></h3>
                   <h3 class="timeline-header no-border"><a href="#">Disposisi</a> <?=strtoupper($hasil['disposubbid']);?></h3>
                </div>
              </div>
              <?php
                  }else{
              ?>      
              <div>
                <i class="fas fa-user"></i>
               <div class="timeline-item">
                <span class="time"><i class="fas fa-clock"></i> 12:05</span>
                <h3 class="timeline-header"><a href="#">Belum Ada Penerusan</h3>
                 <h3 class="timeline-header no-border"></h3>
               </div>
             </div>
             <?php
                  }
              }else{}

              ?>
              <!-- END timeline item -->
              <!-- timeline item -->
              <?php
            }
              ?>
              
            </div>
          </div>
          <!-- /.col -->
        </div>
      </div>
      <!-- /.timeline -->
    </section>
