import 'package:flutter/widgets.dart';
import 'my_screen_media.dart';
import 'my_screen_media_type.dart';

export 'my_display_type.dart';
export 'my_screen_media.dart';
export 'my_screen_media_type.dart';

class Responsive {
  static MyScreenMediaType mediaType(BuildContext context) {
    return MyScreenMedia.getTypeFromWidth(MediaQuery.of(context).size.width);
  }

  static bool isMobile(BuildContext context) => mediaType(context).isMobile;

  static bool isTablet(BuildContext context) => mediaType(context).isTablet;

  static bool isLaptop(BuildContext context) => mediaType(context).isLaptop;

  static bool isMiniDesktop(BuildContext context) =>
      mediaType(context).isMiniDesktop;

  static bool isDesktop(BuildContext context) {
    final type = mediaType(context);
    return type == MyScreenMediaType.lg ||
        type == MyScreenMediaType.xl ||
        type == MyScreenMediaType.xxl;
  }
}
