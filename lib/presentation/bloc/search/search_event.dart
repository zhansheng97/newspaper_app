part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchNewsEvent extends SearchEvent {
  final String searchParams;

  SearchNewsEvent({required this.searchParams});

  @override
  List<Object> get props => [searchParams];
}
