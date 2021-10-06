part of 'headline_news_bloc.dart';

abstract class HeadlineNewsEvent extends Equatable {
  const HeadlineNewsEvent();

  @override
  List<Object> get props => [];
}

class HeadlineNewsLoadEvent extends HeadlineNewsEvent {
  @override
  List<Object> get props => [];
}
