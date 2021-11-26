part of starlight_country_picker;

extension _CustomBuildContext on BuildContext {
  bool overScroll(OverscrollIndicatorNotification scroll) {
    scroll.disallowGlow();
    return true;
  }
}

extension _CustomString on String {
  String get validate => toLowerCase().replaceAll(' ', '');
}
