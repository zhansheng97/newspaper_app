import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:newspaper_app/data/api/api_client.dart';
import 'package:newspaper_app/data/data_sources/data_sources.dart';
import 'package:newspaper_app/data/repositories/news_repository_impl.dart';
import 'package:newspaper_app/domain/repository/news_repository_interface.dart';
import 'package:newspaper_app/domain/usecases/get_headline_news.dart';
import 'package:newspaper_app/domain/usecases/get_news_by_category.dart';
import 'package:newspaper_app/domain/usecases/search_news.dart';
import 'package:newspaper_app/presentation/bloc/headline_news/headline_news_bloc.dart';
import 'package:newspaper_app/presentation/bloc/new_list/news_list_bloc.dart';
import 'package:newspaper_app/presentation/bloc/news_detail/news_detail_bloc.dart';
import 'package:newspaper_app/presentation/bloc/search/search_bloc.dart';

final GetIt getItInstance = GetIt.instance;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());

  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  getItInstance.registerLazySingleton<IDataSources>(
      () => RemoteDataSourcesImpl(getItInstance()));

  getItInstance.registerLazySingleton<INewsRepository>(
      () => NewsRepositoryImpl(getItInstance()));

  getItInstance.registerLazySingleton<GetHeadLineNews>(
      () => GetHeadLineNews(getItInstance()));

  getItInstance.registerLazySingleton<GetNewsByCategory>(
      () => GetNewsByCategory(getItInstance()));

  getItInstance
      .registerLazySingleton<SearchNews>(() => SearchNews(getItInstance()));

  getItInstance.registerFactory<HeadlineNewsBloc>(
      () => HeadlineNewsBloc(getHeadLineNews: getItInstance()));

  getItInstance.registerFactory<NewsListBloc>(() => NewsListBloc(
        getHeadLineNews: getItInstance(),
        getNewsByCategory: getItInstance(),
      ));

  getItInstance.registerFactory<NewsDetailBloc>(() => NewsDetailBloc());

  getItInstance.registerFactory<SearchBloc>(
      () => SearchBloc(searchNews: getItInstance()));
}
