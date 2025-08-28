import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchBarProvider = StateNotifierProvider<SearchBarNotifier, bool>((ref) => SearchBarNotifier());

class SearchBarNotifier extends StateNotifier<bool>{
  SearchBarNotifier() : super(false);

  void toggle() => state = !state;

}