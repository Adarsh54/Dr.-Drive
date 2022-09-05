
import 'package:flutter/material.dart';
import 'package:stopwatch/QuestionsTest.dart';
import 'package:stopwatch/widgets.dart';
import 'package:stopwatch/wireImageAsset.dart';
import 'informationTab.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DriveTest",

      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget{
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin{

  bool isHomeVisible = true;
  bool isTwoVisible = false;
  bool isDotVisible = false;
  bool isWireVisible = false;

  bool isInfoVisible = false;

  void changeScreen1(){
    setState(() {
      isHomeVisible = false;
       isTwoVisible = true;
       isDotVisible = false;
       isWireVisible = false;
    });
  }

  void pullUpInfo(){
    setState(() {
      isHomeVisible = false;
      isInfoVisible = true;
    });
  }

  void getRidOfInfo(){
    setState(() {
      isHomeVisible = true;
      isInfoVisible = false;
    });
  }

  @override
  Widget build(BuildContext context){

    return Container(
      child: Stack(
        children: <Widget>[
          Visibility(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end:
                    Alignment(0.0, 0.0), // 10% of the width, so there are ten blinds.
                    colors: [
                      const Color(0xFF427abe),
                      const Color(0xFF9ebbc3)
                    ], // red to yellow
                    //tileMode: TileMode.repeated, // repeats the gradient over the canvas
                  ),
                ),
              ),
              //visible: isHomeVisible,
            visible: true,
          ),

          Visibility(

              child: homeScreen1(),
              //visible: isHomeVisible,
            visible: true,
          ),

          Visibility(
              child: InfoPage(),
            visible: isInfoVisible,
          ),

          Visibility(
            child: Positioned.fill(
              child: Visibility(
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 300,
                    height: 100,
                    child: GestureDetector(
                          onTap: changeScreen1,
                          child: Image.asset('StartButtonTransparent.png'),
                        ),
                      ),
                    ),
                visible: isHomeVisible,
              ),
              ),
            visible: isHomeVisible,

          ),

          Visibility(
            child: Positioned.fill(
              top: 20,
              left: 20,
                child: Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: GestureDetector(
                    onTap: getRidOfInfo,
                    child: Image.asset('images/XButton.png'),
                  ),
                ),
                ),
            ),
            visible: isInfoVisible,
          ),

          Visibility(
            child: Positioned.fill(
                top: 20,
                left: 20,
                child: Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: GestureDetector(
                    onTap: pullUpInfo,
                    child: Image.asset('images/InfoButton.png'),
                  ),
                ),
                ),
            ),
            visible: isHomeVisible,
          ),

          Visibility(
            child: stopwatch2(),
            visible: isTwoVisible,
          ),



        ],
      ),
    );
  }
}