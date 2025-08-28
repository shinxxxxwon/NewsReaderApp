import '../../domain/entities/article.dart';
import '../../domain/repositories/news_repository.dart';
import '../sources/remote/news_api_service.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsApiService _apiService = NewsApiService();

  @override
  Future<List<Article>> getTopHeadlines({String country = "us"}) async {
    final articleModels = await _apiService.getTopHeadlines();
    return articleModels.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<Article>> getApple() async {
    final articleModels = await _apiService.getApple();
    return articleModels.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<Article>> getBitCoin() async {
    final articleModels = await _apiService.getBitCoin();
    return articleModels.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<Article>> getTechCrunchAndTheNextWeb() async {
    final articleModels = await _apiService.getTechcrunchAndTheNextWeb();
    return articleModels.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<Article>> getSearchArticles(String searchString) async {
    final articleModels = await _apiService.getSearchArticles(searchString);
    return articleModels.map((model) => model.toEntity()).toList();
  }
}
