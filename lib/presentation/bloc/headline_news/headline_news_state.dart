part of 'headline_news_bloc.dart';

abstract class HeadlineNewsState extends Equatable {
  const HeadlineNewsState();

  @override
  List<Object> get props => [];
}

class HeadlineNewsInitial extends HeadlineNewsState {}

class HeadlineNewsError extends HeadlineNewsState {}

class HeadlineNewsLoaded extends HeadlineNewsState {
  final List<NewsEntity> articles;

  HeadlineNewsLoaded({required this.articles});

  @override
  List<Object> get props => [articles];
}
