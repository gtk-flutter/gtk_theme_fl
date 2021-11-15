// ignore_for_file: non_constant_identifier_names

class GtkButtonThemeData {
  final int normal_bg;
  final int normal_fg;

  final int active_bg;
  final int active_fg;

  final int prelight_bg;
  final int prelight_fg;

  final int selected_bg;
  final int selected_fg;

  final int focused_bg;
  final int focused_fg;

  final int checked_bg;
  final int checked_fg;

  const GtkButtonThemeData({
    required this.normal_bg,
    required this.normal_fg,
    required this.active_bg,
    required this.active_fg,
    required this.prelight_bg,
    required this.prelight_fg,
    required this.selected_bg,
    required this.selected_fg,
    required this.focused_bg,
    required this.focused_fg,
    required this.checked_bg,
    required this.checked_fg,
  });

  static const GtkButtonThemeData empty = GtkButtonThemeData(
    normal_bg: 0xff,
    normal_fg: 0xff,
    active_bg: 0xff,
    active_fg: 0xff,
    prelight_bg: 0xff,
    prelight_fg: 0xff,
    selected_bg: 0xff,
    selected_fg: 0xff,
    focused_bg: 0xff,
    focused_fg: 0xff,
    checked_bg: 0xff,
    checked_fg: 0xff,
  );
}
