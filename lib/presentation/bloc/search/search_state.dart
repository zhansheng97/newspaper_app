part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchError extends SearchState {}

class SearchNewsLoaded extends SearchState {
  final List<NewsEntity> articles;

  SearchNewsLoaded({required this.articles});

  @override
  List<Object> get props => [articles];
}
