import 'source.dart';

class Article {
  final String author;
  final String title;
  final String? description;
  final String url;
  final String? imageUrl;
  final String? publishedAt;
  final String sourceName;

  Article({
    required this.author,
    required this.title,
    this.description,
    required this.url,
    this.imageUrl,
    this.publishedAt,
    required this.sourceName,
  });
}
