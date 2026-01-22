import 'my_display_type.dart';
import 'my_screen_media_type.dart';

class MyScreenMedia {
  static int flexColumns = 12;
  static double flexSpacing = 24;

  static MyScreenMediaType getTypeFromWidth(double width) {
    for (final type in MyScreenMediaType.values) {
      if (width < type.width) {
        return type;
      }
    }
    return MyScreenMediaType.xxl;
  }

  static Map<MyScreenMediaType, T> getFilledMedia<T>(
    Map<MyScreenMediaType, T>? map,
    T defaultValue, [
    bool reversed = false,
  ]) {
    final Map<MyScreenMediaType, T> result = {};
    map ??= {};
    var list = MyScreenMediaType.list;
    if (reversed) {
      list = list.reversed.toList();
    }
    for (var i = 0; i < list.length; i++) {
      result[list[i]] =
          map[list[i]] ?? (i > 0 ? result[list[i - 1]] : null) ?? defaultValue;
    }
    return result;
  }

  static Map<MyScreenMediaType, double> getFlexedDataFromString(String? text) {
    text ??= '';
    final Map<MyScreenMediaType, double> result = {};

    final data = text.split(' ');
    for (final item in data) {
      for (final type in MyScreenMediaType.values) {
        if (item.contains(type.className)) {
          final value =
              double.tryParse(item.replaceAll('${type.className}-', ''));
          if (value != null) {
            result[type] = value;
            break;
          }
        }
      }
    }

    return getFilledMedia<double>(result, MyScreenMedia.flexColumns.toDouble());
  }

  static Map<MyScreenMediaType, MyDisplayType> getDisplayDataFromString(
    String? text,
  ) {
    text ??= '';
    final Map<MyScreenMediaType, MyDisplayType> result = {};

    final data = text.split(' ');
    for (final item in data) {
      for (final type in MyScreenMediaType.values) {
        if (item.contains(type.className)) {
          final display = MyDisplayType.fromString(
            item.replaceAll('${type.className}-', ''),
          );
          result[type] = display;
          break;
        }
      }
    }

    return getFilledMedia(result, MyDisplayType.block);
  }
}
