
import 'dart:io';




class AdsManger{

   static bool _testmode= false;
   static String get appIdEx{

     if(Platform.isAndroid){
       return "ca-app-pub-3308888383378667~1702628202";
         //"ca-app-pub-3308888383378667~2441809470";
     }
     else if(Platform.isIOS){
       return"....";
     }
     else
       {
         throw new UnsupportedError("UNSUPPORTED PLATFORM");
       }
   }

   static String get BannerAdUnitIdEX{


      if(_testmode == true){
     //   return AdmobBanner.testAdUnitId;
      }
     else  if(Platform.isAndroid){
        return "ca-app-pub-8832245228844811/5482892164";
      }
      else if(Platform.isIOS){
        return"....";
      }
      else
      {
        throw new UnsupportedError("UNSUPPORTED PLATFORM");
      }
   }

   static String get nativeAdunit{

     if(_testmode == true){
       return "ca-app-pub-3940256099942544/2247696110";
         //NativeAdmob.testAdUnitId;
     }
     else  if(Platform.isAndroid){
       return "ca-app-pub-8832245228844811/4333462023";
     }
     else if(Platform.isIOS){
       return"....";
     }
     else
     {
       throw new UnsupportedError("UNSUPPORTED PLATFORM");
     }
   }

   static String get interstitialAd{


     if(_testmode == true){
       //return AdmobInterstitial.testAdUnitId;
       return " ca-app-pub-3940256099942544/1033173712";
     }
     else  if(Platform.isAndroid){
       return "ca-app-pub-4801644190189400/7071557303";
     }
     else if(Platform.isIOS){
       return"....";
     }
     else
     {

       throw new UnsupportedError("UNSUPPORTED PLATFORM");

     }
   }


 }