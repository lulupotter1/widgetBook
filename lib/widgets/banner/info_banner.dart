import 'package:flutter/material.dart';
import 'package:widgetbook_2/base/theme_color.dart';
import 'package:widgetbook_2/base/theme_text_style.dart';
import 'package:widgetbook_2/widgets/image_placeholder/image_placeholder.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookStory(name: 'Info Banner', type: InfoBanner)
Widget defaultInfoBannerStory(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  return Column(
    children: [
      Container(
        width: width,
        height: height,
        color: ThemeColors.blue100,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 200,
              color: ThemeColors.white,
              child: InfoBanner(
                mainText: 'Info banner',
                secondaryText: 'Info banner secondary',
                lowerTextColor: ThemeColors.coolgray500,
                height: 80,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

class InfoBanner extends StatelessWidget {
  String? image;
  String? mainText;
  String? secondaryText;
  Color? upperTextColor;
  Color? lowerTextColor;
  Color? backgroundColor;
  double? height;

  InfoBanner({
    Key? key,
    this.image,
    this.mainText,
    this.secondaryText = 'text',
    this.upperTextColor = ThemeColors.coolgray800,
    this.lowerTextColor = ThemeColors.coolgray900,
    this.backgroundColor = ThemeColors.white,
    this.height = 56,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: [
          if (image != null)
            ImagePlaceholder(
              width: 40,
              height: 40,
              url: image,
            ),
          if (image != null)
            const SizedBox(
              width: 10,
            ),
          SizedBox(
            height: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (mainText != null)
                  Text(
                    mainText!,
                    style: ThemeTextRegular.sm.apply(color: upperTextColor),
                  ),
                Text(
                  secondaryText!,
                  style: ThemeTextRegular.sm.apply(color: lowerTextColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
