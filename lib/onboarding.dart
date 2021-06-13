import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'Views/ButtonWidget.dart';
import 'Views/login_view.dart';

class OnboardingRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(

        alignment: Alignment.topCenter,
        padding: const EdgeInsets.fromLTRB(0,100,0,30),
        child: Column(
          children: <Widget> [
            Text('Pleasure',style: TextStyle(color: Color.fromARGB(
                240, 62, 204, 224),
                fontFamily: 'Helvetica',
                fontSize: 80
            ),
            ), SizedBox(height: 20),
            Text('Welcome',style: TextStyle(color: Color.fromARGB(
                240, 3, 13, 14),
                fontFamily: 'Helvetica',
                fontSize: 30
            ),
            ),
            Text('to the world of aestetic pictures',style: TextStyle(color: Color.fromARGB(
                240, 3, 13, 14),
                fontFamily: 'Helvetica',
                fontSize: 25
            ),
            ),
            Flexible(child: IntroScreen()) ],
        ),
      ),
    );

  }
}


class IntroScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context) => SafeArea(
    child: IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Share Pictures',
          body: 'share pictures with all users they must see this beauty',
          image: Image.asset('res/images/onboarding1.gif'),
        ),
        PageViewModel(
          title: 'Today a reader, tomorrow a leader',
          body: 'Start your journey',
          footer: ButtonWidget(
            text: 'Start Reading',
            onClicked: () => goToHome(context),
          ),
          image: Image.asset('res/images/onboarding2.gif'),
        ),
      ],
      done: Text('Read') ,
      onDone: () => goToHome(context),
      next: Icon(Icons.arrow_forward),
      onChange: (index) => print('Page $index selected'),
      globalBackgroundColor: Colors.white,
      animationDuration: 1000,
    ),
  );
}

void goToHome(context) => Navigator.of(context).pushReplacement(
  MaterialPageRoute(builder: (context) => LoginPage()),
);