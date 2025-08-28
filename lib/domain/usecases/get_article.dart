import 'package:news_reader_app/core/constants/api_constants.dart';

import '../entities/article.dart';
import '../repositories/news_repository.dart';

class GetAricle {
  final NewsRepository newsRepository;

  GetAricle({required this.newsRepository});

  Future<List<Article>> getSearchArticle(String searchString) async {
    return await newsRepository.getSearchArticles(searchString);
  }

  Future<List<Article>> getArticle(int type) async {
    switch(type){
      case ApiConstants.topHeadLine :
        return await newsRepository.getTopHeadlines();
      case ApiConstants.bitCoin :
        return await newsRepository.getBitCoin();
      case ApiConstants.apple :
        return await newsRepository.getApple();
      case ApiConstants.techCrunchAndTheNextWeb :
        return await newsRepository.getTechCrunchAndTheNextWeb();
      default:
        return await newsRepository.getTopHeadlines();
    }

  }
}
