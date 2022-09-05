import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';


class results extends StatefulWidget{

  @override
  _results createState() => _results();
}

class _results extends State<results> with TickerProviderStateMixin {

  String data = "";

  double test1Result = 0;
  double test2Result = 0;
  double test3Result = 0;
  double test4Result = 0;

  double diagnostic1 = 0;
  double diagnostic2 = 0;
  double diagnostic3 = 0;
  double diagnostic4 = 0;

  double deviation1 = 0;
  double deviation2 = 0;
  double deviation3 = 0;
  double deviation4 = 0;

  String howDidYouDo = "";
  Color greenOrRed =Colors.white;

  String greaterOrLesser = "";

  bool isUberVisible = false;


  Future<String> get localPath async {
    final path = await getApplicationDocumentsDirectory();
    return path.path;
  }

  Future<File> get localFile async {
    final file = await localPath;
    return new File('$file/data.txt');
  }

  Future<void> getData() async {
    final file = await localFile;
    data = await file.readAsString();
    organizeData();
  }

  void organizeData() {
    print(data);
    if (data.length <= 12) {


      howDidYouDo = "This was the diagnostic test!";
    }
    else {
      diagnostic1 = double.parse(data.substring(0, 3));
      diagnostic2 = double.parse(data.substring(6, 9));
      diagnostic3 = double.parse(data.substring(12, 15));
      diagnostic4 = double.parse(data.substring(18, 21));

      test1Result = double.parse(data.substring(3, 6));
      test2Result = double.parse(data.substring(9, 12));
      test3Result = double.parse(data.substring(15,18));
      test4Result = double.parse(data.substring(21));

      deviation1 = double.parse(
          (100 * ((test1Result - diagnostic1)) / diagnostic1)
              .toStringAsFixed(2));
      deviation2 = double.parse(
          (100 * ((test2Result - diagnostic2) / diagnostic2))
              .toStringAsFixed(2));
      deviation3 = double.parse(
          (100 * ((test3Result - diagnostic3) / diagnostic3))
              .toStringAsFixed(2));
      deviation2 = double.parse(
          (100 * ((test4Result - diagnostic4) / diagnostic4))
              .toStringAsFixed(2));

      if((deviation1 + deviation2 + deviation3 + deviation4)<0){
        setState(() {
          greaterOrLesser = "faster";
          greenOrRed = Colors.green;
          isUberVisible = false;
        });

      }
      else{
        setState(() {
          greaterOrLesser = "slower";
          greenOrRed = Colors.red;
          isUberVisible = true;
        });

      }
      var finalScore =       double.parse((((deviation1 + deviation2 + deviation3 + deviation4).abs())/3).toStringAsFixed(2));
      setState(() {
        howDidYouDo = "You were on average $finalScore% $greaterOrLesser than your usual times!";
      });
    }
  }





  Widget build(BuildContext context) {
    getData();
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[

          Text(

            '$howDidYouDo',
            style: TextStyle(
              fontFamily: 'GoogleFonts.nunito()',
              color: greenOrRed,
              fontSize: 50,
              decoration: TextDecoration.none,
            ),
          textAlign: TextAlign.center,
          ),
         Visibility(
          child: Material(
           child: InkWell(
            child: new Text('Get an Uber!'),
            onTap: () => launch('https://auth.uber.com/login/?uber_client_name=riderSignUp&uclick_id=0c67d9be-6e38-42d6-84e9-a564ade001e5&_ga=2.13813623.1323966549.1603101763-2145262532.1603101763')
          ),
          ),
           visible : isUberVisible,
         ),
      ]
      ),
    );
  }
}

