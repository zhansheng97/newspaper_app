part of 'news_list_bloc.dart';

abstract class NewsListEvent extends Equatable {
  const NewsListEvent();

  @override
  List<Object> get props => [];
}

class NewListLoadEvent extends NewsListEvent {
  final String category;

  NewListLoadEvent({required this.category});

  @override
  List<Object> get props => [category];
}
