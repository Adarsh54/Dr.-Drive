// TODO Implement this library.
import 'package:flutter/material.dart';
import 'dart:math';
import 'wireTest.dart';

class wireImageAsset1 extends StatelessWidget {
  @override

  Widget build(BuildContext context) {

    AssetImage assetImage = AssetImage ('images/WirePuzzle1.png');
    Image image = Image(image: assetImage);
    return Container(
      child: image,
      height: 1000,
    );
  }
}
class wireImageAsset2 extends StatelessWidget {
  @override

  Widget build(BuildContext context) {

    AssetImage assetImage = AssetImage ('images/WirePuzzle2.png');
    Image image = Image(image: assetImage);
    return Container(
      child: image,
      height: 900,
    );
  }
}
class wireImageAsset3 extends StatelessWidget {
  @override

  Widget build(BuildContext context) {

    AssetImage assetImage = AssetImage ('images/WirePuzzle3.png');
    Image image = Image(image: assetImage);
    return Container(
      child: image,
      height: 900,

    );
  }
}
class wireImageAsset4 extends StatelessWidget {
  @override

  Widget build(BuildContext context) {

    AssetImage assetImage = AssetImage ('images/WirePuzzle4.png');
    Image image = Image(image: assetImage);
    return Container(
      child: image,
      height: 900,

    );
  }
}

class homeScreen1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage ('Background.png');
    //AssetImage assetImage = AssetImage ('SickHomeScreen.png');
    Image a = Image(image: assetImage);
    return Container(
      decoration: BoxDecoration(
         image: DecorationImage(
           image: assetImage,
           fit: BoxFit.cover,
         ),
      ),
    );
  }
}

