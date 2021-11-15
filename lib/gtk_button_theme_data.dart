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

  factory GtkButtonThemeData.fromMap(Map<Object?, Object?> map) {
    return GtkButtonThemeData(
      normal_bg: map["normal_bg"] as int,
      normal_fg: map["normal_fg"] as int,
      active_bg: map["active_bg"] as int,
      active_fg: map["active_fg"] as int,
      prelight_bg: map["prelight_bg"] as int,
      prelight_fg: map["prelight_fg"] as int,
      selected_bg: map["selected_bg"] as int,
      selected_fg: map["selected_fg"] as int,
      focused_bg: map["focused_bg"] as int,
      focused_fg: map["focused_fg"] as int,
      checked_bg: map["checked_bg"] as int,
      checked_fg: map["checked_fg"] as int,
    );
  }

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
