import 'package:equatable/equatable.dart';

class NewsEntity extends Equatable {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;

  NewsEntity({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
  });

  @override
  List<Object?> get props => [title];
}
