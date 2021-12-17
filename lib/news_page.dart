import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// import 'newsdata.dart';

class NewsPage extends StatelessWidget {
  final String imageurl;
  final String title;
  final String content;
  var pubDate;
  final String creator;
  NewsPage(this.title, this.imageurl, this.content, this.creator, this.pubDate);

  String printImage() {
    if (imageurl != null) {
      return imageurl;
    } else {
      String tempImageUrl =
          'https://www.ecpgr.cgiar.org/fileadmin/templates/ecpgr.org/Assets/images/No_Image_Available.jpg';
      return tempImageUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('E-News'),
          textTheme: TextTheme(
            caption: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            //   title: TextStyle(
            //     color: Colors.black,
            //     fontSize: 30,
            //     fontWeight: FontWeight.bold,
            //   ),);
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Image.network(printImage()),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 12, right: 5),
                    // color: Colors.black,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                DateFormat.yMMMd().format(pubDate),
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                            ),
                            Container(
                              child: Text(
                                creator.toString(),
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(content),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
