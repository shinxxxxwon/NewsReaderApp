import '../entities/article.dart';

abstract class NewsRepository {
  Future<List<Article>> getTopHeadlines({String country = "us"});
  // Future<List<Article>> getBitCoin({String country = "us"});
  // Future<List<Article>> getApple({String country = "us"});
  // Future<List<Article>> getTechCrunchAndTheNextWeb({String country = "us"});
}
