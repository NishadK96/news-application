import 'package:enewspaper/apidata_manager.dart';
import 'package:enewspaper/news_page.dart';
import 'package:enewspaper/newsdata.dart';
import 'package:flutter/material.dart';

class CatagoryMainPage extends StatefulWidget {
  final String catagoryKeyword;
  final String imageUrl;
  CatagoryMainPage(this.catagoryKeyword, this.imageUrl);
  @override
  _CatagoryMainPageState createState() =>
      _CatagoryMainPageState(catagoryKeyword, imageUrl);
}

class _CatagoryMainPageState extends State<CatagoryMainPage> {
  final String catagoryKeyword;
  final String imageUrl;
  _CatagoryMainPageState(this.catagoryKeyword, this.imageUrl);

  Future<NewsData> _newsData;
  void initState() {
    _newsData = ApiDataManager().fetchNewsDataByCatagory(catagoryKeyword);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('E-News'),
      ),
      body: Column(
        children: [
          Container(
            // color: Colors.black,
            height: height * .2,
            width: double.infinity,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: width * 1,
            height: height * .59,
            child: FutureBuilder<NewsData>(
              future: _newsData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        var data = snapshot.data.results[index];
                        var title;
                        var imageurl;
                        var pubDate;
                        var content;
                        var creator;
                        return Card(
                          elevation: 10,
                          child: ListTile(
                            leading: Padding(
                              padding: EdgeInsets.all(10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: 100,
                                  width: 50,
                                  child: data.imageUrl != null
                                      ? Image.network(
                                          '${data.imageUrl}',
                                          fit: BoxFit.scaleDown,
                                        )
                                      : Image.asset(
                                          'assets/images/noimg.png',
                                          fit: BoxFit.scaleDown,
                                        ),
                                ),
                              ),
                            ),
                            title: Text(data.title),
                            subtitle: Text(snapshot
                                        .data.results[index].description !=
                                    null
                                ? snapshot.data.results[index].description
                                            .length >
                                        100
                                    ? snapshot.data.results[index].description
                                            .substring(0, 100) +
                                        '...'
                                    : snapshot.data.results[index].description
                                : ''),
                            selectedTileColor: Colors.grey,
                            onTap: () {
                              title = data.description;
                              content = data.description;
                              creator = data.sourceId;
                              imageurl = data.imageUrl;
                              pubDate = data.pubDate;

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => NewsPage(title,
                                      imageurl, content, creator, pubDate),
                                ),
                              );
                            },
                          ),
                        );
                      });
                } else {
                  print('${snapshot.error}');
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
