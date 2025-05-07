import 'package:flutter/material.dart';
import 'package:notortalamahesap/constants/app_constants.dart';
import 'package:notortalamahesap/pages/ortalama_hesapla_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dinamik Ortalama Hesaplama",
      theme: ThemeData(
        primarySwatch: Sabitler.anaRenk,
        visualDensity: VisualDensity.adaptivePlatformDensity // uygulamanın her ortamda çalışması için
      ),
      home: OrtalamaHesaplaPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
