import 'dart:async';
import 'dart:developer';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';


class InfoPage extends StatefulWidget{

  @override
  _InfoPage createState() => _InfoPage();
}
class _InfoPage extends State<InfoPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding:EdgeInsets.all(30.0),
        child: ListView(
          children: [
            Column(

                children:[
                  Text(
                      "Alcohol and Driving",
                      style: TextStyle(
                        fontFamily: 'GoogleFonts.nunito()',
                        color: Colors.white,
                        fontSize: 30,
                        decoration: TextDecoration.none,
                      ),
                      textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 10,),

                  Text(
                    "Studies have shown that being under the influence of drugs or alcohol is also associated with a decreased reaction time. One study pointed to an average decreased reaction time of 120 milliseconds — just over a tenth of a second — associated with a BAC level of 0.08, the legal limit in the United States. So, when cruising at 70 miles per hour, a drunk driver would travel for an additional 12 feet before reacting to a roadway hazard.",
                    style: TextStyle(
                      fontFamily: 'GoogleFonts.nunito()',
                      color: Colors.white,
                      fontSize: 25,
                      decoration: TextDecoration.none,
                    ),
                  ),

                  SizedBox(height: 10,),

                  Image.asset("images/stoppingDistance.png"),

                  SizedBox(height: 10,),

                  Text("Rideshare companies are hoping their services can cut down on the number of drunk drivers by providing safe, affordable rides. Uber, the first ridesharing company, has even partnered with organizations such as Mothers Against Drunk Driving to help save lives by encouraging safe, sober ride options. ",
                      style: TextStyle(
                        fontFamily: 'GoogleFonts.nunito()',
                        color: Colors.white,
                        fontSize: 25,
                        decoration: TextDecoration.none,
                      ),
                  ),

                  SizedBox(height: 10,),

                  Image.asset("images/alcoholAccidents.jpg"),

                  SizedBox(height: 10,),

                  Text("Hopefully, this information has convinced you to use our app to decide on one of the following actions: \n \nA: Use a rideshare service such as Uber\nB: Travel with a designated driver\nC: Stay Home!",
                      style: TextStyle(
                        fontFamily: 'GoogleFonts.nunito()',
                        color: Colors.white,
                        fontSize: 25,
                        decoration: TextDecoration.none,
                      ),
                  ),

                  SizedBox(height: 20,),

                  Text("For more information about the dangers of impacted driving, and ways to circumvent them, check out the websites below!",
                    style: TextStyle(
                      fontFamily: 'GoogleFonts.nunito()',
                      color: Colors.white,
                      fontSize: 25,
                      decoration: TextDecoration.none,
                    ),
                  ),

                  SizedBox(height: 10,),

                  Row(
                    children: <Widget>[

                      Spacer(flex: 1),

                      Material(
                       child: InkWell(
                         child: new Text('Get an Uber!'),
                          onTap: () => launch('https://auth.uber.com/login/?uber_client_name=riderSignUp&uclick_id=0c67d9be-6e38-42d6-84e9-a564ade001e5&_ga=2.13813623.1323966549.1603101763-2145262532.1603101763%27')
                         ),
                       ),

                      Spacer(flex:1),

                      Material(
                        child: InkWell(
                            child: new Text('Get an Uber!'),
                            onTap: () => launch('https://auth.uber.com/login/?uber_client_name=riderSignUp&uclick_id=0c67d9be-6e38-42d6-84e9-a564ade001e5&_ga=2.13813623.1323966549.1603101763-2145262532.1603101763%27')
                        ),
                      ),

                      Spacer(flex: 1),

                      Material(
                        child: InkWell(
                            child: new Text('Get an Uber!'),
                            onTap: () => launch('https://auth.uber.com/login/?uber_client_name=riderSignUp&uclick_id=0c67d9be-6e38-42d6-84e9-a564ade001e5&_ga=2.13813623.1323966549.1603101763-2145262532.1603101763%27')
                        ),
                      ),

                      Spacer(flex: 1),
                    ],
                  )

                ]
            )
          ],
        )
    );
  }
}