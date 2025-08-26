import '../entities/article.dart';
import '../repositories/news_repository.dart';

class GetTopHeadlines {
  final NewsRepository newsRepository;

  GetTopHeadlines({required this.newsRepository});

  Future<List<Article>> getArticle() async {
    return await newsRepository.getTopHeadlines();
  }
}
