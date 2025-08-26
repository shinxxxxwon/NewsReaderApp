import 'package:flutter/material.dart';
import 'package:news_reader_app/core/theme/app_theme.dart';
import 'package:news_reader_app/presentation/colors/app_color.dart';
import 'package:news_reader_app/presentation/text/app_textSize.dart';

class AppTextStyle {
  final AppColor appColor = AppColor();
  final AppTextSize appTextSize = AppTextSize();

  final bool isThemeModeBrightness;

  AppTextStyle({required this.isThemeModeBrightness});

  //제목 스타일
  TextStyle get articleTitle => TextStyle(
    color: isThemeModeBrightness ? appColor.black : appColor.white,
    fontWeight: FontWeight.w600,
    fontSize: appTextSize.articleTitle,
  );

  //작성자 스타일
  TextStyle get articleAuthor => TextStyle(
    color: isThemeModeBrightness ? appColor.black : appColor.white,
    fontWeight: FontWeight.w400,
    fontSize: appTextSize.articleAuthor,
  );

  //본문 스타일
  TextStyle get articleDescription => TextStyle(
    color: isThemeModeBrightness ? appColor.black : appColor.white,
    fontWeight: FontWeight.w500,
    fontSize: appTextSize.articleDescription,
  );

  //원문 보기 버튼 스타일
  TextStyle get showOrigin => TextStyle(
    color: isThemeModeBrightness ? appColor.black : appColor.white,
    fontWeight: FontWeight.w500,
    fontSize: appTextSize.articleDescription,
  );
}