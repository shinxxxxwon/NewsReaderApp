import '../entities/article.dart';

abstract class NewsRepository {
  Future<List<Article>> getTopHeadlines({String country = "us"});
  Future<List<Article>> getBitCoin();
  Future<List<Article>> getApple();
  Future<List<Article>> getTechCrunchAndTheNextWeb();
  Future<List<Article>> getSearchArticles(String searchString);
}
