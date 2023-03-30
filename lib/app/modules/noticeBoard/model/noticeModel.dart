class Notice {
  int? status;
  List<NewsEvents>? newsEvents;

  Notice({this.status, this.newsEvents});

  Notice.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['news_events'] != null) {
      newsEvents = <NewsEvents>[];
      json['news_events'].forEach((v) {
        newsEvents!.add(new NewsEvents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.newsEvents != null) {
      data['news_events'] = this.newsEvents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NewsEvents {
  String? title;
  String? description;
  String? id;

  NewsEvents({this.title, this.description, this.id});

  NewsEvents.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['id'] = this.id;
    return data;
  }
}
