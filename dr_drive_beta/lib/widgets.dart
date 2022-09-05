import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'wireTest.dart';



class stopwatch2 extends StatefulWidget{
  @override
  _stopwatch2 createState() => _stopwatch2();
}

class _stopwatch2 extends State<stopwatch2> with TickerProviderStateMixin{
  @override

  bool startispressed = true;
  bool stopispressed = true;
  bool resetispressed = false;
  String stoptimetodisplay= "00";
  bool isStartVisible= true;
  bool isStopwatchVisible=false;
  bool isStopVisible = false;
  var totalTime=0.0;
  int time=1;
  bool isWaitVisible = false;
  var swatch = Stopwatch();
  final dur =const Duration (seconds: 1);
  int count = 0;
  bool isDotVisible = false;
  bool isDiag = true;
  void generateRandomNumber(){
    var random = new Random();
    time= random.nextInt(3)+2;
  }
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
      isStartVisible= false;
      stopispressed =false;
      startispressed = false;
      isStopVisible =false;
      isWaitVisible= true;

    });

    wait();




  }
  Future<void> wait() async{
    await Future<void>.delayed(const Duration(seconds: 2));

    setState(() {
      isStartVisible= false;
      stopispressed =false;
      startispressed = false;
      isStopVisible =true;
      isWaitVisible= false;

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
      isStopVisible =false;
    });

    Timer(Duration(seconds: 3), () {
      setState(() {
        isStartVisible=true;
        totalTime+= double.parse(stoptimetodisplay);
      });

      resetstopwatch();
    });
  }
  void resetstopwatch(){
    setState(() {
      count++;
      startispressed = true;
      stopispressed = true;
      resetispressed = true;
      stoptimetodisplay= "00";
      isStartVisible= true;
      isStopVisible = false;
      isStopwatchVisible=false;
      stoptimetodisplay= "00.0";
    });
    swatch.reset();
    if(count == 3){
      double avg = totalTime/4;
      checkData('$avg');
      setState(() {
        isStopwatchVisible = false;
        isStartVisible = false;
        isDotVisible = true;
      });
    }

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
    value = value.substring(0,3);
    return file.writeAsString(value);
  }
  Future<File> checkData(String time) async{
    try {
      final file = await localFile;
      String data = await file.readAsString();
      time = time.substring(0,3);
      if(data.length == 12){
        data = data.substring(0,3)+time+data.substring(3);
      }
      if(data.length == 24){
        data = data.substring(0,3)+time+data.substring(6);
      }


      return file.writeAsString('$data');
    }
    catch(e){
      return writeData(time);
    }

  }










  @override
  Widget build(BuildContext context) {
    return Container(



                    child: Stack(
                      children: <Widget>[
                        Visibility(

                          child: Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 720,
                              height: 576,
                              child: GestureDetector(
                                child: Image.asset('images/QuickTimeButtons/QuickTimeRed.png'),
                              ),
                            ),
                          ),
                          visible : isWaitVisible,
                        ),

                        Visibility(
                          child: Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 720,
                              height: 576,
                              child: GestureDetector(
                                onTap: stopispressed ? null : stopstopwatch,
                                child: Image.asset('images/QuickTimeButtons/QuickTimeGreen1.png'),
                              ),
                            ),
                          ),
                          visible: isStopVisible,
                        ),
                        Visibility(
                          child: Center(
                            child: Text(
                              stoptimetodisplay + ' Seconds',
                              style: TextStyle(
                                fontFamily: 'GoogleFonts.nunito()',
                                color: Colors.white,
                                decoration: TextDecoration.none,
                              ),

                              /*style: TextStyle(
                                fontSize: 50.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),*/
                            ),
                          ),
                          visible: isStopwatchVisible,
                        ),
                        Visibility(
                          child: Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 720,
                              height: 576,
                              child: GestureDetector(
                                onTap: startispressed ? startstopwatch: null ,
                                child: Image.asset('images/QuickTimeButtons/QuickTimeWhite.png'),
                              ),
                            ),
                          ),
                         visible : isStartVisible,
                        ),

                        Visibility(
                          child: dotTest(),
                          visible: isDotVisible,
                        ),

                      ],

                    )

                );





  }

}
class dotTest extends StatefulWidget{
  @override
  _dotTest createState() => _dotTest();
}

class _dotTest extends State<dotTest> with TickerProviderStateMixin{
  @override
  bool startispressed = true;
  bool stopispressed = true;
  bool resetispressed = false;
  String stoptimetodisplay= "00";
  bool isStartVisible= true;
  bool isStopwatchVisible=false;
  bool isStopVisible = false;
  var totalTime=0.0;
  bool isWaitVisible = false;
  var swatch = Stopwatch();
  final dur =const Duration (seconds: 1);
  int count = 0;
  bool isWireVisible = false;

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
      isStopVisible = false;
      isWireVisible = true;
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
      if(data.length>3) {
        if (data.length == 15) {
          data = data.substring(0, 9) + time + data.substring(9);
        }
        if(data.length == 24) {
          data = data.substring(0,9) + time + data.substring(12);
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













  void titleisPressed(){
    setState(() {
      isStartVisible = false;
      isStopVisible=true;
    });
  }

  double x= 300;
  double y= 300;
  void changeLocation(){

     setState(() {

       x= generateRandomNumber();
        y= generateYRandomNumber();
        count++;
      });
      if(count>= 10){
        stopstopwatch();
        setState(() {
          isStopVisible = false;
        });
      }
      else {
        startstopwatch();
      }
  }

  double generateRandomNumber(){
    var random = new Random();
    double h = (random.nextInt(350)*.8+20);
    return h;
  }

  double generateYRandomNumber(){
    var random = new Random();
    double r= random.nextInt(650)*.8+50;
    double h= r+0.0;
    return h;
  }
  @override
  Widget build(BuildContext context) {

    return Container(
        child: Center(

          child: Stack(
            children: <Widget>[
              /*Visibility(
                    child: SizedBox.expand(
                      child: Container(
                        color: Colors.black,
                      ),
                    ),
                visible: isStopVisible,

              ),*/

              Visibility(
                child: SizedBox.expand(),
                visible: isStopVisible,
              ),
              Visibility(
                child: Transform(
                    transform: Matrix4.translationValues(x, y, 0.0),
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: RaisedButton(
                        onPressed: changeLocation,
                        color: Colors.white,
                        shape: CircleBorder(),

                      )
                   ),
                ),
                visible: isStopVisible,
              ),
              Visibility(

                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 720,
                    height: 576,
                    child: GestureDetector(
                      onTap: titleisPressed,
                      child: Image.asset('images/StartDotsTest.png'),
                    ),
                  ),
                ),
                visible : isStartVisible,

              ),
               Visibility(
                  child: Center(
                    child: Text(
                        'On the dots test, you took ' + stoptimetodisplay + ' seconds!',
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
                child: wireTest(),
                visible: isWireVisible,
              ),
            ],
        ),
     ),
    );




  }

}


