import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_reader_app/presentation/colors/app_color.dart';
import 'package:news_reader_app/presentation/routes/app_router.dart';
import 'package:news_reader_app/presentation/widgets/leftSheet.dart';
import '../../providers/headlines_provider.dart';
import '../../providers/home_menu_provider.dart';
import '../../widgets/article_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final headlinesState = ref.watch(headlinesProvider);
    final isMenuVisible = ref.watch(homeMenuProvider);
    final AppColor appColor = AppColor();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Headlines"),
        leading: IconButton(
          icon: Icon(Icons.menu, color: appColor.white),
          onPressed: () => ref.read(homeMenuProvider.notifier).open()
        ),
      ),
      body: Stack(
        children: [
          //Top headline news
          headlinesState.when(
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


          //메뉴 시트
          LeftSheet(
            isVisible: isMenuVisible,
            onClose: () => ref.read(homeMenuProvider.notifier).close(),
            width: size.width * 0.6,
            child: Column(
              children: [
                AppBar(
                  title: const Text("Menu"),
                  automaticallyImplyLeading: false,
                  actions: [
                    IconButton(
                      onPressed: () => ref.read(homeMenuProvider.notifier).close(),
                      icon: Icon(Icons.close, color: appColor.white),
                    ),
                  ],
                ),
                ListTile(
                  title: const Text("Top Headlines"),
                  onTap: (){
                    ref.read(homeMenuProvider.notifier).close();
                  },
                ),
                ListTile(
                  title: const Text("Bit Coin"),
                  onTap: (){
                    ref.read(homeMenuProvider.notifier).close();
                  },
                ),
                ListTile(
                  title: const Text("Apple"),
                  onTap: (){
                    ref.read(homeMenuProvider.notifier).close();
                  },
                ),
                ListTile(
                  title: const Text("Tech Crunch & The Next Web"),
                  onTap: (){
                    ref.read(homeMenuProvider.notifier).close();
                  },
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

}
