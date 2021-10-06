part of 'news_list_bloc.dart';

abstract class NewsListState extends Equatable {
  const NewsListState();

  @override
  List<Object> get props => [];
}

class NewsListInitial extends NewsListState {}

class NewsListError extends NewsListState {}

class NewsListLoaded extends NewsListState {
  final List<NewsEntity> articles;

  NewsListLoaded({required this.articles});

  @override
  List<Object> get props => [articles];
}
