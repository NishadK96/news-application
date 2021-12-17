import 'dart:convert';

NewsData newsData(String str) => NewsData.fromJson(json.decode(str));

String newsDataToJson(NewsData data) => json.encode(data.toJson());

class NewsData {
  NewsData({
    this.status,
    this.totalResults,
    this.results,
    this.nextPage,
  });

  String status;
  int totalResults;
  List<Result> results;
  int nextPage;

  factory NewsData.fromJson(Map<String, dynamic> json) => NewsData(
        status: json["status"],
        totalResults: json["totalResults"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        nextPage: json["nextPage"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "nextPage": nextPage,
      };
}

class Result {
  Result({
    this.title,
    this.link,
    this.keywords,
    this.creator,
    this.videoUrl,
    this.description,
    this.content,
    this.pubDate,
    this.imageUrl,
    this.sourceId,
  });

  String title;
  String link;
  List<String> keywords;
  List<String> creator;
  dynamic videoUrl;
  String description;
  String content;
  DateTime pubDate;
  String imageUrl;
  String sourceId;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json["title"],
        link: json["link"],
        keywords: json["keywords"] == null
            ? null
            : List<String>.from(json["keywords"].map((x) => x)),
        creator: json["creator"] == null
            ? null
            : List<String>.from(json["creator"].map((x) => x)),
        videoUrl: json["video_url"],
        description: json["description"],
        content: json["content"] == null ? null : json["content"],
        pubDate: DateTime.parse(json["pubDate"]),
        imageUrl: json["image_url"] == null ? null : json["image_url"],
        sourceId: json["source_id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "link": link,
        "keywords": keywords == null
            ? null
            : List<dynamic>.from(keywords.map((x) => x)),
        "creator":
            creator == null ? null : List<dynamic>.from(creator.map((x) => x)),
        "video_url": videoUrl,
        "description": description,
        "content": content == null ? null : content,
        "pubDate": pubDate.toIso8601String(),
        "image_url": imageUrl == null ? null : imageUrl,
        "source_id": sourceId,
      };
}
