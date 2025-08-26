import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_reader_app/presentation/routes/app_router.dart';
import '../../providers/headlines_provider.dart';
import '../../widgets/article_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final headlinesState = ref.watch(headlinesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Top Headlines")),
      body: headlinesState.when(
        data: (articles) => ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) =>
              ArticleCard(
                  article: articles[index],
                  onTap: () => context.push(
                    AppRouter.routeDetail,
                    extra: articles[index],
                  )
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text("Error: $err")),
      ),
    );
  }
}
