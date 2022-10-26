<?php
$maysql = mysqli_query($koneksi,"SELECT distinct(a.nm_subbid) as subbid from t_apms_subbidang a inner join
  t_apms_project b on b.id_bidang=a.id_bidang and b.id_subbidang=a.id_subbid  WHERE b.id_bidang='".$_SESSION['idbidang']."'");
  ?>
  <script>
    var ctx = document.getElementById("subbid").getContext('2d');
    var mychart = new Chart(ctx,{
      type: 'bar',
      data: {
        labels:[<?php while($dt=mysqli_fetch_array($maysql)){
          echo '"'.ucwords($dt['subbid']).'",';
        }
        ?>],
        datasets:
        [
        {
          label:'#Surat Masuk',
          data:[
          <?php  
          $maysql2 = mysqli_query($koneksi,"
            SELECT distinct(a.nm_subbid) as subbid,a.id_subbid,a.id_bidang from t_apms_subbidang a inner join
            t_apms_project b on b.id_bidang=a.id_bidang and b.id_subbidang=a.id_subbid WHERE b.id_bidang='".$_SESSION['idbidang']."'");
          while($datane=mysqli_fetch_array($maysql2)){
            $jml = mysqli_query($koneksi,"SELECT count(id_subbidang) from t_apms_project WHERE id_bidang='".$datane[2]."' and id_subbidang='".$datane[1]."'");
            $rows = mysqli_fetch_array($jml);
            echo '"'.$rows[0].'",';  
          }
          ?>
          ],
          backgroundColor: [
          'rgba(16, 22, 222, 0.2)',
          'rgba(235, 52, 220, 0.2)',
          'rgba(52, 220, 235, 0.2)',
          'rgba(75, 192, 192, 0.2)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(153, 102, 255, 0.2)',
          'rgba(201, 203, 207, 0.2)'
          ],
          borderColor: [
          'rgb(15, 22, 122)',
          'rgb(196, 18, 163)',
          'rgb(25, 175, 189)',
          'rgb(75, 192, 192)',
          'rgb(54, 162, 235)',
          'rgb(153, 102, 255)',
          'rgb(201, 203, 207)'
          ],
          borderWidth:1
        }
        ]
      },
      options:{
        scales:{
          yAxes:[{
            ticks:{
              beginAtZero:true
            }
          }]
        }
      }
    })
  </script>
<?php
$query_sifat = mysqli_query($koneksi,"SELECT distinct(a.keterangan) as ket from t_apms_sifatproject a inner join
  t_apms_project b on b.sifat=a.id_sifatproject and id_bidang='".$_SESSION['idbidang']."'");
?>
  <script>
    var ctx2 = document.getElementById("sifat_surat").getContext('2d');
    var mychart2 = new Chart(ctx2,{
      type: 'pie',
      data: {
        labels:[<?php while($dt1=mysqli_fetch_array($query_sifat)){
          echo '"'.ucwords($dt1['ket']).'",';
        }
        ?>],
        datasets:
        [
        {
          label:'#Sifat',
          data:[
          <?php  
          $query2 = mysqli_query($koneksi,"
            SELECT distinct(a.keterangan) as ket,b.sifat from t_apms_sifatproject a inner join
           t_apms_project b on b.sifat=a.id_sifatproject");
          while($datanya=mysqli_fetch_array($query2)){
            $jml2 = mysqli_query($koneksi,"SELECT count(sifat) from t_apms_project WHERE sifat='".$datanya[1]."'  and id_bidang='".$_SESSION['idbidang']."'");
            $rows2 = mysqli_fetch_array($jml2);
            echo '"'.$rows2[0].'",';  
          }
          ?>
          ],
          backgroundColor:['#7fffd4',
          '#17bebb','#ffc914','#7fff00',
          '#9932cc','#008000','#17bebb'],
          borderWidth:1,
          borderColor:'rgb(255, 99, 132)'
        }
        ]
      },
      options:{
      }
    })
  </script>

