<!-- konten 1 -->
      <section class="content">
        <div class="container-fluid">
          <!-- Main row -->
          <!-- /.col-md-6 -->
          <?php 
          if(isset($_GET['page'])){
            include ($url);
          }else{
            include 'quick_report_dashboard.php';
          }
          ?>
          <!-- /.col-md-6 -->
          <!-- /.row (main row) -->
        </div><!-- /.container-fluid -->
      </section>
      <!-- /.konten 1 -->

      <!-- konten 2 -->
      <section class="content">
        <div class="container-fluid">
        </div><!-- /.container-fluid -->
      </section>