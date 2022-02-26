import 'package:ecommerce_api/components/components.dart';
import 'package:ecommerce_api/pages/home/home.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'components/applocal.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    @required this.image,
    @required this.title,
    @required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardcontroller = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/m1.png',
      body: 'welcome to app',
      title: 'use app ',
    ),
    BoardingModel(
      image: 'assets/m2.jfif',
      body: '',
      title: 'Ready to win',
    ),
    BoardingModel(
      image: ('assets/money.gif'),
      //'https://i.gifer.com/7lAV.gif',
      body: '',
      title: 'Go to Start App ',
    ),
  ];
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
           title:Text("${getLang(context, "homepage")}"),
        backgroundColor:Colors.amber,
        actions: [
          defaultTextButton(
            function: () {
              navigateAndFinish(
                context,
                Home(),
              );
            },
            text: 'Skip',
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardcontroller,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
              SmoothPageIndicator(
                controller: boardcontroller,
                count: boarding.length,
                effect: ExpandingDotsEffect(
                  dotColor: Colors.amber,
                  activeDotColor: Colors.black,
                  dotHeight: 10,
                  dotWidth: 10,
                  spacing: 5,
                  expansionFactor: 4,
                ),
              ),
              Spacer(),
              FloatingActionButton(
                onPressed: () {
                  if (isLast) {
                    navigateAndFinish(
                      context,
                      Home(),
                    );
                  } 
                  else {
                    boardcontroller.nextPage(
                      duration: Duration(
                        milliseconds: 750,
                      ),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  }
                },
                child: Icon(Icons.arrow_forward_ios),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage('${model.image}'),
            ),
          ),
          Text(
            '${model.title}',
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            '${model.body}',
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      );
}
