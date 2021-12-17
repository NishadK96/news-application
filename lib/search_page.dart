import 'package:enewspaper/apidata_manager.dart';
import 'package:enewspaper/news_page.dart';
import 'package:enewspaper/newsdata.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final String searchText;
  SearchPage(this.searchText);
  @override
  _SearchPageState createState() => _SearchPageState(searchText);
}

class _SearchPageState extends State<SearchPage> {
  final String searchText;
  _SearchPageState(this.searchText);
  Future _newsData;
  void initState() {
    _newsData = ApiDataManager().fetchNewsDataBySearch(searchText);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).copyWith().size.height;
    var width = MediaQuery.of(context).copyWith().size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('E-News'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Showing Results for \'$searchText\'',
              style: TextStyle(
                  decorationStyle: TextDecorationStyle.dashed, fontSize: 26),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: height * .75,
              width: width * 1,
              // color: Colors.black,
              child: FutureBuilder<NewsData>(
                future: _newsData,
                builder: (context, snapshot) {
                  if (snapshot.data.results.length != 0) {
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
                              title: Text(data.title != null ? data.title : ''),
                              subtitle: Text(
                                data.description != null
                                    ? data.description
                                    : '',
                              ),
                              selectedTileColor: Colors.grey,
                              onTap: () {
                                title = data.title != null ? data.title : '';
                                content = data.content != null
                                    ? data.content
                                    : data.description;
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
                    Column(
                      children: [
                        Text('NO data Available for $searchText'),
                        Image.asset(
                          'assets/images/waiting.png',
                          scale: 2,
                        )
                      ],
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
