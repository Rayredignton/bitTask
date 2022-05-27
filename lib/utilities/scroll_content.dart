import 'dart:math';

import '../shared/app_assets.dart';

class ScrollContent {
  String image;
  String image2;
  
  double angle;
  double angle2;
  double angle3;
 
  


  ScrollContent({required this.image, required this.angle,required this.angle2,required this.angle3,  required this.image2, });
}

List<ScrollContent> contents = [
 ScrollContent(
    angle: -pi/ 10,
    angle2: -pi/10,
    angle3: 0,
    image: Assets.gold,
    image2: Assets.black,
),
   ScrollContent(
  
    angle: -pi/ 15,
    angle2: -pi/10,
    angle3: pi /6,
    image: Assets.gold,
    image2: Assets.black,
  ),
 
 
  ScrollContent(
 angle: -pi/ 10,
    angle2: -pi/10,
    angle3: 0,
    image: Assets.black,
    image2: Assets.gold,),
  
];