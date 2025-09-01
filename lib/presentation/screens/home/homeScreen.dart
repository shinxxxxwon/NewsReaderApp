import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_reader_app/presentation/colors/app_color.dart';
import 'package:news_reader_app/presentation/providers/search_bar_provider.dart';
import 'package:news_reader_app/presentation/routes/app_router.dart';
import 'package:news_reader_app/presentation/widgets/leftSheet.dart';
import '../../../core/constants/api_constants.dart';
import '../../providers/news_provider.dart';
import '../../providers/home_menu_provider.dart';
import '../../widgets/article_card.dart';

class HomeScreen extends ConsumerStatefulWidget{
  const HomeScreen({super.key});
  
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen>{
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _searchController.clear();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  String getAppBarTitle(int type){
    switch(type){
      case ApiConstants.topHeadLine :
        return 'Top Headlines';
      case ApiConstants.bitCoin :
        return 'BitCoin';
      case ApiConstants.apple :
        return 'Apple';
      case ApiConstants.techCrunchAndTheNextWeb :
        return 'Tech Crunch And The Next Web';
      default:
        return 'Top Headlines';
    }
  }

  @override
  Widget build(BuildContext context) {
    final articleState = ref.watch(articleProvider);
    final searchState = ref.watch(searchProvider);
    final isMenuVisible = ref.watch(homeMenuProvider);
    final isSearchVisible = ref.watch(searchBarProvider);
    final selectedType = ref.watch(selectedTypeProvider);

    final AppColor appColor = AppColor();
    final size = MediaQuery.of(context).size;


    return Scaffold(
      appBar: AppBar(
        title: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            return SizeTransition(
              sizeFactor: animation,
              axis: Axis.horizontal,
              child: child,
            );
          },
          child: isSearchVisible ?
          TextField(
            key: const ValueKey("search_text_filed"),
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: "Search...",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey), // 기본 밑줄 색
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2), // 포커스 시 색상 & 두께
              ),
            ),
            onChanged: (value) {
              ref.read(searchTextProvider.notifier).state = value;
            },
          ) :
          Text(
            getAppBarTitle(selectedType),
            key: const ValueKey("app_bar_title_text"),
          ),
        ),
        leading: IconButton(
            icon: Icon(Icons.menu, color: appColor.white),
            onPressed: () => ref.read(homeMenuProvider.notifier).open()
        ),
        actions: [
          IconButton(
            icon: Icon(
                isSearchVisible ? Icons.close : Icons.search,
                color: appColor.white
            ),
            onPressed: () {
              _searchController.clear();
              ref.read(searchBarProvider.notifier).toggle();
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          //Top headline news
          _searchController.text.isEmpty ?
          articleState.when(
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
          ) :
          searchState.when(
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
                    ref.read(selectedTypeProvider.notifier).state = 0;
                    ref.read(homeMenuProvider.notifier).close();
                  },
                ),
                ListTile(
                  title: const Text("Bit Coin"),
                  onTap: (){
                    ref.read(selectedTypeProvider.notifier).state = 1;
                    ref.read(homeMenuProvider.notifier).close();
                  },
                ),
                ListTile(
                  title: const Text("Apple"),
                  onTap: (){
                    ref.read(selectedTypeProvider.notifier).state = 2;
                    ref.read(homeMenuProvider.notifier).close();
                  },
                ),
                ListTile(
                  title: const Text("Tech Crunch & The Next Web"),
                  onTap: (){
                    ref.read(selectedTypeProvider.notifier).state = 3;
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

