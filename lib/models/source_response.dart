class SourceResponse {
  String? status;
  List<Source>? sources;
  String? code;
  String? message; 

  SourceResponse({this.status, this.sources , this.code,this.message});

  SourceResponse.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    code = json["code"];
    message = json["message"];
    
    sources = json["sources"] == null
        ? null
        : (json["sources"] as List).map((e) => Source.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = status;
    if (sources != null) {
      data["sources"] = sources?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Source {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  Source(
      {this.id,
      this.name,
      this.description,
      this.url,
      this.category,
      this.language,
      this.country});

  Source.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    url = json["url"];
    category = json["category"];
    language = json["language"];
    country = json["country"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["description"] = description;
    data["url"] = url;
    data["category"] = category;
    data["language"] = language;
    data["country"] = country;
    return data;
  }
}
