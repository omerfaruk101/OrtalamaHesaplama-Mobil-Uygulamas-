
import 'package:flutter/material.dart';
import 'package:notortalamahesap/constants/app_constants.dart';

class OrtalamaGoster extends StatelessWidget {
  
  final double ortalama; 
  final int dersSayisi;

  const OrtalamaGoster({required this.dersSayisi, required this.ortalama, key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(dersSayisi > 0 ? "$dersSayisi Ders Girildi" : "Ders Seçildi",
        style: Sabitler.ortalamaGosterBodyStyle,
        ),
        Text(ortalama >=0 ? "${ortalama.toStringAsFixed(2)}" : "0.00",
        style: Sabitler.ortalamaStyle,
        ),
        Text("Ortalama",
        style: Sabitler.ortalamaGosterBodyStyle,
        ),
      ],
    );
  }
}