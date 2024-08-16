import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../assets_path/AppIconsPath.dart';

// ignore: must_be_immutable
class CategoryWidget extends StatelessWidget {
    


  CategoryWidget(this.index, {super.key});
  int index;
  List categoryName=[
    'Quyosh elektr stansiyasi',
    'Suv isitish kollektori',
    'Shamol elektor stansiyasi',
    'Issiq havo nasoslari',
    'Yoqilg\'i mahsulotlari',
    'Romlar'
  ];
  List bgColors=[
    Color.fromRGBO(62, 140, 199, 0.1),
    Color.fromRGBO(252, 188, 4, 0.1),
      Color.fromRGBO(102, 204, 255, 0.1),
      Color.fromRGBO(63, 140, 244, 0.1),
      Color.fromRGBO(62, 140, 199, 0.1),
      Color.fromRGBO(63, 140, 244, 0.1),
  ];
  List categoryIcons=[
    AppIcons.category1,
    AppIcons.category2,
    AppIcons.category3,
    AppIcons.category4,
    AppIcons.category5,
    AppIcons.category6,
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: bgColors[index],
            child: SvgPicture.asset(categoryIcons[index]),
          ),
         
          SizedBox(
            height: 5,
          ),
          Text(
            categoryName[index],
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
