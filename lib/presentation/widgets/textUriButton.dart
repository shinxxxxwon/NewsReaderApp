import 'package:flutter/material.dart';
import 'package:news_reader_app/data/repositories/urlLaunch_repository_impl.dart';
import 'package:news_reader_app/domain/usecases/openUrlLaunch.dart';
import 'package:news_reader_app/presentation/text/app_textStyle.dart';

class TextUriButton extends StatelessWidget {
  final String text;
  final String url;

  const TextUriButton({Key? key, required this.text, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isBrightness = Theme.of(context).brightness == Brightness.light;
    final AppTextStyle appTextStyle = AppTextStyle(isThemeModeBrightness: isBrightness);

    return InkWell(
      onTap: () async {
        final urlLaunchRepositoryImpl = UrlLaunchRepositoryImpl();
        final openUrlLaunch = OpenUrlLaunch(urlLaunchRepository: urlLaunchRepositoryImpl, url: url);
        return await openUrlLaunch.open();
      },
      child: Container(
        width: size.width,
        height: 20,
        alignment: Alignment.center,
        child: Text(
          text,
          style: appTextStyle.showOrigin,
        ),
      ),
    );
  }
}
