import 'package:newspaper_app/domain/entities/news_entities.dart';

class NewsApiResult {
  final String? status;
  final int? totalResults;
  final List<Articles> articles;

  NewsApiResult({
    this.status,
    this.totalResults,
    required this.articles,
  });

  factory NewsApiResult.fromJson(Map<String, dynamic> json) {
    List<Articles> articles = new List<Articles>.empty(growable: true);

    if (json['articles'] != null) {
      json['articles'].forEach((v) {
        articles.add(new Articles.fromJson(v));
      });
    }

    return NewsApiResult(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: articles,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    data['articles'] = this.articles.map((v) => v.toJson()).toList();
    return data;
  }
}

class Articles extends NewsEntity {
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  Articles({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  }) : super(
          author: author,
          title: title,
          description: description,
          publishedAt: publishedAt,
          url: url,
          urlToImage: urlToImage,
        );

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      source: json['source'] != null ? Source.fromJson(json['source']) : null,
      author: json['author'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'] ?? "",
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.source != null) {
      data['source'] = this.source?.toJson();
    }
    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.url;
    data['urlToImage'] = this.urlToImage;
    data['publishedAt'] = this.publishedAt;
    data['content'] = this.content;
    return data;
  }
}

class Source {
  final String? id;
  final String? name;

  Source({this.id, this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
