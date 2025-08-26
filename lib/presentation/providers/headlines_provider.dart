import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_reader_app/data/repositories/news_repository_impl.dart';
import 'package:news_reader_app/domain/repositories/news_repository.dart';
import '../../domain/entities/article.dart';
import '../../domain/usecases/get_top_headlines.dart';

final headlinesProvider = FutureProvider<List<Article>>((ref) async {
  final getTopHeadlines = ref.read(getTopHeadlinesUseCaseProvider);
  return await getTopHeadlines.getArticle();
});

final getTopHeadlinesUseCaseProvider = Provider<GetTopHeadlines>((ref) {
  return GetTopHeadlines(newsRepository: ref.read(newsRepositoryProvider));
});

final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  return NewsRepositoryImpl();
});
