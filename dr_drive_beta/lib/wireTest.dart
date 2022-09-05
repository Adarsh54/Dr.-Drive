// TODO Implement this library.
import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import "wireImageAsset.dart";
import "QuestionsTest.dart";


class wireTest extends StatefulWidget{
  @override
  _wireTest createState() => _wireTest();
}

class _wireTest extends State<wireTest> with TickerProviderStateMixin{
  @override

  bool isConnected = false;
  bool isStartVisible = true;
  bool isDotsVisible = false;

  Color a = Colors.white;
  Color b = Colors.white;
  Color c = Colors.white;
  Color d = Colors.white;
  Color e = Colors.white;
  Color f = Colors.white;
  Color g = Colors.white;
  Color h = Colors.white;

  bool isImage1 = false;
  bool isImage2 = false;
  bool isImage3 = false;
  bool isImage4 = false;


  int button1 = 0;
  int button2 = 0;
  int button3 = 0;
  int button4 = 0;
  int button5 = 0;
  int button6 = 0;
  int button7 = 0;
  int button8 = 0;

  bool buttonOne = false;
  bool buttonTwo = false;
  bool buttonThree = false;
  bool buttonFour = false;
  bool buttonFive = false;
  bool buttonSix = false;
  bool buttonSeven = false;
  bool buttonEight = false;

  int hasPressed = 0;
  var random = new Random();
  int version = 0;
  int count = 0;
  int eightButtonsPressed =0;

  bool startispressed = true;
  bool stopispressed = true;
  bool resetispressed = false;
  String stoptimetodisplay= "00";
  bool isStopwatchVisible=false;
  bool isStopVisible = false;
  var totalTime=0.0;
  bool isWaitVisible = false;
  var swatch = Stopwatch();
  final dur =const Duration (seconds: 1);


  bool isQuestionsVisible = false;

  void startTimer(){
    Timer(dur, keeprunning);
  }
  void keeprunning(){
    if(swatch.isRunning){
      startTimer();
    }
    setState(() {
      stoptimetodisplay = (swatch.elapsed.inSeconds).toString().padLeft(1,"0")+"."+(swatch.elapsed.inMilliseconds%1000).toString().padLeft(2,"0");
    });
  }
  Future<void> startstopwatch() async{
    setState(() {
      stopispressed =false;
      startispressed = false;

    });

    wait();




  }
  void wait() {

    setState(() {
      stopispressed =false;
      startispressed = false;

    });
    startTimer();
    swatch.start();
    keeprunning();

  }
  void stopstopwatch(){
    swatch.stop();
    keeprunning();
    setState(() {
      stopispressed = true;
      resetispressed = true;
      isStopwatchVisible= true;
      isImage1 = false;
      isImage2 = false;
      isImage3 = false;
      isImage4 = false;
    });

    Timer(Duration(seconds: 3), () {
      setState(() {
        isStartVisible=false;
        totalTime+= double.parse(stoptimetodisplay);
      });

      resetstopwatch();
    });
  }
  void resetstopwatch(){

    double avg = totalTime/5;
    checkData('$avg');
    setState(() {
      startispressed = true;
      stopispressed = true;
      resetispressed = true;
      stoptimetodisplay= "00";
      isStopwatchVisible=false;
      stoptimetodisplay= "00.0";
      isStartVisible = false;
      isDotsVisible = false;
      isQuestionsVisible = true;

    });
    swatch.reset();


  }





  Future<String> get localPath async{
    final path = await getApplicationDocumentsDirectory();
    return path.path;
  }
  Future<File> get localFile async{
    final file = await localPath;
    return new File('$file/data.txt');
  }
  Future<File> writeData(String value) async{
    final file = await localFile;
    String data = await file.readAsString();
    value = data+value.substring(0,3);
    return file.writeAsString('$value');
  }
  Future<File> checkData(String time) async{
    try {
      final file = await localFile;
      String data = await file.readAsString();
      time = time.substring(0,3);
      if(data.length>6) {

        if(data.length == 18){
          data = data.substring(0,15)+time+data.substring(15);
        }
        if(data.length == 24){
          data = data.substring(0,15)+time+data.substring(18);
        }


        return file.writeAsString('$data');
      }
      else{
        return writeData(time);
      }
    }
    catch(e){
      return writeData(time);
    }

  }









