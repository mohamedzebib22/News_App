
import 'package:news_app/models/source_response.dart';

class NewsResponse {
   String? status;
   int? totalResults;
   List<News>? articles;
  String? code;
  String? message; 

  NewsResponse({ this.status,  this.totalResults,  this.articles , this.code, this.message});

  NewsResponse.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    totalResults = json["totalResults"];
    code = json["code"];
    message = json["message"];
    articles = json["articles"] == null ? null : (json["articles"] as List).map((e) => News.fromJson(e)).toList();
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = status;
    data["totalResults"] = totalResults;
    if(articles != null) {
      data["articles"] = articles?.map((e) => e.toJson()).toList();
    }
    return data;
  }
  
}

class News {
   Source? source;
   String? author;
   String? title;
   String? description;
   String? url;
   String? urlToImage;
   String? publishedAt;
   String? content;

  News({ this.source,  this.author,  this.title,  this.description,  this.url,  this.urlToImage,  this.publishedAt,  this.content});

  News.fromJson(Map<String, dynamic> json) {
    source = json["source"] == null ? null : Source.fromJson(json["source"]);
    author = json["author"];
    title = json["title"];
    description = json["description"];
    url = json["url"];
    urlToImage = json["urlToImage"];
    publishedAt = json["publishedAt"];
    content = json["content"];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(source != null) {
      data["source"] = source?.toJson();
    }
    data["author"] = author;
    data["title"] = title;
    data["description"] = description;
    data["url"] = url;
    data["urlToImage"] = urlToImage;
    data["publishedAt"] = publishedAt;
    data["content"] = content;
    return data;
  }
  
}

