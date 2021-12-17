import 'package:enewspaper/apidata_manager.dart';
import 'package:enewspaper/news_page.dart';
import 'package:enewspaper/newsdata.dart';
import 'package:flutter/material.dart';

class MediaCatagoryMainPage extends StatefulWidget {
  final String catagoryKeyword;
  final String imageUrl;
  MediaCatagoryMainPage(this.catagoryKeyword, this.imageUrl);

  @override
  _MediaCatagoryMainPageState createState() =>
      _MediaCatagoryMainPageState(catagoryKeyword, imageUrl);
}

class _MediaCatagoryMainPageState extends State<MediaCatagoryMainPage> {
  Future<NewsData> _newsData;
  final String imageUrl;
  final String catagoryKeyword;

  _MediaCatagoryMainPageState(this.catagoryKeyword, this.imageUrl);

  void initState() {
    _newsData = ApiDataManager().fetchNewsDataByMedia(catagoryKeyword);
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
            height: height * .59,
            width: width * 1,
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
                      if (snapshot.data.results[index].sourceId ==
                          catagoryKeyword) {
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
                            subtitle: Text(data.description),
                            selectedTileColor: Colors.grey,
                            onTap: () {
                              title = data.title;
                              content = data.description;
                              creator = data.sourceId;
                              pubDate = data.pubDate;
                              imageurl = data.imageUrl;
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => NewsPage(title,
                                      imageurl, content, creator, pubDate),
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return Text('NO Data Available');
                      }
                    },
                  );
                } else {}
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