  void start(){
    chooseRandomVersion();
    setState(() {
      isStartVisible =!isStartVisible;
      if(version == 1){
        isImage1 = true;
      }
      if(version == 2){
        isImage2 = true;
      }
      if(version == 3){
        isImage3 = true;
      }
      if(version == 4){
        isImage4 = true;
      }
      isDotsVisible = true;
    });
    startstopwatch();
  }


  void chooseRandomVersion(){

    version = 1;
    if(version == 1){
      button1 = 1;
      button7 = 2;

      button2 = 3;
      button8 = 4;

      button3 = 5;
      button6 = 6;

      button4 = 7;
      button5 = 8;
    }
    if(version == 2){
      button1 = 1;
      button6 = 2;

      button2 = 3;
      button7 = 4;

      button3 = 5;
      button5 = 6;

      button4 = 7;
      button8 = 8;
    }
    if(version == 3){
      button1 = 1;
      button8 = 2;

      button2 = 3;
      button5 = 4;

      button3 = 5;
      button7 = 6;

      button4 = 7;
      button6 = 8;
    }
    if(version == 4){
      button1 = 1;
      button6 = 2;

      button2 = 3;
      button5 = 4;

      button3 = 5;
      button8 = 6;

      button4 = 7;
      button7 = 8;
    }
  }

