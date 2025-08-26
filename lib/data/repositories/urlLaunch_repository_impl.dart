import 'package:url_launcher/url_launcher.dart';
import '../../domain/repositories/urlLaunch_repository.dart';

class UrlLaunchRepositoryImpl implements UrlLaunchRepository {
  @override
  Future<void> openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      print("uri : $uri");
      await launchUrl(uri, mode: LaunchMode.inAppWebView);
    } else {
      throw 'Could not launch $url';
    }
  }
}
