import 'package:enewspaper/catagory_main_page.dart';
import 'package:enewspaper/media_catagory_mainpage.dart';
import 'package:flutter/material.dart';

class CatagoryPage extends StatefulWidget {
  @override
  _CatagoryPageState createState() => _CatagoryPageState();
}

class _CatagoryPageState extends State<CatagoryPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String imageUrl = 'assets/images/Image Banner 2.png';

    return Scaffold(
      appBar: AppBar(
        title: Text('E-News'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              thickness: 20,
            ),
            Container(
              height: 50,
              child: Text(
                'By Category',
                style: TextStyle(fontFamily: 'Muli', fontSize: 25),
              ),
            ),
            // catagorySection(height, width, imageUrl, title, subTitle, () {}),
            catagorySection(height, width, imageUrl, context),
            Divider(
              height: 100,
              thickness: 20,
            ),
            Container(
              height: 50,
              child: Text(
                'By Media',
                style: TextStyle(fontFamily: 'Muli', fontSize: 25),
              ),
            ),
            mediaSection(height, width, imageUrl, context),
          ],
        ),
      ),
    );
  }

  Container catagorySection(
      double height, double width, String imageUrl, BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              catagoryImages(
                  height, width, 'assets/images/Sports.jpg', 'Sports', '', () {
                String catagoryKeyword = 'sports';
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CatagoryMainPage(
                        catagoryKeyword, 'assets/images/Sports.jpg')));
              }),
              catagoryImages(
                  height, width, 'assets/images/business.jpg', 'Business', '',
                  () {
                String catagoryKeyword = 'business';
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CatagoryMainPage(
                        catagoryKeyword, 'assets/images/business.jpg')));
              }),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              catagoryImages(
                  height, width, 'assets/images/Politics.jpg', 'Politics', '',
                  () {
                String catagoryKeyword = 'politics';
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CatagoryMainPage(
                        catagoryKeyword, 'assets/images/Politics.jpg')));
              }),
              catagoryImages(height, width, 'assets/images/Entertainment.jpg',
                  'Entertainment', '', () {
                String catagoryKeyword = 'entertainment';
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CatagoryMainPage(
                        catagoryKeyword, 'assets/images/Entertainment.jpg')));
              }),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              catagoryImages(height, width, 'assets/images/Current-Affairs.jpg',
                  'Current Affairs', '', () {
                String catagoryKeyword = 'currentaffairs';
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CatagoryMainPage(
                        catagoryKeyword, 'assets/images/Current-Affairs.jpg')));
              }),
              catagoryImages(height, width, 'assets/images/Technology.jpg',
                  'Technology', '', () {
                String catagoryKeyword = 'technology';
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CatagoryMainPage(
                        catagoryKeyword, 'assets/images/Technology.jpg')));
              }),
            ],
          )
        ],
      ),
    );
  }

  Container mediaSection(
      double height, double width, String imageUrl, BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              catagoryImages(height, width, 'assets/images/India-Today.jpg',
                  'India Today', '', () {
                String catagoryKeyword = 'indiatoday';
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MediaCatagoryMainPage(
                        catagoryKeyword, 'assets/images/India-Today.jpg')));
              }),
              catagoryImages(height, width, 'assets/images/Hindustan-Times.jpg',
                  'Hindustan Times', '', () {
                String catagoryKeyword = 'hindsutantimes';
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MediaCatagoryMainPage(
                          catagoryKeyword,
                          'assets/images/Hindustan-Times.jpg',
                        )));
              }),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              catagoryImages(height, width, 'assets/images/IndianExpress.jpg',
                  'Indian Express', '', () {
                String catagoryKeyword = 'indianexpress';
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MediaCatagoryMainPage(
                          catagoryKeyword,
                          'assets/images/IndianExpress.jpg',
                        )));
              }),
              catagoryImages(height, width, 'assets/images/TheHansIndia.jpg',
                  'The Hans India', '', () {
                String catagoryKeyword = 'thehansindia';
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MediaCatagoryMainPage(
                        catagoryKeyword, 'assets/images/TheHansIndia.jpg')));
              }),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Container catagoryImages(double height, double width, String imageUrl,
      String title, String subTitle, Function pageRoute) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      height: height * .12,
      width: width * .47,
      child: GestureDetector(
        onTap: pageRoute,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Stack(
            children: [
              Image.asset(
                imageUrl,
                fit: BoxFit.fill,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF343434).withOpacity(0.1),
                      Color(0xFF343434).withOpacity(.4),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      text: title),
                  TextSpan(
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      text: subTitle),
                ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
