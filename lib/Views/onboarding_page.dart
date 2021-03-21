import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatefulWidget {
  Widget introEndWidget;

  OnBoardingPage(this.introEndWidget);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState(introEndWidget);
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  Widget introEndWidget;

  _OnBoardingPageState(this.introEndWidget);

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => introEndWidget),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset("res/images/$assetName.png", width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Share pictures!",
          body:
              "Here you can upload so easy your pictures to share with Picturn community.",
          image: _buildImage('intro1'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Like pictures!",
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Click on ", style: bodyStyle),
              Icon(Icons.favorite_outlined, color: Colors.red),
              Text(" to like other Pictern users.", style: bodyStyle),
            ],
          ),
          image: _buildImage('intro2'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Save pictures!",
          body:
          "You can download the most interesting photos on your device.",
          image: _buildImage('intro3'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(12.0, 12.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 12.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
