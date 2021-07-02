import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:knn_telur/utils/atom/text_style.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: AutoSizeText(
          'TENTANG APLIKASI',
          style: globalTextStyle,
        ),
      ),
      body: Container(
        // color: Colors.cyan[50],
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                const Text(
                  'Panduan penggunaan aplikasi ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  '1. Buka aplikasi',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  '2. Masukan gambar pada menu home',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  '3. Pilih gambar yang akan diuji',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    '4. Lakukan proses cropping apabila diperlukan, kemudian klik centang',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  '5. Tunggu hingga hasilnya muncul',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  '6. Atur nilai k dalam menu setting',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Row(
              children: [
                // Expanded(
                //   child:
                const Text(
                  '7. Lihat data uji kualitas telur pada menu data training',
                  style: TextStyle(fontSize: 15),
                ),
                // ),
              ],
            ),
            // Expanded(
            //   child:
            const Divider(color: Colors.black),
            // ),
            Row(
              children: [
                const Text(
                  'Info pembuat ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Nama : Erma Dwi Widyawati',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'NIM    : 201751013',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Row(
              children: [
                // Expanded(
                //   child:
                const Text(
                  'Prodi   : Teknik Informatika Universitas Muria Kudus',
                  style: TextStyle(fontSize: 15),
                ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
