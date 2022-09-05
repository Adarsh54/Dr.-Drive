import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:developer';
import 'dart:math';

import 'package:path_provider/path_provider.dart';
import 'package:stopwatch/results.dart';


class questions extends StatefulWidget{
  @override
  _questions createState() => _questions();
}

class _questions extends State<questions> with TickerProviderStateMixin{
  Random rnd = new Random();
  int page = 0;
  int startingPage;

  var swatch = Stopwatch();
  final dur =const Duration (seconds: 1);
  String stoptimetodisplay= "00";
  double totalTime=0.0;
  int randomPage =1;

  void generateRandomNumber(){
    var random = new Random();
    randomPage = random.nextInt(3)+1;
  }
  void startTimer(){
    Timer(dur, keeprunning);
  }
  void keeprunning(){
    if(swatch.isRunning){
      startTimer();
    }
    if(!mounted)return;
    setState(() {
      stoptimetodisplay = (swatch.elapsed.inSeconds).toString().padLeft(1,"0")+"."+(swatch.elapsed.inMilliseconds%1000).toString().padLeft(2,"0");
    });
  }
  Future<void> wait() async{
    await Future<void>.delayed(const Duration(seconds: 2));
    setState(() {

    });
    startTimer();
    swatch.start();
    keeprunning();

  }
  Future<void> startstopwatch() async{

    wait();
  }
  void stopstopwatch(){
    swatch.stop();
    keeprunning();
    setState(() {
    });
    totalTime = double.parse(stoptimetodisplay)/5;

    resetstopwatch();

  }

  void resetstopwatch(){

    swatch.reset();
  }

  Future<void> setPage(int pg) async{
    if(pg > 3 ) {
        page = 1;

    }
    else{
        page = pg;

    }
    if(page == startingPage){
      stopstopwatch();
      checkData('$totalTime');
      page = 4;
      await Future<void>.delayed(const Duration(milliseconds: 700));
      setState(() {
        page = 4;
      });

    }else {
      setState(() {
        page = page;
      });
    }
  }

  void correctAnswer(){
    setPage(page + 1);
  }

  void incorrectAnswer(){
     setPage(0);
     totalTime += 3;
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
      if(data.length>9) {
        data = data.substring(0, 21) + time;
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



  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Stack(
        //padding: EdgeInsets.all(20),


          children: [
            Visibility(
              child: SizedBox.expand(),
              visible: true,
            ),

            Visibility(
                visible: page==0,
                child: Center(
                child: Material(
                  child: IconButton(
                    
                    icon: Text("start"),
                    onPressed: () {
                      if(!mounted) return;
                      setState(() {
                        generateRandomNumber();
                        startingPage = randomPage;
                        page = randomPage;
                        startstopwatch();
                      });
                    },
                  ),
                ),
                ),

            ),//start screen
            Visibility(//first question
                visible:page==1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Click the down arrow", style: TextStyle(fontSize: 30)),
                        ]
                    ),

                     Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: <Widget>[

                           SizedBox(
                             height: 60,
                             width: 60,
                             child: Material(
                                child: IconButton(
                                  icon: Image.asset('images/uparrow.png'),
                                  onPressed: () {
                                    if(!mounted) return;
                                      incorrectAnswer();

                                  },



                                ),
                              ),
                           ),


                             SizedBox(
                               height: 60.0,
                               width: 60.0,
                               child: Material(
                                child: IconButton(
                                  icon: Image.asset('images/rightarrow.png'),
                                  onPressed: () {if(!mounted)return;
                                    incorrectAnswer();

                                  },



                                ),
                            ),
                             ),

                        ],
                      ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[

                           SizedBox(
                             height: 60.0,
                             width: 60.0,
                             child: Material(
                                child: IconButton(
                                  icon: Image.asset('images/leftarrow.png'),
                                  onPressed: () {if(!mounted)return;
                                    incorrectAnswer();

                                  },



                                ),
                              ),
                           ),


                          SizedBox(
                            height: 60.0,
                            width: 60.0,
                            child: Material(
                                child: IconButton(
                                  icon: Image.asset('images/downarrow.png'),
                                  onPressed: () {if(!mounted)return;
                                    correctAnswer();

                                  },



                                ),
                              ),
                          ),

                        ],
                      ),

                  ],

                )//first question
            ),//1st question
            Visibility(//first question
                visible:page==2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                      Text("Click the apple."),




                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [



                             SizedBox(
                               height: 100,
                               width: 100,
                               child: Material(
                                child: IconButton(
                                  icon: Image.asset('images/cherries.png'),
                                  onPressed: () {if(!mounted)return;
                                    incorrectAnswer();

                                  },



                                ),
                            ),
                             ),


                            SizedBox(
                              height: 100,
                              width: 100,
                              child: Material(
                                child: IconButton(
                                  icon: Image.asset('images/apple.png'),
                                  onPressed: () {if(!mounted)return;
                                    correctAnswer();

                                  },



                                ),
                              ),
                            ),

                        ],
                      ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[

                            SizedBox(
                              height: 100,
                              width: 100,
                              child: Material(
                                child: IconButton(
                                  icon: Image.asset('images/bananas.png'),
                                  onPressed: () {if(!mounted)return;
                                    incorrectAnswer();

                                  },



                                ),
                              ),
                            ),

                            SizedBox(
                              height: 100,
                              width: 100,
                              child: Material(
                                child: IconButton(
                                  icon: Image.asset('images/strawberry.png'),
                                  onPressed: () {if(!mounted)return;
                                    incorrectAnswer();

                                  },



                                ),
                              ),
                            ),

                        ],
                      ),

                  ],

                )//first question
            ),//2nd question
            Visibility(//first question
                visible:page==3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: <Widget>[

                  Text("Triangle"),



                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[

                           SizedBox(
                             height: 50,
                             width: 50,
                             child: Material(
                                child: IconButton(
                                  icon: Image.asset('images/pentagon.png'),
                                  onPressed: () {if(!mounted)return;
                                    incorrectAnswer();

                                  },



                                ),
                              ),
                           ),


                             SizedBox(
                               height: 50,
                               width: 50,
                               child: Material(
                                child: IconButton(
                                  icon: Image.asset('images/triangle.png'),
                                  onPressed: () {if(!mounted)return;
                                    correctAnswer();

                                  },



                                ),
                            ),
                             ),

                        ],
                      ),

                     Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[

                             SizedBox(
                               height: 50,
                               width: 50,
                               child: Material(
                                child: IconButton(
                                  icon: Image.asset('images/square.png'),
                                  onPressed: () {if(!mounted)return;
                                    incorrectAnswer();

                                  },



                                ),
                            ),
                             ),


                            SizedBox(
                              height: 50,
                              width: 50,
                              child: Material(
                                child: IconButton(
                                  icon: Image.asset('images/circle.png'),
                                  onPressed: () {if(!mounted)return;
                                    incorrectAnswer();

                                  },



                                ),
                              ),
                            ),

                        ],
                      ),

                  ],

                ),//first question
            ),//3rd question
            Visibility(
                visible: page==4,
                child: results(),
            ),//end screen

          ]
      ),
    );
  }


}



