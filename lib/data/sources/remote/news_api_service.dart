import 'package:dio/dio.dart';
import '../../models/article_model.dart';
import '../../../core/constants/api_constants.dart';

class NewsApiService {
  final Dio _dio = Dio();

  // Top Headlines 가져오기
  Future<List<ArticleModel>> getTopHeadlines({String country = 'us'}) async {
    final response = await _dio.get(
      '${ApiConstants.baseUrl}/top-headlines',
      queryParameters: {
        'country': country,
        'apiKey': ApiConstants.apiKey,
      },
    );

    if (response.statusCode == 200) {
      final List data = response.data['articles'];
      return data.map((json) => ArticleModel.fromJson(json)).toList();
    } else {
      print("response.statusCode : ${response.statusCode}");
      throw Exception('Failed to fetch top headlines');
    }
  }

  Future<List<ArticleModel>> getBitCoin() async {
    final response = await _dio.get(
      '${ApiConstants.baseUrl}/everything',
      queryParameters: {
        'q': 'bitcoin',
        'apiKey': ApiConstants.apiKey,
      },
    );

    if (response.statusCode == 200) {
      final List data = response.data['articles'];
      return data.map((json) => ArticleModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch Bit Coin');
    }
  }

  Future<List<ArticleModel>> getApple() async {
    final response = await _dio.get(
      '${ApiConstants.baseUrl}/everything',
      queryParameters: {
        'q': 'apple',
        'apiKey': ApiConstants.apiKey,
      },
    );

    if (response.statusCode == 200) {
      final List data = response.data['articles'];
      return data.map((json) => ArticleModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch Apple');
    }
  }

  Future<List<ArticleModel>> getTechcrunchAndTheNextWeb() async {
    final response = await _dio.get(
      '${ApiConstants.baseUrl}/everything',
      queryParameters: {
        'domains': 'techcrunch.com,thenextweb.com',
        'apiKey': ApiConstants.apiKey,
      },
    );

    if (response.statusCode == 200) {
      final List data = response.data['articles'];
      return data.map((json) => ArticleModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch TechcrunchAndTheNextWeb');
    }
  }

  Future<List<ArticleModel>> getSearchArticles(String searchString) async {
    print("getSearchArticles start() ");

    final uri = Uri.https("newsapi.org", "/v2/everything", {
      'q': searchString,
      'sortBy': 'publishedAt',
      'apiKey': ApiConstants.apiKey,
    },);
    print("최종 요청 URL: $uri");


    final response = await _dio.get(
      '${ApiConstants.baseUrl}/everything',
      queryParameters: {
        'q': searchString,
        'sortBy': 'publishedAt',
        'apiKey': ApiConstants.apiKey,
      },
    );

    if (response.statusCode == 200) {
      final List data = response.data['articles'];
      return data.map((json) => ArticleModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch $searchString');
    }
  }
}