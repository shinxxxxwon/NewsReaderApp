import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_reader_app/data/repositories/news_repository_impl.dart';
import 'package:news_reader_app/domain/repositories/news_repository.dart';
import '../../domain/entities/article.dart';
import '../../domain/usecases/get_article.dart';

final selectedTypeProvider = StateProvider<int>((ref) => 0);

final searchTextProvider = StateProvider<String>((ref) => "");

final searchProvider = FutureProvider.family<List<Article>, String>((ref, searchString) async {
  final searchText = ref.watch(searchTextProvider);
  final getArticles = ref.read(getArticlesUseCaseProvider);

  if (searchText.isEmpty) {
    final type = ref.watch(selectedTypeProvider);
    return await getArticles.getArticle(type);
  }
  return await getArticles.getSearchArticle(searchString);
});

final articleProvider = FutureProvider<List<Article>>((ref) async {
  final getArticles = ref.read(getArticlesUseCaseProvider);
  final type = ref.watch(selectedTypeProvider);
  return await getArticles.getArticle(type);
});

final getArticlesUseCaseProvider = Provider<GetAricle>((ref) {
  return GetAricle(newsRepository: ref.read(newsRepositoryProvider));
});

final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  return NewsRepositoryImpl();
});
