//import 'package:admob_flutter/admob_flutter.dart';
import 'package:ecommerce_api/adsManger.dart';
import 'package:ecommerce_api/app.dart';
import 'package:ecommerce_api/components/applocal.dart';
import 'package:flutter/material.dart';
import 'package:unity_ads_plugin/unity_ads.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {

   //AdmobInterstitial intersitialAd;

 @override
  void initState() {
    super.initState();
      UnityAds.init(
      gameId: '4567161',
   //  testMode: true,
    );
   
  }

  @override
  void dispose() {
    
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("${getLang(context, "homepage")}"),
      ),
      body: Container(
          child: Column(
        children: [
          Container(
            //height:400,
            color:Colors.white,
            child: Image.asset('assets/money.gif',
            fit:BoxFit.contain,
            ),
            // Image.network(
            //     'https://i.gifer.com/7lAV.gif')
          ),
          SizedBox(height:30),
          //  Text("${getLang(context, "welcome")}"),
          RaisedButton(
              elevation: 339,
              color: Colors.amber,
              child: Text(
                "Start App",
                style: TextStyle(color: Colors.black, fontSize: 21),
              ),
              onPressed: () async {


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
           //await StartApp.showInterstitialAd();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return Pomodoro();
                }));
              }),
              Container(
              height: 90,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 20.0),
              child: UnityBannerAd(
                    placementId: '6',
               ) ),
          Container(
              height: 90,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 20.0),
              child: UnityBannerAd(
                placementId: 'Banner_Android',
              ) ),
        ],
      )),
    );
  }
}
