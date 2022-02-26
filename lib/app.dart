import 'dart:async';
import 'dart:io';
//import 'package:admob_flutter/admob_flutter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce_api/second.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unity_ads_plugin/unity_ads.dart';
import 'package:url_launcher/url_launcher.dart';
import 'adsManger.dart';
import 'components/applocal.dart';

SharedPreferences mySharedPreferences;

class Pomodoro extends StatefulWidget {
  String lan;
  //Language language = Language();
  Pomodoro({this.lan});
  @override
  _State createState() => _State();
}

class _State extends State<Pomodoro> {
  //String language = widget.lan.toString();
  int money = 0;
  // Language language = Language();
  bool stop = false;
  String txt1;
  bool ads = false;
  bool ads2 = false;
  String watch = "watch ads";
  SharedPreferences prefs;
  int score = 0;
  double percent = 0;
  String message =
      'Your Score should have more than or equal 1 million and 800 to request money ';
  static int timeInMinut = 1;
  static int timeInSec = timeInMinut * 60;
  Timer timer;
  Color color = Colors.orangeAccent;
  Color color2 = Colors.grey;
  Color color3 = Colors.grey;
  String txt = 'Minning';
  bool videoCompleted = false;
  String error = '';
  String minning = 'minning';
  String scoree = 'score';
  String request = "Request";
  String txt4 = 'Continue minning';
  bool stop2 = false;
  // AdmobInterstitial intersitialAd;

  @override
  void initState() {
    UnityAds.init(
      gameId: '4567161',
      // testMode: true,
    );

    setState(() {
      getData();
      //   getlang();
    });
    @override
    void dispose() {
      super.dispose();
    }

    // if (widget.lan == 'en') {
    //   minning = 'Minning';
    //   message =
    //       'Your Score should have more than or equal 1 million and 800 to request money ';
    //   scoree = 'Score';
    //   request = 'Request money';
    //   txt = "Minning";
    //   txt1 = "Watch ads to continue";
    //   watch = 'Watch ads';
    //   txt4 = 'Continue minning';
    // } else if (widget.lan == 'ar') {
    //   minning = 'التعدين';
    //   scoree = "النقاط";
    //   request = "طلب استلام ارباح";
    //   txt = " تعدين";
    //   txt4 = 'اكمل التعدين ';
    //   txt1 = "شاهد اعلان واكمل ربح";
    //   watch = 'شاهد الاعلان';
    //   message = 'يجب ان تتعدي نقاطك مليون و 800 الف لطلب ارباح';
    // } else if (widget.lan == 'h') {
    //   minning = 'खुदाई';
    //   scoree = 'अंक';
    //   request = 'लाभ प्राप्त करने का अनुरोध';
    //   txt = 'खुदाई';
    //   txt4 = 'खनन जारी रखें';
    //   txt1 = "एक विज्ञापन देखें और पैसा कमाएं";
    //   watch = 'विज्ञापन देखें';
    //   message =
    //       'पैसे का अनुरोध करने के लिए आपका स्कोर 1 मिलियन और 800 से अधिक या उसके बराबर होना चाहिए';
    // }
    // RewardedVideoAd.instance.load(
    //     adUnitId: //'ca-app-pub-3940256099942544/5224354917'
    //         'ca-app-pub-3308888383378667/2528732511'
    //     //'ca-app-pub-4801644190189400/4424659381',
    //     //'ca-app-pub-7757590907378676/2778691799',
    //     //AdmobReward.testAdUnitId,
    //     // "ca-app-pub-9553580055895935/1690226045",
    //     ,
    //     targetingInfo: MobileAdTargetingInfo());

    // RewardedVideoAd.instance.listener =
    //     (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
    //   if (event == RewardedVideoAdEvent.rewarded) {
    //     print("sss");
    //     // coins=coins+rewardAmount;
    //   }
    // };
  }

  @override
  void dispose() {
    timeInMinut = 1;
    timer.cancel();
    super.dispose();
  }

