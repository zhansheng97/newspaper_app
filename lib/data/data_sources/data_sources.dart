import 'package:newspaper_app/data/api/api_client.dart';
import 'package:newspaper_app/data/models/api_result_model.dart';

abstract class IDataSources {
  Future<List<Articles>> getHeadlinesNew();
  Future<List<Articles>> getNewsByCategory(String category);
  Future<List<Articles>> searchNews(String title);
}

class RemoteDataSourcesImpl extends IDataSources {
  final ApiClient _apiClient;

  RemoteDataSourcesImpl(this._apiClient);

  @override
  Future<List<Articles>> getHeadlinesNew() async {
    final response = await _apiClient.get("/top-headlines?country=my");
    List<Articles> articles = NewsApiResult.fromJson(response).articles;
    return articles;
  }

  @override
  Future<List<Articles>> getNewsByCategory(String category) async {
    final response = await _apiClient.get("/top-headlines?category=$category");
    List<Articles> articles = NewsApiResult.fromJson(response).articles;
    return articles;
  }

  @override
  Future<List<Articles>> searchNews(String searchQuery) async {
    final response = await _apiClient.get("/everything?q=$searchQuery");
    List<Articles> articles = NewsApiResult.fromJson(response).articles;
    return articles;
  }
}
