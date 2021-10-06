part of 'news_detail_bloc.dart';

abstract class NewsDetailState extends Equatable {
  const NewsDetailState();

  @override
  List<Object> get props => [];
}

class NewsDetailInitial extends NewsDetailState {}

class NewsDetailError extends NewsDetailState {}

class NewsDetailLoaded extends NewsDetailState {
  final NewsEntity article;

  NewsDetailLoaded({required this.article});

  @override
  List<Object> get props => [article];
}
