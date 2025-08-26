
import 'package:news_reader_app/domain/repositories/urlLaunch_repository.dart';

class OpenUrlLaunch {
  final UrlLaunchRepository urlLaunchRepository;
  final String url;

  OpenUrlLaunch({required this.urlLaunchRepository, required this.url});

  Future<void> open() async {
    return await urlLaunchRepository.openUrl(url);
  }
}