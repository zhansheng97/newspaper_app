part of 'news_detail_bloc.dart';

abstract class NewsDetailEvent extends Equatable {
  const NewsDetailEvent();

  @override
  List<Object> get props => [];
}

class NewsDetailLoadEvent extends NewsDetailEvent {
  final NewsEntity article;

  NewsDetailLoadEvent({required this.article});

  @override
  List<Object> get props => [article];
}