  void check(int number){

    if(hasPressed<2) {
      hasPressed++;

      if (version == 1) {
        if (number == 1) {
          buttonOne = true;
          setState(() {
            a = Colors.black;
          });
        }
        if (number == 2) {
          buttonSeven = true;
          setState(() {
            g = Colors.black;
          });
        }
        if (number == 3) {
          buttonTwo = true;
          setState(() {
            b = Colors.black;
          });
        }
        if (number == 4) {
          buttonEight = true;
          setState(() {
            h = Colors.black;
          });
        }
        if (number == 5) {
          buttonThree = true;
          setState(() {
            c = Colors.black;
          });
        }
        if (number == 6) {
          buttonSix = true;
          setState(() {
            f = Colors.black;
          });
        }
        if (number == 7) {
          buttonFour = true;
          setState(() {
            d = Colors.black;
          });
        }
        if (number == 8) {
          buttonFive = true;
          setState(() {
            e = Colors.black;
          });
        }
        if (buttonOne && buttonSeven) {
          setState(() {
            a = Colors.green;
            g = Colors.green;
            hasPressed = 0;
            buttonOne = false;
            buttonSeven = false;
            eightButtonsPressed+= 2;
          }
          );
        }
        if (buttonTwo && buttonEight) {
          setState(() {
            b = Colors.green;
            h = Colors.green;
            hasPressed = 0;
            buttonTwo = false;
            buttonEight = false;
            eightButtonsPressed+= 2;

          });
        }
        if (buttonThree && buttonSix) {
          setState(() {
            c = Colors.green;
            f = Colors.green;
            hasPressed = 0;
            buttonThree = false;
            buttonSix = false;
            eightButtonsPressed+= 2;

          });
        }
        if (buttonFour && buttonFive) {
          setState(() {
            d = Colors.green;
            e = Colors.green;
            hasPressed = 0;
            buttonFour = false;
            buttonFive = false;
            eightButtonsPressed+= 2;

          });
        }
      }
      if (version == 2) {
        if (number == 1) {
          buttonOne = true;
          setState(() {
            a = Colors.black;
          });
        }
        if (number == 2) {
          buttonSix = true;
          setState(() {
            f = Colors.black;
          });
        }
        if (number == 3) {
          buttonTwo = true;
          setState(() {
            b = Colors.black;
          });
        }
        if (number == 4) {
          buttonSeven = true;
          setState(() {
            g = Colors.black;
          });
        }
        if (number == 5) {
          buttonThree = true;
          setState(() {
            c = Colors.black;
          });
        }
        if (number == 6) {
          buttonFive = true;
          setState(() {
            e = Colors.black;
          });
        }
        if (number == 7) {
          buttonFour = true;
          setState(() {
            d = Colors.black;
          });
        }
        if (number == 8) {
          buttonEight = true;
          setState(() {
            h = Colors.black;
          });
        }
        if (buttonOne && buttonSix) {
          setState(() {
            a = Colors.green;
            f = Colors.green;
            hasPressed = 0;
            buttonOne = false;
            buttonSix = false;
            eightButtonsPressed+= 2;

          });
        }
        if (buttonTwo && buttonSeven) {
          setState(() {
            b = Colors.green;
            g = Colors.green;
            hasPressed = 0;
            buttonTwo = false;
            buttonSeven = false;
            eightButtonsPressed+= 2;

          });
        }
        if (buttonThree && buttonFive) {
          setState(() {
            c = Colors.green;
            e = Colors.green;
            hasPressed = 0;
            buttonThree = false;
            buttonFive = false;
            eightButtonsPressed+= 2;

          });
        }
        if (buttonFour && buttonEight) {
          setState(() {
            d = Colors.green;
            h = Colors.green;
            hasPressed = 0;
            buttonFour = false;
            buttonEight = false;
            eightButtonsPressed+= 2;

          });
        }
      }
      if (version == 3) {
        if (number == 1) {
          buttonOne = true;
          setState(() {
            a = Colors.black;
          });
        }
        if (number == 2) {
          buttonEight = true;
          setState(() {
            h = Colors.black;
          });
        }
        if (number == 3) {
          buttonTwo = true;
          setState(() {
            b = Colors.black;
          });
        }
        if (number == 4) {
          buttonFive = true;
          setState(() {
            e = Colors.black;
          });
        }
        if (number == 5) {
          buttonThree = true;
          setState(() {
            c = Colors.black;
          });
        }
        if (number == 6) {
          buttonSeven = true;
          setState(() {
            g = Colors.black;
          });
        }
        if (number == 7) {
          buttonFour = true;
          setState(() {
            d = Colors.black;
          });
        }
        if (number == 8) {
          buttonSix = true;
          setState(() {
            f = Colors.black;
          });
        }
        if (buttonOne && buttonEight) {
          setState(() {
            a = Colors.green;
            h = Colors.green;
            buttonOne = false;
            buttonEight = false;
            hasPressed = 0;
            eightButtonsPressed+= 2;

          });
        }
        if (buttonTwo && buttonFive) {
          setState(() {
            b = Colors.green;
            e = Colors.green;
            buttonTwo = false;
            buttonFive = false;
            hasPressed = 0;
            eightButtonsPressed+= 2;

          });
        }
        if (buttonThree && buttonSeven) {
          setState(() {
            c = Colors.green;
            g = Colors.green;
            buttonThree = false;
            buttonSeven = false;
            hasPressed = 0;
            eightButtonsPressed+= 2;

          });
        }
        if (buttonFour && buttonSix) {
          setState(() {
            d = Colors.green;
            f = Colors.green;
            buttonFour = false;
            buttonSix = false;
            hasPressed = 0;
            eightButtonsPressed+= 2;

          });
        }
      }
      if (version == 4) {
        if (number == 1) {
          buttonOne = true;
          setState(() {
            a = Colors.black;
          });
        }
        if (number == 2) {
          buttonSix = true;
          setState(() {
            f = Colors.black;
          });
        }
        if (number == 3) {
          buttonTwo = true;
          setState(() {
            b = Colors.black;
          });
        }
        if (number == 4) {
          buttonFive = true;
          setState(() {
            e = Colors.black;
          });
        }
        if (number == 5) {
          buttonThree = true;
          setState(() {
            c = Colors.black;
          });
        }
        if (number == 6) {
          buttonEight = true;
          setState(() {
            h = Colors.black;
          });
        }
        if (number == 7) {
          buttonFour = true;
          setState(() {
            d = Colors.black;
          });
        }
        if (number == 8) {
          buttonSeven = true;
          setState(() {
            g = Colors.black;
          });
        }
        if (buttonOne && buttonSix) {
          setState(() {
            a = Colors.green;
            f = Colors.green;
            hasPressed = 0;
            buttonOne = false;
            buttonSix = false;
            eightButtonsPressed+= 2;

          });
        }
        if (buttonTwo && buttonFive) {
          setState(() {
            b = Colors.green;
            e = Colors.green;
            hasPressed = 0;
            buttonTwo = false;
            buttonFive = false;
            eightButtonsPressed+= 2;


          });
        }
        if (buttonThree && buttonEight) {
          setState(() {
            c = Colors.green;
            h = Colors.green;
            hasPressed = 0;
            buttonThree = false;
            buttonEight = false;
            eightButtonsPressed+= 2;

          });
        }
        if (buttonFour && buttonSeven) {
          setState(() {
            d = Colors.green;
            g = Colors.green;
            hasPressed = 0;
            buttonFour = false;
            buttonSeven = false;
            eightButtonsPressed+= 2;

          });
        }
      }
    }
    if(hasPressed >= 2){
      reset();
    }
    if(eightButtonsPressed == 8){
      stopstopwatch();
    }

  }

