import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_reader_app/domain/entities/article.dart';
import 'package:news_reader_app/presentation/colors/app_color.dart';
import 'package:news_reader_app/presentation/text/app_textStyle.dart';
import 'package:news_reader_app/presentation/widgets/textUriButton.dart';
import '../../providers/news_provider.dart';
import '../../widgets/article_card.dart';

class DetailScreen extends ConsumerWidget {
  final Article article;

  const DetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final isBrightness = Theme.of(context).brightness == Brightness.light;
    final AppColor appColor = AppColor();
    final titleTextStyle = AppTextStyle(isThemeModeBrightness: isBrightness);

    return Scaffold(
      appBar: AppBar(
           leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: appColor.white,
            ),
             onPressed: () => context.pop()
          ),

          title: Text(article.title)
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //대표 이미지
          if (article.imageUrl != null)
            Image.network(article.imageUrl!, height: 240, fit: BoxFit.cover),

          const SizedBox(height: 8),

          //제목
          Text(
            article.title,
            style: titleTextStyle.articleTitle
          ),

          const SizedBox(height: 8),

          //작성자
          Text(
              article.author,
              style: titleTextStyle.articleAuthor
          ),

          const SizedBox(height: 6.0),

          //날짜
          Text(
              article.publishedAt ?? "",
              style: titleTextStyle.articleAuthor
          ),

          const SizedBox(height: 12.0),

          //본문 내용
          SizedBox(
            height: size.height * 0.3,
            child: Text(
              article.description ?? "",
              maxLines: 15,
              style: titleTextStyle.articleContent,
            ),
          ),

          const SizedBox(height: 8),

          TextUriButton(text: "[ 원문 내용 보기 ]", url: article.url),

        ],
      ),
    );
  }
}
