import 'package:enewspaper/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      'caption': 'Get Live News ',
      'images': 'assets/images/splash_1.png',
    },
    {
      'caption': 'News Analytics with experts Review about it.',
      'images': 'assets/images/splash_2.png',
    },
    {
      'caption': 'Anytime, AnyWhere',
      'images': 'assets/images/pic1.jpg',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => Column(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: <Widget>[
                          Spacer(),
                          Text(
                            'E-Newspaper',
                            style: TextStyle(
                                fontSize: 36,
                                color: Colors.redAccent,
                                fontFamily: 'Muli',
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            splashData[index]['caption'],
                            textAlign: TextAlign.center,
                          ),
                          Spacer(
                            flex: 2,
                          ),
                          Container(
                            height: 300,
                            width: 265,
                            child: Image.asset(splashData[index]['images']),
                          ),
                        ],
                        // color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      splashData.length,
                      (index) => buildDot(index: index),
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.deepOrange,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Continue',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  Spacer(),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 10),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.deepOrange : Colors.orangeAccent,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
