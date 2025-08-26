import '../../domain/entities/article.dart';
import 'source_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel {
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final String? publishedAt;
  final SourceModel? source;

  ArticleModel({
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    this.publishedAt,
    this.source,
  });

  // JSON → ArticleModel
  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);

  // ArticleModel → JSON
  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);

  // Entity 변환
  Article toEntity() {
    return Article(
      author: author ?? 'Unknown',
      title: title,
      description: description,
      url: url,
      imageUrl: urlToImage,
      publishedAt: publishedAt,
      sourceName: source?.name ?? 'Unknown',
    );
  }
}