  saveData(int s) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setInt('score', s);
    // prefs.setInt('money',m);
  }

  getData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      score = prefs.getInt('score') ?? score;
    });
  }

  savelang(String lang) async {
    prefs = await SharedPreferences.getInstance();
    // prefs.setString('lang', lang);
    // prefs.setInt('money',m);
  }

  getlang() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      //  widget.lan = prefs.getString('lang') ?? widget.lan;
    });
  }

  _startTimer() {
    percent = 1.0;
    timeInMinut = timeInMinut;
    int Time = timeInMinut * 60;
    double secPercent = (Time / 100);
    timer = Timer.periodic(Duration(microseconds:60), (timer) {
      setState(() {
        if (Time >= 0) {
          Time = Time + 1;
          if (Time % 60 == 0) // a minut has passed
          {
            timeInMinut++;
            // stop = true;
          }

          if (timeInMinut % 300 == 0) {
            //  stop = true;
            stop2 = true;
            //  ads = true;
            txt = txt1; //'Watch ad then Continue';
            color = Colors.grey;
            // color3 = Colors.green;
            money++;
            ads = true;
            color2 = Colors.green;
            color3 = Colors.green;
            percent = 0.0;
            timeInMinut = timeInMinut + 1;
            timer.cancel();
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        body: Container(
          //height: 1000,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffffe100), Color(0xffdb8b72)],
                begin: FractionalOffset(0.2, 0.7)),
          ),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 40),
                    child: Text
                        // ("${getLang(context , "min")}",
                        (
                      "${getLang(context, "minning")}",
                      // minning,
                      // language.Minning(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  Padding(
                      padding: EdgeInsets.only(top: 20, left: 40),
                      child: Text(
                          "${getLang(context, "scoree")}" +
                              " = " +
                              score.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 21.0,
                              fontWeight: FontWeight.bold)))
                ],
              ),
              Expanded(
                child: CircularPercentIndicator(
                    circularStrokeCap: CircularStrokeCap.round,
                    percent: percent,
                    animation: true,
                    animateFromLastPercent: true,
                    radius: 200.0,
                    lineWidth: 17.0,
                    progressColor: Colors.white,
                    center: Text(
                      '$timeInMinut',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 55.0,
                      ),
                    )),
              ),
              SizedBox(
                height: 2,
              ),
              RaisedButton(
                color: Colors.red,
                onPressed: () {
                  sendinsta();
                },
                child: Text(
                  "${getLang(context, "insta")}",
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              ),
              Expanded(
                child: Container(
                  //  height: 1000,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                        20.0,
                      ),
                      topLeft: Radius.circular(
                        20.0,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.0, left: 20.0, right: 20.0),
                    child: ListView(
                      children: <Widget>[
                        UnityBannerAd(
                          placementId: '6',
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: RaisedButton(
                              onPressed: () {
                                if (stop == false) {
                                  stop = true;

                                  _startTimer();
                                }
                              },
                              color: color,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  "${getLang(context, "txt")}",
                                  // 'txt',
                                  //   txt,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22.0),
                                ),
                              )),
                        ),
                        SizedBox(height: 6),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(vertical: 12.0),
                        //   child: RaisedButton(
                        //       onPressed: () async {
                        //        // Startapp.instance.initialize( appId: Platform.isIOS ? '200488938' : '200488938', accountId: '');
                        //         if (stop2 == true) {
                        //           print("mmmm");

                        //           UnityAds.showVideoAd(
                        //             placementId: '07724020407‪Aa',//AdManager.rewardedVideoAdPlacementId,
                        //             listener: (state, args) =>
                        //                 print('Rewarded Video Listener: $state => $args'),
                        //           );

                        //           print("stop22222222222");
                        //           await StartApp.showRewardedAd(
                        //               onVideoCompleted: () {
                        //                 setState(() {
                        //                   videoCompleted = true;
                        //                   stop = true;
                        //                   stop2 = false;
                        //                   ads = true;
                        //                   //txt = 'Watch ad then Continue';
                        //                   //color = Colors.green;
                        //                   color2 = Colors.green;
                        //                   color3 = Colors.grey;
                        //                   txt = txt4;
                        //                 //  score = score + 300; //timeInMinut;
                        //                 });
                        //                 saveData(score);
                        //               }, onReceiveAd: () {
                        //             print("recieved".toString());
                        //             // ad received callback
                        //           }, onFailedToReceiveAd: (String error) {
                        //             print(error.toString());
                        //             // failed to received ad callback
                        //           });
                        //         }
                        //       },
                        //       color: color3,
                        //       shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(100.0),
                        //       ),
                        //       child: Padding(
                        //         padding: EdgeInsets.all(20.0),
                        //         child: Text(
                        //           "${getLang(context, "watch")}",
                        //           //   'p',
                        //           //watch,
                        //           style: TextStyle(
                        //               color: Colors.white, fontSize: 22.0),
                        //         ),
                        //       )),
                        // ),
                        SizedBox(height: 6),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: RaisedButton(
                              onPressed: () async {
                                if (ads == true) {
                                  print("uintyads");
                                  UnityAds.showVideoAd(
                                      placementId:
                                          'Rewarded_Android', //AdManager.rewardedVideoAdPlacementId,
                                      listener: (state, args) {
                                        print(
                                            'Rewarded Video Listener: $state => $args');
                                        if (state == UnityAdState.complete) {
                                          print(
                                              'User watched a video. User should get a reward!');
                                          setState(() {
                                            videoCompleted = true;
                                            stop2 = false;
                                            ads = false;
                                            stop = false;
                                            score = score + 300;
                                            color = Colors.green;
                                            // stop = false;
                                            // ads = false;
                                            ads2 = true;
                                            txt = txt4;
                                            //'Watch ad then Continue';
                                            //  color = Colors.green;
                                            // color3 = Colors.green;
                                            color2 = Colors.grey;
                                            txt = txt;
                                            // score = score + 300; //timeInMinut;
                                            saveData(score);
                                          });
                                        } else if (state ==
                                            UnityAdState.skipped) {
                                          print('User cancel video.');
                                        }
                                      });
                                  //  await videoAd.load(
                                  //       adUnitId: 'ca-app-pub-3308888383378667/2528732511');
                                  //           //  'ca-app-pub-3308888383378667/1483951026');
                                  //       //    'ca-app-pub-3940256099942544/5224354917');
                                  //   videoAd.show();
                                  //   RewardedVideoAd.instance.listener =
                                  //       (RewardedVideoAdEvent event,
                                  //           {String rewardType,
                                  //           int rewardAmount}) {
                                  //     if (event ==
                                  //         RewardedVideoAdEvent.rewarded) {
                                  //       setState(() {
                                  //         videoCompleted = true;
                                  //         stop2 = false;
                                  //         stop=false;
                                  //         score = score + 300;
                                  //         color = Colors.green;
                                  //         // stop = false;
                                  //         // ads = false;
                                  //         ads2 = true;
                                  //         txt = txt4;
                                  //         //'Watch ad then Continue';
                                  //         //  color = Colors.green;
                                  //        // color3 = Colors.green;
                                  //         color2 = Colors.grey;
                                  //         txt = txt;
                                  //         // score = score + 300; //timeInMinut;
                                  //       });
                                  //       saveData(score);
                                  //     }
                                  //   };
                                }
                              },
                              color: color2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  "${getLang(context, "watch")}",
                                  //   'watch',
                                  //  watch,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22.0),
                                ),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: RaisedButton(
                              onPressed: () async {
                                if (ads == true) {
                                  print("uintyads");
                                  UnityAds.showVideoAd(
                                      placementId:
                                      '2', //AdManager.rewardedVideoAdPlacementId,
                                      listener: (state, args) {
                                        print(
                                            'Rewarded Video Listener: $state => $args');
                                        if (state == UnityAdState.complete) {
                                          print(
                                              'User watched a video. User should get a reward!');
                                          setState(() {
                                            videoCompleted = true;
                                            stop2 = false;
                                            ads = false;
                                            stop = false;
                                            score = score + 300;
                                            color = Colors.green;
                                            // stop = false;
                                            // ads = false;
                                            ads2 = true;
                                            txt = txt4;
                                            //'Watch ad then Continue';
                                            //  color = Colors.green;
                                            // color3 = Colors.green;
                                            color2 = Colors.grey;
                                            txt = txt;
                                            // score = score + 300; //timeInMinut;
                                            saveData(score);
                                          });
                                        } else if (state ==
                                            UnityAdState.skipped) {
                                          print('User cancel video.');
                                        }
                                      });
                                  //  await videoAd.load(
                                  //       adUnitId: 'ca-app-pub-3308888383378667/2528732511');
                                  //           //  'ca-app-pub-3308888383378667/1483951026');
                                  //       //    'ca-app-pub-3940256099942544/5224354917');
                                  //   videoAd.show();
                                  //   RewardedVideoAd.instance.listener =
                                  //       (RewardedVideoAdEvent event,
                                  //           {String rewardType,
                                  //           int rewardAmount}) {
                                  //     if (event ==
                                  //         RewardedVideoAdEvent.rewarded) {
                                  //       setState(() {
                                  //         videoCompleted = true;
                                  //         stop2 = false;
                                  //         stop=false;
                                  //         score = score + 300;
                                  //         color = Colors.green;
                                  //         // stop = false;
                                  //         // ads = false;
                                  //         ads2 = true;
                                  //         txt = txt4;
                                  //         //'Watch ad then Continue';
                                  //         //  color = Colors.green;
                                  //        // color3 = Colors.green;
                                  //         color2 = Colors.grey;
                                  //         txt = txt;
                                  //         // score = score + 300; //timeInMinut;
                                  //       });
                                  //       saveData(score);
                                  //     }
                                  //   };
                                }
                              },
                              color: color2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  "${getLang(context, "watch")}",
                                  //   'watch',
                                  //  watch,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22.0),
                                ),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: RaisedButton(
                              onPressed: () async {
                                if (ads == true) {
                                  print("uintyads");
                                  UnityAds.showVideoAd(
                                      placementId:
                                      '3', //AdManager.rewardedVideoAdPlacementId,
                                      listener: (state, args) {
                                        print(
                                            'Rewarded Video Listener: $state => $args');
                                        if (state == UnityAdState.complete) {
                                          print(
                                              'User watched a video. User should get a reward!');
                                          setState(() {
                                            videoCompleted = true;
                                            stop2 = false;
                                            ads = false;
                                            stop = false;
                                            score = score + 300;
                                            color = Colors.green;
                                            // stop = false;
                                            // ads = false;
                                            ads2 = true;
                                            txt = txt4;
                                            //'Watch ad then Continue';
                                            //  color = Colors.green;
                                            // color3 = Colors.green;
                                            color2 = Colors.grey;
                                            txt = txt;
                                            // score = score + 300; //timeInMinut;
                                            saveData(score);
                                          });
                                        } else if (state ==
                                            UnityAdState.skipped) {
                                          print('User cancel video.');
                                        }
                                      });
                                  //  await videoAd.load(
                                  //       adUnitId: 'ca-app-pub-3308888383378667/2528732511');
                                  //           //  'ca-app-pub-3308888383378667/1483951026');
                                  //       //    'ca-app-pub-3940256099942544/5224354917');
                                  //   videoAd.show();
                                  //   RewardedVideoAd.instance.listener =
                                  //       (RewardedVideoAdEvent event,
                                  //           {String rewardType,
                                  //           int rewardAmount}) {
                                  //     if (event ==
                                  //         RewardedVideoAdEvent.rewarded) {
                                  //       setState(() {
                                  //         videoCompleted = true;
                                  //         stop2 = false;
                                  //         stop=false;
                                  //         score = score + 300;
                                  //         color = Colors.green;
                                  //         // stop = false;
                                  //         // ads = false;
                                  //         ads2 = true;
                                  //         txt = txt4;
                                  //         //'Watch ad then Continue';
                                  //         //  color = Colors.green;
                                  //        // color3 = Colors.green;
                                  //         color2 = Colors.grey;
                                  //         txt = txt;
                                  //         // score = score + 300; //timeInMinut;
                                  //       });
                                  //       saveData(score);
                                  //     }
                                  //   };
                                }
                              },
                              color: color2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  "${getLang(context, "watch")}",
                                  //   'watch',
                                  //  watch,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22.0),
                                ),
                              )),
                        ),
                        SizedBox(height: 6),

                        Container(
                            height: 90,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(bottom: 20.0),
                            child: UnityBannerAd(
                              placementId: 'Banner_Android',
                            ) ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: CurvedNavigationBar(
                    color: Colors.white,
                    backgroundColor: Colors.white,
                    //buttonBackgroundColor:Colors.blue,
                    items: <Widget>[
                      Icon(Icons.home, size: 24, color: Colors.black),
                      //   Icon(Icons.add_box,size:24,color:Colors.red),
                      Text("${getLang(context, "reward")}",
                          style: TextStyle(color: Colors.red, fontSize: 21)),
                      //   Icon(Icons.settings, size: 24, color: Colors.cyan),
                    ],
                    animationCurve: Curves.bounceOut,
                    onTap: (index) async {
                      if (index == 1) {

                        await UnityAds.showVideoAd(
                          placementId: '5',
                          listener: (state, args) {
                            if (state == UnityAdState.complete) {
                              print('int ads');
                            } else if (state == UnityAdState.skipped) {
                              print('User cancel video.');
                            }
                          },
                        );
                        //   await StartApp.showInterstitialAd();
                        // intersitialAd.show();
                        print(widget.lan.toString());
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return second(score: score, lang: widget.lan);
                        }));
                      }
                    }),
              )
            ],
          ),
        ),
      )),
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

  sendinsta() async {
    String url() {
      if (Platform.isAndroid) {
        return 'https://www.instagram.com/application_babil/';
        // return "https://wa.me/$phone/?text=${Uri.parse(msg)}";
        //  return 'whatsapp://wa.me/$phone/?text=${Uri.parse(msg)}';
      } else {
        // return 'whatsapp://send?phone=$phone&text=$msg';
        return "https://www.instagram.com/application_babil/";
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
