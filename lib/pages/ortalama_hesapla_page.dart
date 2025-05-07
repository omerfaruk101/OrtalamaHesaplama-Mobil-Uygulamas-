
import 'package:flutter/material.dart';
import 'package:notortalamahesap/constants/app_constants.dart';
import 'package:notortalamahesap/helper/data_helper.dart';
import 'package:notortalamahesap/model/ders.dart';
import 'package:notortalamahesap/widgets/ders_listesi.dart';
import 'package:notortalamahesap/widgets/harf_dropdown_widget.dart';
import 'package:notortalamahesap/widgets/kredi_dropdown_widget.dart';
import 'package:notortalamahesap/widgets/ortalama_goster.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  
  var formKey = GlobalKey<FormState>();
  double secilenHarfDegeri = 4;
  double secilenKrediDegeri = 4;
  String girilenDersAdi = "";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF195042),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(child: Text("Ortalama Hesapla", style: Sabitler.baslikStyle,),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
          child: _buildForm(),
        ),
        Expanded(
          flex: 1,
          child: OrtalamaGoster(dersSayisi: DataHelper.tumEklenenDersler.length, ortalama: DataHelper.ortalamaHesapla()),
        ),
            ],
          ),
        Expanded(
          child: DersListesi(
            onElemanCikarildi: (index){
              DataHelper.tumEklenenDersler.removeAt(index);
              setState(() {
                
              });
            },
          ),
        ),
        ],
      ),
    );
  }
  
  Widget _buildForm() {

    return Form(
    key: formKey,
     child: Column(
      children: [
        Padding(padding: Sabitler.yatayPadding8,child: _buildTextFormField(),),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Padding(padding: Sabitler.yatayPadding8, child: HarfDropdownWidget(
              onHarfSecildi: (harf){
                secilenHarfDegeri = harf;
              } ,
            ))),
            Expanded(child: Padding(padding: Sabitler.yatayPadding8, child: KrediDropdownWidget(
              onKrediSecildi: (kredi){
                secilenKrediDegeri = kredi;
              },
            ))),
            IconButton(onPressed: _dersEkleveOrtalamaHesapla,
            icon: Icon(Icons.arrow_forward_ios_sharp),
            color: Sabitler.anaRenk,
            iconSize: 30,
            ),
          ],
        ),
        SizedBox(height: 8,)
      ],
    ),
    );
  }
  
  _buildTextFormField() {

    return TextFormField(
      onSaved: (deger){
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (s) {
        if(s!.length <=0 ){
          return "Ders adını giriniz";
        }else{
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: "Ders Giriniz",
        border: OutlineInputBorder(
          borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none
        ),
        filled: true,
        fillColor: Sabitler.anaRenk.shade200.withOpacity(0.5),
      ),
    );
  }
  


  void _dersEkleveOrtalamaHesapla() {
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      var eklenecekDers = Ders(ad:girilenDersAdi,harfDegeri: secilenHarfDegeri, krediDegeri: secilenKrediDegeri);
      DataHelper.dersEkle(eklenecekDers);
      print(DataHelper.ortalamaHesapla());
      setState(() {});
    }
  }
}
