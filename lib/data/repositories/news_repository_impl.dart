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
}
