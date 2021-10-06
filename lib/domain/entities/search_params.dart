import 'package:equatable/equatable.dart';

class NewsParams extends Equatable {
  final String newsParams;

  NewsParams(this.newsParams);

  @override
  List<Object?> get props => [newsParams];
}
