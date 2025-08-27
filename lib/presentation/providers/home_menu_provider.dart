import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeMenuProvider = StateNotifierProvider<HomeMenuSheetNotifier, bool>((ref) => HomeMenuSheetNotifier());

class HomeMenuSheetNotifier extends StateNotifier<bool>{
  HomeMenuSheetNotifier() : super(false);

  void open() => state = true;
  void close() => state = false;
  void toggle() => state = !state;

}