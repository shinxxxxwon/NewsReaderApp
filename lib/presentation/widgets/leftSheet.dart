import 'package:flutter/material.dart';
import 'package:news_reader_app/presentation/colors/app_color.dart';

class LeftSheet extends StatelessWidget {
  final Widget child;
  final double width;
  final bool isVisible;
  final VoidCallback? onClose;

  const LeftSheet({
    Key? key,
    required this.child,
    this.width = 400,
    required this.isVisible,
    required this.onClose
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColor = AppColor();

    return Stack(
      children: [
        if(isVisible)
          GestureDetector(
            onTap: onClose,
            child: Container(
              color: appColor.semiTransparentBlack,
              width: double.infinity,
              height: double.infinity,
            ),
          ),

        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          top: 0,
          left: isVisible ? 0 : -width,
          bottom: 0,
          child: Material(
            elevation: 16,
            child: SizedBox(
              width: width,
              child: child,
            ),
          ),
        )
      ],
    );
  }
}
