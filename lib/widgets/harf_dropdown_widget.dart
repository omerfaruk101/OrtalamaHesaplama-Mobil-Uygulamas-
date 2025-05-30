import 'package:flutter/material.dart';
import 'package:notortalamahesap/constants/app_constants.dart';
import 'package:notortalamahesap/helper/data_helper.dart';

class HarfDropdownWidget extends StatefulWidget {
  final Function onHarfSecildi;
  const HarfDropdownWidget({required this.onHarfSecildi,super.key});

  @override
  State<HarfDropdownWidget> createState() => _HarfDropdownWidgetState();
}

class _HarfDropdownWidgetState extends State<HarfDropdownWidget> {
    double secilenHarfDegeri = 4;
    
  @override
  Widget build(BuildContext context) {
     return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
  decoration: BoxDecoration(
    color: Sabitler.anaRenk.shade100.withOpacity(0.5),
    borderRadius: Sabitler.borderRadius,
  ),
  child: DropdownButton<double>(
    value: secilenHarfDegeri,
    elevation: 16,
    iconEnabledColor: Sabitler.anaRenk.shade200,
    onChanged: (deger){
      setState(() {
        secilenHarfDegeri = deger!;
        widget.onHarfSecildi(secilenHarfDegeri);
      });
    },
    underline: Container(),
    items: DataHelper.tumDerslerinHarfleri(),
  ),
);
  }
}