  void reset(){
    hasPressed = 0;
    eightButtonsPressed = 0;
    setState(() {
      a = Colors.red;
      b = Colors.red;
      c = Colors.red;
      d = Colors.red;
      e = Colors.red;
      f = Colors.red;
      g = Colors.red;
      h = Colors.red;

      buttonOne = false;
      buttonTwo = false;
      buttonThree = false;
      buttonFour = false;
      buttonFive = false;
      buttonSix = false;
      buttonSeven = false;
      buttonEight = false;


    });
    backToBlack();
  }
  Future<void> backToBlack() async{
    await Future<void>.delayed(const Duration(milliseconds: 250));

    setState(() {
      a = Colors.white;
      b = Colors.white;
      c = Colors.white;
      d = Colors.white;
      e = Colors.white;
      f = Colors.white;
      g = Colors.white;
      h = Colors.white;

    });


  }


  @override
  Widget main() {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex:22,
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SizedBox(
                              height: 30,
                              width: 30,
                              child: RaisedButton(
                                onPressed: () => check(button1),
                                color: a,
                                shape: CircleBorder(),

                              )
                          ),
                          SizedBox(
                              height: 30,
                              width: 30,
                              child: RaisedButton(
                                onPressed: () => check(button2),
                                color: b,
                                shape: CircleBorder(),

                              )
                          ),
                          SizedBox(
                              height: 30,
                              width: 30,
                              child: RaisedButton(
                                onPressed: () => check(button3),
                                color: c,
                                shape: CircleBorder(),

                              )
                          ),
                          SizedBox(
                              height: 30,
                              width: 30,
                              child: RaisedButton(
                                onPressed: () => check(button4),
                                color: d,
                                shape: CircleBorder(),

                              )
                          ),
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SizedBox(
                              height: 30,
                              width: 30,
                              child: RaisedButton(
                                onPressed: () => check(button5),
                                color: e,
                                shape: CircleBorder(),

                              )
                          ),
                          SizedBox(
                              height: 30,
                              width: 30,
                              child: RaisedButton(
                                onPressed: () => check(button6),
                                color: f,
                                shape: CircleBorder(),

                              )
                          ),
                          SizedBox(
                              height: 30,
                              width: 30,
                              child: RaisedButton(
                                onPressed: () => check(button7),
                                color: g,
                                shape: CircleBorder(),

                              )
                          ),
                          SizedBox(
                              height: 30,
                              width: 30,
                              child: RaisedButton(
                                onPressed: () => check(button8),
                                color: h,
                                shape: CircleBorder(),

                              )
                          ),
                        ]
                    ),
                  ]


              ),

            ),
          ),

        ],
      ),

    );






  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Stack(
        children: <Widget>[

          Visibility(

            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 720,
                height: 576,
                child: GestureDetector(
                  onTap: start,
                  child: Image.asset('images/StartWiresTest.png'),
                ),
              ),
            ),
            visible : isStartVisible,

          ),
          /*Visibility(
            child: SizedBox.expand(
                child: Container(
                  color: Colors.grey,
                )
            ),
            visible : !isStartVisible,

          ),*/

          Visibility(

            child: wireImageAsset1(),
            visible : isImage1,
          ),
          Visibility(
            child: wireImageAsset2(),
            visible : isImage2,
          ),
          Visibility(
            child: wireImageAsset3(),
            visible : isImage3,
          ),
          Visibility(
            child: wireImageAsset4(),
            visible : isImage4,
          ),
          Visibility(
            child: main(),
            visible : isDotsVisible,
          ),
          Visibility(
            child: Center(
              child: Text(
                'On the wires test, you took\n ' + stoptimetodisplay + '\nseconds!',
                style: TextStyle(
                  fontFamily: 'GoogleFonts.nunito()',
                  color: Colors.white,
                  fontSize: 50,
                  decoration: TextDecoration.none,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            visible : isStopwatchVisible,
          ),


          Visibility(
            child: questions(),
            visible: isQuestionsVisible,
          ),
        ],
      ),
    );
  }

}