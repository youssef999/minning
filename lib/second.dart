import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:unity_ads_plugin/unity_ads.dart';
import 'package:url_launcher/url_launcher.dart';
import 'app.dart';
import 'components/applocal.dart';

class second extends StatefulWidget {
  int score;
  String lang;

  second({this.score, this.lang});
  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {

  String txt1 = '90000  = 1\$';
  String share = "Share App ";
  String txt2 = '9 Million = 10\$';
  String txt3 = '90 Million = 100\$';
  String txt4 = '900 Million = 1000\$ ';
  String txt5 = '';
  String Score = 'Your Score';
  String txt6='9 billion =10000\$';

  @override
  void initState() {
      UnityAds.init(
      gameId: '4567161',
     // testMode: true,
    );
    if (widget.lang == 'en') {
      txt1 = '90000  = 1\$';
      txt2 = '9 Million = 10\$';
      share = "Share App ";
      txt3 = '90 Million = 100\$';
      txt4 = '900 Million = 1000\$ ';
      txt6='9 billion =10000\$';
      txt5 = 'Closed until app have 1 Million download';

      Score = "Your Score = ";
    } else if (widget.lang == 'ar') {
      txt1 = " 900 الف = 1 دولار";
      txt2 = " م9مليون = 10 دولار";
      txt3 = " م90مليون = 100 دولار";
      txt4 = '  900 مليون = 1000 دولار';
      txt6='9 مليار =10000 دولار';
      txt5 = 'مغلق حتي  يتم مليون تنزيل ';
      share = "مشاركة التطبيق ";
      Score = 'نقاطك = ';
    } else if (widget.lang == 'h') {
      txt1 = ' 800 हजार = 1\$';
      txt2 = '9 मिलियन = 10\$';
      txt3 = '90 मिलियन = 100\$';
      share = 'ऐप शेयर करें';
      txt4 = '900 मिलियन = 1000\$';
      txt5 = 'ऐप के 1 मिलियन डाउनलोड होने तक बंद';
      Score = 'अपने स्कोर = ';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        // title: Text(
        //   "Details",
        //   style: TextStyle(color: Colors.white, fontSize: 21),
        // ),
      ),
      body: Container(
          color: Colors.amberAccent,
          child: ListView(children: [
            Center(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    // Score
                    "${getLang(context, "scoree")}" +
                        " : " +
                        widget.score.toString(),
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: SizedBox(
                      //height: 150.0,
                      width: 1000.0,
                      child: CarouselSlider(
                        items: [
                          Image.asset('assets/m1.png', fit: BoxFit.cover),
                          Image.asset('assets/m2.jfif', fit: BoxFit.cover),
                          Image.asset('assets/m3.jfif', fit: BoxFit.cover),
                          Image.asset('assets/m4.png', fit: BoxFit.cover),
                          //wp-content%2fuploads%2f2018%2f01%2fReward-money-clipart-free.jpg&ehk=KzGXly5EXx2ew%2fLpMPQ4ntBhEXDEjSRG1aXD69OzDyY%3d&risl=&pid=ImgRaw&r=0'),
                        ],
                        options: CarouselOptions(
                            aspectRatio: 2.0,
                            enlargeCenterPage: false,
                            viewportFraction: 1,
                            autoPlay: true),
                      ),
                    ),
                  ),

                  // Container(
                  //     color: Colors.blueAccent,
                  //     height: 230,
                  //     child: Image.asset('assets/ww.jfif')),
                  SizedBox(height: 6),
                    Container(
              height: 70,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 20.0),
              child: UnityBannerAd(
                placementId: '6',

                            )
            ),
                  Text(
                    "${getLang(context, "txt11")}",
                    // txt1,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                   RaisedButton(
                color: Colors.red,
                onPressed: () {
                  if (widget.score < 1800000) {
                    showDialog(
                        context: context,
                        builder: (_) => new AlertDialog(
                              title: new Text(" !!! "),
                              content: new Text(
                          "${getLang(context, "message")}"
                              )
                              //(message),
                            ));
                  } else {
                    sendWhatsApp('+9647725256635',
                        'hello i am using minning app =  ' +widget. score.toString());
                  }                                                   
                },
                child: Text(
                  "${getLang(context, "request")}",
                  //  request,
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              ),
              SizedBox(
                height:10
              ),
                  Text(
                    // txt2,
                    "${getLang(context, "txt2")}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                   RaisedButton(
                color: Colors.red,
                onPressed: () {
                                                                    
                },
                child: Text(
                  "${getLang(context, "request")}",
                  //  request,
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              ),
                  Text(
                      //txt3,
                      "${getLang(context, "txt3")}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                   RaisedButton(
                color: Colors.red,
                onPressed: () {
                  if (widget.score < 1800000) {
                    showDialog(
                        context: context,
                        builder: (_) => new AlertDialog(
                              title: new Text(" !!! "),
                              content: new Text(
                          "${getLang(context, "message")}"
                              )
                              //(message),
                            ));
                  } else {
                    sendWhatsApp('+9647725256635',
                        'hello i am using minning app =  ' + widget.score.toString());
                  }                                                   
                },
                child: Text(
                  "${getLang(context, "request")}",
                  //  request,
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              ),
              SizedBox(
                height:10
              ),
                  Column(
                    children: [
                      Text(
                        "${getLang(context, "txt44")}",
                        //  txt4,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                       RaisedButton(
                color: Colors.red,
                onPressed: () {
                  if (widget.score < 1800000) {
                    showDialog(
                        context: context,
                        builder: (_) => new AlertDialog(
                              title: new Text(" !!! "),
                              content: new Text(
                          "${getLang(context, "message")}"
                              )
                              //(message),
                            ));
                  } else {
                    sendWhatsApp('+9647725256635',
                        'hello i am using minning app =  ' + widget.score.toString());
                  }                                                   
                },
                child: Text(
                  "${getLang(context, "request")}",
                  //  request,
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              ),
              SizedBox(
                height:10
              ),
                      Text(
                        "${getLang(context, "txt5")}",
                        //  txt4,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      // SizedBox(2
                      //   height: 3,
                      // ),
                      // Text(
                      //   "${getLang(context, "txt5")}",
                      //   // txt5,
                      //   style: TextStyle(
                      //       color: Colors.red,
                      //       fontSize: 16,
                      //       fontWeight: FontWeight.w600),
                      // ),
                    ],
                  ),
                  SizedBox(height: 10),
                   RaisedButton(
                color: Colors.red,
                onPressed: () {
                  if (widget.score < 1800000) {
                    showDialog(
                        context: context,
                        builder: (_) => new AlertDialog(
                              title: new Text(" !!! "),
                              content: new Text(
                          "${getLang(context, "message")}"
                              )
                              //(message),
                            ));
                  } else {

                    sendWhatsApp('+9647725256635',
                        'hello i am using minning app =  ' + widget.score.toString());
                  }                                                   
                },

                child: Text(
                  "${getLang(context, "request")}",
                  //  request,
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              ),
              SizedBox(
                height:12
              ),
                  FlatButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      onPressed: () {},
                      child: Text(
                        "${getLang(context, "share")}",
                      )),
                  SizedBox(height: 1),
                  Container(
                      height: 90,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: UnityBannerAd(
                        placementId: 'Banner_Android',
                      ) ),
                 
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: CurvedNavigationBar(
                        color: Colors.white,
                        backgroundColor: Colors.white,
                        index: 1,
                        //buttonBackgroundColor:Colors.blue,
                        items: <Widget>[
                          Icon(Icons.home, size: 24, color: Colors.black),
                          Text("${getLang(context, "reward")}",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 21)),
                          //   Icon(Icons.add_box,size:24,color:Colors.red),
                          // Icon(Icons.ad_units_sharp,
                          //     size: 24, color: Colors.red),
                          //  Icon(Icons.settings, size: 24, color: Colors.cyan),
                        ],
                        animationCurve: Curves.bounceOut,
                        onTap: (index) async {
                          if (index == 0) {
                            //await StartApp.showInterstitialAd();
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return Pomodoro();
                            }));
                          }
                        }),
                  )
                ],
              ),
            ),
          ])),
    );
  }
    sendWhatsApp(String phone, String msg) async {
    String url() {
      if (Platform.isAndroid) {
        return 'whatsapp://send?phone=$phone&text=$msg';
        // return "https://wa.me/$phone/?text=${Uri.parse(msg)}";
        //  return 'whatsapp://wa.me/$phone/?text=${Uri.parse(msg)}';
      } else {
        // return 'whatsapp://send?phone=$phone&text=$msg';
        return "https://wa.me/$phone/?text=${Uri.parse(msg)}";
        //  return 'whatsapp://send?$phone=phone&text=$msg';
        //   return 'whatsapp://wa.me/$phone&text=$msg';
      }
    }

    try {
      await canLaunch(url()) ? launch(url()) : launch(url());
      // : ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text('there is no whats app in your device')));
    } catch (e) {
      print("error" + e.toString());
    }
  }

   
}
