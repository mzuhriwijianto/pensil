<?php
session_start();
$jab = $_SESSION['akses'];
$bid = $_SESSION["idbidang"];

?>
<div class="sidebar">
        <!-- Sidebar Menu -->
        <nav class="mt-2">
          <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
           <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-solid fa-inbox"></i>
              <p>
                Surat Masuk
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <?php 
            if($_SESSION['akses']=='9' || $_SESSION['akses']=='5'){
            ?>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="?page=addproject" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Input Surat Masuk</p>
                </a>
              </li>
            </ul>
             <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="?page=showproject" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Daftar Surat Masuk</p>
                </a>
              </li>
            </ul>
            <?php
            }elseif($_SESSION['akses']=='1' || $_SESSION['akses']=='2' || $_SESSION['akses']=='3' || $_SESSION['akses']=='4'){
            ?>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="?page=showproject" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Daftar Surat Masuk
                    <?php
                    if($_SESSION['akses']=='1' || $_SESSION['akses']=='9' || $_SESSION['akses']=='5' ){
                      $blm_progres = "SELECT * from t_apms_project where status='1000'";
                    }elseif($_SESSION['akses']=='2') {
                      $blm_progres = "SELECT * from t_apms_project where id_bidang='$bid' and status='1000'";
                    }elseif($_SESSION['akses']=='3') {
                      $kode ="3";
                      $blm_progres = "SELECT
                      a.id_project,
                      a.id_bidang as idbidang,
                      a.no_surat as nosurat,
                      a.pengirim,
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
                      g.lampiran
                      from t_apms_project a inner join t_apms_bidang b on a.id_bidang=b.id_bidang 
                      inner join t_apms_status c on a.status=c.id_status
                      inner join t_apms_opd d on a.pengirim=d.id_opd
                      inner join t_apms_isidispo e on a.id_isidispo=e.id_isidispo
                      inner join t_apms_sifatproject f on a.sifat=f.id_sifatproject
                      inner join t_apms_dispo_a g on (a.id_project=g.id_project and a.id_bidang=g.id_bidang)
                      where g.id_bidang='$bid' and g.id_subbidang='".$_SESSION['idsubbidang']."' and a.status='1002'";
                    }elseif($_SESSION['akses']=='4') {
                      $kode ="4";
                      $blm_progres = "SELECT * from t_apms_project where id_bidang='$bid' and id_subbidang='".$_SESSION['idsubbidang']."' and id_staff='".$_SESSION['idstaff']."' and (status = '1004' and status < '1010')";
                    }else{
                      $kode ="10";
                    }
                    ?>
                    <?php
                    $sqlnya = mysqli_query($koneksi,$blm_progres);
                    $jml = mysqli_num_rows($sqlnya);
                    if($jml>0){
                    echo "<span class='badge badge-danger right'>".$jml."</span>";
                    }else{
                      //echo "AA";
                    }
                    ?>
                    
                  </p>
                </a>
              </li>
            </ul>
            <?php
            }else{}
            ?>
            </li>

            <?php 
            if($_SESSION['akses']=='2' || $_SESSION['akses']=='3'){
            ?>
            <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-solid fa-edit"></i>
              <p>
                Validasi <i class='right fas fa-angle-left'></i>
                <?php
                if($_SESSION['akses']=='2'){
                  $sql = mysqli_query($koneksi,"SELECT * FROM t_apms_project where id_bidang='$bid' and status='1008'");
                }elseif($_SESSION['akses']=='3'){
                  $sql = mysqli_query($koneksi,"SELECT * FROM t_apms_project where id_bidang='$bid' and id_subbidang='".$_SESSION['idsubbidang']."' and status='1007'");
                }else{}
                  $jml = mysqli_num_rows($sql);
                  if($jml==0){
                  }else{
                    echo "<span class='badge badge-danger right'>".$jml."</span>";   
                  }
                ?>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="?page=showvalidasi" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>List Data</p>
                </a>
              </li>
            </ul>
          </li>
          <?php
          }
          ?>

          <?php 
            if($_SESSION['akses']=='9'){
            ?>
            <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-solid  fa-users"></i>
              <p>
                Petugas
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="?page=adduser" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Tambah Petugas</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-solid  fa-tasks"></i>
              <p>
                Bidang
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="?page=addbidang" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Tambah Bidang</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-solid fa-sitemap"></i>
              <p>
                Sub Bidang
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="?page=addsubbidang" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Tambah Sub Bidang</p>
                </a>
              </li>
            </ul>
          </li>
          <?php
          }
          ?>

          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-solid fa-address-book"></i>
              <p>
                User
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="./logout.php" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Logout</p>
                </a>
              </li>
            </ul>
          </li>
        </ul>
        </nav>
        <!-- /.sidebar-menu -->
</div>