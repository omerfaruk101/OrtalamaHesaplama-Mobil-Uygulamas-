//constants(sabitler) renk font vs değişmeyecek olan şeyler.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler{

static const anaRenk = Colors.yellow;
static final TextStyle baslikStyle =  GoogleFonts.lora(
  fontSize: 28, fontWeight: FontWeight.w600, color: anaRenk
);

static BorderRadius borderRadius = BorderRadius.circular(12);

static final TextStyle ortalamaGosterBodyStyle = GoogleFonts.lora(
  fontSize: 16, fontWeight: FontWeight.w300, color: anaRenk);

static final TextStyle ortalamaStyle = GoogleFonts.lora(
  fontSize: 50, fontWeight: FontWeight.w800, color: anaRenk

);

static final dropDownPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 8);

static final yatayPadding8 = EdgeInsets.symmetric(horizontal: 8);

}