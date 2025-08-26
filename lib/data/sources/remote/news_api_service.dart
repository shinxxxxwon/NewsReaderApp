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
      throw Exception('Failed to fetch top headlines');
    }
  }
}