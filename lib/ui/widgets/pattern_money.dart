import 'package:flutter/cupertino.dart';
import '../../app/constants/png_image_asset.dart';
import '../utils/media_query.dart';

class PatternMoneyBg extends StatelessWidget {
  final double? opacity;
  const PatternMoneyBg({super.key, this.opacity});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        child: Opacity(
          opacity: opacity ?? 0.6,
          child: Image.asset(
            PngImageAsset.patternMoney,
            height: deviceHeight(context),
            width: deviceWidth(context),
            fit: BoxFit.cover,
          ),
        ));
  }
}
