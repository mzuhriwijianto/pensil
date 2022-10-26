<?php
include '../bridge.php';
session_start();

if (mysqli_connect_errno())
{
 echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
//Memanggil file FPDF dari file yang anda download tadi
require('../function/fpdf/fpdf.php');

$pdf = new FPDF("L","cm","A4");
$nosurat = $_GET['id'];
$idp = $_GET['p'];

/*
    SELECT 
                      a.id_project,
                      a.id_bidang as idbidang,
                      a.no_surat as nosurat,
                      a.pengirim,
                      a.tgl_surat as tgl_surat,
                      a.tgl_terima as tgl_terima,
                      a.judul as judul,
                      a.status,
                      a.lampiran as file,
                      a.no_agenda as noagenda,
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
                      WHERE a.no_surat = '$nosurat'
     */
$cek_dispoa = mysqli_query($koneksi,"SELECT * from t_apms_dispo_a WHERE no_surat='$nosurat' and id_project='$idp'");

$cek_project = mysqli_query($koneksi,"SELECT a.pengirim,b.nm_opd as pengirim from t_apms_project a inner join t_apms_opd b on a.pengirim=b.id_opd WHERE a.no_surat='$nosurat'");

$jml_dispoa = mysqli_num_rows($cek_dispoa);

if($jml_dispoa <> 0){

    $cek_dispob = mysqli_query($koneksi,"SELECT * from t_apms_dispo_b WHERE no_surat='$nosurat' and id_project='$idp'");
    $jml_dispob = mysqli_num_rows($cek_dispob);

    if($jml_dispob <> 0){
    /*
        SELECT a.pengirim,a.tgl_surat,a.tgl_terima,a.no_surat,a.no_agenda,a.judul,b.nm_opd as pengirim,c.keterangan,d.nm_bidang,e.isi_disposisi
    from 
        t_apms_project a inner join t_apms_opd b on a.pengirim = b.id_opd
        inner join t_apms_sifatproject c on a.sifat = c.id_sifatproject
        inner join t_apms_bidang d on a.id_bidang = d.id_bidang
        inner join t_apms_isidispo e on a.id_isidispo = e.id_isidispo
    WHERE a.no_surat='412.012';
    */
    
        $sql = "SELECT
                          a.id_project,
                          a.id_bidang as idbidang,
                          a.no_surat as nosurat,
                          a.pengirim,
                          a.tgl_surat as tgl_surat,
                          a.tgl_terima as tgl_terima,
                          a.judul as judul,
                          a.status,
                          a.lampiran as file,
                          a.no_agenda as noagenda,
                          b.nm_bidang as nm_bidang,
                          c.ket_status as status, 
                          d.nm_opd as pengirim,
                          e.isi_disposisi as isidispo,
                          f.keterangan as ket,
                          g.notice as dispokabid,
                          g.id_subbidang as idsubbidang,
                          g.lampiran,
                          h.notice as disposubbid,
                          h.lampiran,
                          i.nm_subbid as namasubbid,
                          j.nm_staf
                        
                          from t_apms_project a inner join t_apms_bidang b on a.id_bidang=b.id_bidang 
                          inner join t_apms_status c on a.status=c.id_status
                          inner join t_apms_opd d on a.pengirim=d.id_opd
                          inner join t_apms_isidispo e on a.id_isidispo=e.id_isidispo
                          inner join t_apms_sifatproject f on a.sifat=f.id_sifatproject
                          inner join t_apms_dispo_a g on (a.id_project=g.id_project and a.id_bidang=g.id_bidang)
                          inner join t_apms_dispo_b h on (a.id_project=h.id_project and a.id_bidang=h.id_bidang)
                          inner join t_apms_subbidang i on (a.id_bidang=i.id_bidang and g.id_subbidang=i.id_subbid)
                          inner join t_apms_staf j on (a.id_bidang=j.id_bidang and g.id_subbidang=j.id_subbid and h.id_staff=j.id_staf)
                          where a.no_surat='$nosurat' and a.id_project='$idp';              
            ";
            /*
            $sql = "SELECT 
                a.pengirim,
                a.tgl_surat as tgl_surat,
                a.tgl_terima as tgl_terima,
                a.no_surat as nosurat,
                a.no_agenda,
                a.judul,
                b.nm_opd as pengirim,
                c.keterangan,
                d.nm_bidang,
                e.isi_disposisi
            from 
                t_apms_project a inner join t_apms_opd b on a.pengirim = b.id_opd
                inner join t_apms_sifatproject c on a.sifat = c.id_sifatproject
                inner join t_apms_bidang d on a.id_bidang = d.id_bidang
                inner join t_apms_isidispo e on a.id_isidispo = e.id_isidispo
            WHERE a.no_surat='$nosurat';
            */
    }else{
        $sql = "SELECT
                          a.id_project,
                          a.id_bidang as idbidang,
                          a.no_surat as nosurat,
                          a.pengirim,
                          a.tgl_surat as tgl_surat,
                          a.tgl_terima as tgl_terima,
                          a.judul as judul,
                          a.status,
                          a.lampiran as file,
                          a.no_agenda as noagenda,
                          b.nm_bidang as nm_bidang,
                          c.ket_status as status, 
                          d.nm_opd as pengirim,
                          e.isi_disposisi as isidispo,
                          f.keterangan as ket,
                          g.notice as dispokabid,
                          g.id_subbidang as idsubbidang,
                          g.lampiran,
                          i.nm_subbid as namasubbid
                          from t_apms_project a inner join t_apms_bidang b on a.id_bidang=b.id_bidang 
                          inner join t_apms_status c on a.status=c.id_status
                          inner join t_apms_opd d on a.pengirim=d.id_opd
                          inner join t_apms_isidispo e on a.id_isidispo=e.id_isidispo
                          inner join t_apms_sifatproject f on a.sifat=f.id_sifatproject
                          inner join t_apms_dispo_a g on (a.id_project=g.id_project and a.id_bidang=g.id_bidang)
                          inner join t_apms_subbidang i on (a.id_bidang=i.id_bidang and g.id_subbidang=i.id_subbid)
                          where a.no_surat='$nosurat' and a.id_project='$idp';              
        ";
    }

    
}else{
    $sql = "SELECT 
                          a.id_project,
                          a.id_bidang as idbidang,
                          a.no_surat as nosurat,
                          a.pengirim,
                          a.tgl_surat as tgl_surat,
                          a.tgl_terima as tgl_terima,
                          a.judul as judul,
                          a.status,
                          a.lampiran as file,
                          a.no_agenda as noagenda,
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
                          WHERE a.no_surat = '$nosurat' and a.id_project='$idp';              
        ";    
}




$result=mysqli_query($koneksi,$sql) or die(mysqli_error());
$data = mysqli_fetch_array($cek_project);
//DEKLARASI NILAI DEFAULT
$column_no ="";
$column_namapengirim = "";
$column_tgl_surat = "";
$column_nosurat = "";
$column_tgl_terima = "";
$column_noagenda = "";
$column_sifat = "";
$column_perihal = "";
$column_namabidang = "";
$column_isidispokaban = "";

//For each row, add the field to the corresponding column
$nmpengirim = strtoupper($data['pengirim']);
$i = 0;
while($row = mysqli_fetch_row($result))
{
    $i++;
    $no = $i;
   
    $nmbidang = $row[1];
    $tglsurat = $row[4];
    $nosurat = $row[2];
    $tglterima = $row[5];
    $noagenda = $row[9];
    $sifat = strtoupper($row[14]);
    $perihal = nl2br(strtoupper($row[6]));
    
    if($jml_dispoa<>0){
        if($jml_dispob<>0){
            $nmsubbid = strtoupper($row[20]);
            $nmstaf = strtoupper($row[21]);
        }else{
            $nmsubbid = strtoupper($row[18]);
            $nmstaf = '';
        }
    }
   
    $column_no = $column_no.$no."\n";
    $nmbidang = strtoupper($row[10]);
    $dispokaban = strtoupper($row[13]);
    
//Create a new PDF file
$pdf = new FPDF('P','mm',array(210,297)); //L For Landscape / P For Portrait
$pdf->AddPage();

//Menambahkan Gambar

$pdf->Image('../img/logopemkab.png',20,5,-600);
$pdf->SetY(30);
$pdf->SetX(5);

$pdf->SetFont('Arial','B',14);
$judul = "PEMERINTAH KABUPATEN BOJONEGORO";
$judul2 = "BADAN PENGELOLAAN KEUANGAN DAN ASET DAERAH";
$judul3 = "Jl. P. Mas Tumapel No. 1 Telp (0353) 881259 Fax. (0353) 886468 BOJONEGORO Kode Pos 62111";
$judul4 = "Website: http://bpkad.bojonegoro.go.id - Email: bpkad@bojonegorokab.go.id";
$dispo = "LEMBAR DISPOSISI";

$pdf->setY(5);
$pdf->SetX(58);
$pdf->Cell(10,10,$judul,0,0,'L');
$pdf->setY(10);
$pdf->SetX(42);
$pdf->Cell(10,10,$judul2,0,0,'L');
$pdf->SetFont('Arial','',9);
$pdf->setY(15);
$pdf->SetX(40);
$pdf->Cell(10,10,$judul3,0,0,'L');
$pdf->setY(20);
$pdf->SetX(55);
$pdf->Cell(10,10,$judul4,0,0,'L');
$pdf->SetFont('Arial','B',14);
$pdf->setY(32);
$pdf->SetX(5);
$pdf->Cell(200,10,$dispo,1,0,'C');

}

$pdf->SetFillColor(255,255,255);

//IDENTITAS SURAT
$pdf->SetFont('Arial','',8);
$pdf->setY(42);
$pdf->SetX(5);
$pdf->Cell(100,25,'',1,0,'L',1);

$kata1 = "SURAT DARI";
$kata2 = "TANGGAL SURAT";
$kata3 = "NOMOR SURAT";
$kata4 = "DITERIMA TANGGAL";
$kata5 = "NO. AGENDA";
$kata6 = "SIFAT";
$kata7 = "PERIHAL";
$kata8 = "DISEDIAKAN KEPADA Yth. KEPALA BPKAD";
$kata9 = "ISI DISPOSISI";
$kata10 = "DITERUSKAN KEPADA Sdr.";
$kata11 = "Catatan :";

$column_namapengirim = $column_namapengirim.$nmpengirim."\n";
$column_tgl_surat = $column_tgl_surat.$tglsurat."\n";
$column_tgl_terima = $column_tgl_terima.$tglterima."\n";
$column_noagenda = $column_noagenda.$noagenda."\n";
$column_sifat = $column_sifat.$sifat."\n";
$column_perihal = $column_perihal.$perihal."\n";
$column_nosurat = $column_nosurat.$nosurat."\n";
$column_namabidang = $column_namabidang.$nmbidang."\n";
$columnisidispokaban = $column_isidispokaban.$dispokaban."\n";

$pdf->setY(40);
$pdf->SetX(5);
$pdf->Cell(30,10,$kata1,0,0,'L');
$pdf->setY(40);
$pdf->SetX(35);
$pdf->Cell(30,10,':',0,0,'L');
$pdf->setY(40);
$pdf->SetX(37);
$pdf->Cell(30,10,$column_namapengirim,0,0,'L');

$pdf->setY(45);
$pdf->SetX(5);
$pdf->Cell(30,10,$kata2,0,0,'L');
$pdf->setY(45);
$pdf->SetX(35);
$pdf->Cell(30,10,':',0,0,'L');
$pdf->setY(45);
$pdf->SetX(37);
$pdf->Cell(30,10,$column_tgl_surat,0,0,'L');

$pdf->setY(50);
$pdf->SetX(5);
$pdf->Cell(30,10,$kata3,0,0,'L');
$pdf->setY(50);
$pdf->SetX(35);
$pdf->Cell(30,10,':',0,0,'L');
$pdf->setY(50);
$pdf->SetX(37);
$pdf->Cell(30,10,$column_nosurat,0,0,'L');

$pdf->setY(42);
$pdf->SetX(105);
$pdf->Cell(100,25,'',1,0,'L',1);

$pdf->setY(40);
$pdf->SetX(105);
$pdf->Cell(40,10,$kata4,0,0,'L');
$pdf->setY(40);
$pdf->SetX(140);
$pdf->Cell(30,10,':',0,0,'L');
$pdf->setY(40);
$pdf->SetX(142);
$pdf->Cell(30,10,$column_tgl_terima,0,0,'L');

$pdf->setY(45);
$pdf->SetX(105);
$pdf->Cell(40,10,$kata5,0,0,'L');
$pdf->setY(45);
$pdf->SetX(140);
$pdf->Cell(30,10,':',0,0,'L');
$pdf->setY(45);
$pdf->SetX(142);
$pdf->Cell(30,10,$column_noagenda,0,0,'L');

$pdf->setY(50);
$pdf->SetX(105);
$pdf->Cell(40,10,$kata6,0,0,'L');
$pdf->setY(50);
$pdf->SetX(140);
$pdf->Cell(30,10,':',0,0,'L');
$pdf->SetFont('Arial','B',8);
$pdf->setY(50);
$pdf->SetX(142);
$pdf->Cell(30,10,$column_sifat,0,0,'L');

//PERIHAL
$pdf->SetFont('Arial','',8);
$pdf->setY(67);
$pdf->SetX(5);
$pdf->Cell(200,20,'',1,0,'L',1);

$pdf->setY(65);
$pdf->SetX(5);
$pdf->Cell(30,10,$kata7,0,0,'L');
$pdf->setY(65);
$pdf->SetX(18);
$pdf->Cell(30,10,':',0,0,'L');

$pdf->SetFont('Arial','B',7);
$pdf->setY(73);
$pdf->SetX(6);

$cellWidth=198; //lebar sel
$cellHeight=10;

if($pdf->GetStringWidth($column_perihal) < $cellWidth){
        //jika tidak, maka tidak melakukan apa-apa
        $line=1;
    }else{
        //jika ya, maka hitung ketinggian yang dibutuhkan untuk sel akan dirapikan
        //dengan memisahkan teks agar sesuai dengan lebar sel
        //lalu hitung berapa banyak baris yang dibutuhkan agar teks pas dengan sel
        
        $textLength=strlen($column_perihal);    //total panjang teks
        $errMargin=5;       //margin kesalahan lebar sel, untuk jaga-jaga
        $startChar=0;       //posisi awal karakter untuk setiap baris
        $maxChar=0;         //karakter maksimum dalam satu baris, yang akan ditambahkan nanti
        $textArray=array(); //untuk menampung data untuk setiap baris
        $tmpString="";      //untuk menampung teks untuk setiap baris (sementara)
        
        while($startChar < $textLength){ //perulangan sampai akhir teks
            //perulangan sampai karakter maksimum tercapai
            while( 
            $pdf->GetStringWidth($tmpString) < ($cellWidth-$errMargin) &&
            ($startChar+$maxChar) < $textLength ) {
                $maxChar++;
                $tmpString=substr($column_perihal,$startChar,$maxChar);
            }
            //pindahkan ke baris berikutnya
            $startChar=$startChar+$maxChar;
            //kemudian tambahkan ke dalam array sehingga kita tahu berapa banyak baris yang dibutuhkan
            array_push($textArray,$tmpString);
            //reset variabel penampung
            $maxChar=0;
            $tmpString='';
            
        }
        //dapatkan jumlah baris
        $line=count($textArray);
    }

/*
$pdf->multicell(198,10,$column_perihal,0,0,'L');
*/
$ri = $pdf->GetStringWidth($column_perihal);
$xPos=$pdf->GetX();
$yPos=$pdf->GetY();
$pdf->multicell($cellWidth,$cellHeight,$column_perihal,0,0,'L');

//DISEDIAKAN KEPADA KABAN
$pdf->SetFont('Arial','',8);
$pdf->setY(86);
$pdf->SetX(5);
$pdf->Cell(200,10,'',1,0,'L',1);

$pdf->setY(86);
$pdf->SetX(5);
$pdf->Cell(30,10,$kata8,0,0,'L');

//CENTANG DISPOSISI
$pdf->SetFont('Arial','',8);
$pdf->setY(96);
$pdf->SetX(5);
$pdf->Cell(100,25,'',1,0,'L',1);

$pdf->setY(94);
$pdf->SetX(5);
$pdf->Cell(30,10,$kata10,0,0,'L');
$pdf->setY(94);
$pdf->SetX(43);
$pdf->Cell(30,10,':',0,0,'L');
$pdf->SetFont('Arial','B',10);
$pdf->setY(99);
$pdf->SetX(5);
$pdf->Cell(30,10,$column_namabidang,0,0,'L');

$pdf->SetFont('Arial','',8);
$pdf->setY(96);
$pdf->SetX(105);
$pdf->Cell(100,25,'',1,0,'L',1);
$pdf->setY(94);
$pdf->SetX(105);
$pdf->Cell(30,10,$kata9,0,0,'L');
$pdf->setY(94);
$pdf->SetX(127);
$pdf->Cell(30,10,':',0,0,'L');
$pdf->SetFont('Arial','B',10);
$pdf->setY(99);
$pdf->SetX(105);
$pdf->Cell(30,10,$columnisidispokaban,0,0,'L');

//catatan
$pdf->SetFont('Arial','B',8);
$pdf->setY(121);
$pdf->SetX(5);
$pdf->Cell(200,155,'',1,0,'L',1);

if($_SESSION['akses']==3 || $_SESSION['akses']==4 || $_SESSION['akses']==2){

    $dispokabid = mysqli_query($koneksi,"SELECT * from t_apms_dispo_a
        WHERE no_surat ='$nosurat' and id_project='$idp'; 
        ");

    $dispokasubid = mysqli_query($koneksi,"SELECT * from t_apms_dispo_b
        WHERE no_surat ='$nosurat' and id_project='$idp'; 
        ");

    $responstaf = mysqli_query($koneksi,"SELECT * from t_apms_dispo_c
        WHERE no_surat ='$nosurat' and id_project='$idp'; 
        ");

    $jabatan = mysqli_query($koneksi,"SELECT * from t_apms_jabatan
        WHERE id_jab = '".$_SESSION['akses']."'");
    $dtjab = mysqli_fetch_array($jabatan);
    
    $pdf->setY(121);
    $pdf->SetX(5);
    $pdf->Cell(30,10,$kata11,0,0,'L');

    $xawal = 6;
    $yawal = 130;

    while($data=mysqli_fetch_array($dispokabid)){
    $namauser = mysqli_query($koneksi,"SELECT nama from t_apms_user
        WHERE userid='".$data['userid']."'");
    $row=mysqli_fetch_array($namauser);

    $dis = 'From : '.ucwords($row[0]).' - '.'To : '.ucwords($nmsubbid);
    $pdf->SetFont('Arial','B',10);
    $pdf->setY($yawal);
    $pdf->SetX($xawal);
    $pdf->Cell(195,5,$dis,0,0,'L');
    $yawal=$yawal+5;
    
    $dis1 = '['.$data['tgl_kirim'].'] '.ucwords(nl2br($data['notice']));
    $pdf->SetFont('Arial','',10);
    $pdf->setY($yawal);
    $pdf->SetX($xawal);
    $pdf->multiCell(195,5,$dis1,0,0,'L');
    $yawal=$yawal+10;
    }

    $sx1=6;
    $sy1=170;

    while($data1=mysqli_fetch_array($dispokasubid)){
    $namauser1 = mysqli_query($koneksi,"SELECT nama from t_apms_user
        WHERE userid='".$data1['userid']."'");
    $row1=mysqli_fetch_array($namauser1);

    $dis2 = 'From : '.ucwords($row1[0]).' - '.'To : '.ucwords($nmstaf);
    $pdf->SetFont('Arial','B',10);
    $pdf->setY($sy1);
    $pdf->SetX($sx1);
    $pdf->Cell(195,5,$dis2,0,0,'L');
    $sy1=$sy1+5;
    
    $dis3 = '['.$data1['tgl_kirim'].'] '.ucwords(nl2br($data1['notice'])).' ';
    $pdf->SetFont('Arial','',10);
    $pdf->setY($sy1);
    $pdf->SetX(6);
    $pdf->MultiCell(195,5,$dis3,0,0,'L');
    $sy1=$sy1+5;
    }


    $sx=6;
    $sy=220;
    
    while($data2=mysqli_fetch_array($responstaf)){
    
    $namauser2 = mysqli_query($koneksi,"SELECT nama from t_apms_user
        WHERE userid='".$data2['userid']."'");
    $row2=mysqli_fetch_array($namauser2);

    $dis3 = 'From : '.ucwords($row2[0]);
    $pdf->SetFont('Arial','B',10);
    $pdf->setY($sy);
    $pdf->SetX($sx);
    $pdf->MultiCell(195,5,$dis3,0,0,'R');
    $sy=$sy+5;
       
    $dis4 = '['.$data2['tgl_kirim'].'] '.ucwords(nl2br($data2['notice']));
    $pdf->SetFont('Arial','',10);
    $pdf->setY($sy);
    $pdf->SetX(6);
    $pdf->MultiCell(195,5,$dis4,0,0,'R');
        $sy=$sy+5;
    }

}

$pdf->SetFont('Arial','B',8);
$pdf->setY(270);
$pdf->SetX(184);
$pdf->Cell(20,5,'Print By Sistem',0,0,'R',1);

$namafile = "diposisi_".$nosurat.'.pdf';
$pdf->Output($namafile,'I');
?>