import 'package:flgtk/flgtk.dart';
import 'package:flgtk_example/ColorBox.dart';
import 'package:flutter/widgets.dart';

class ButtonFGRow extends StatelessWidget {
  final GtkThemeData themeData;

  const ButtonFGRow({Key? key, required this.themeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          const Text("Button FG Colors"),
          const SizedBox(
            height: 5,
          ),
          Wrap(
            children: [
              ColorBox(
                color: Color(themeData.buttonThemeData.normal_fg),
                name: "normal_fg",
              ),
              ColorBox(
                color: Color(themeData.buttonThemeData.active_fg),
                name: "active_fg",
              ),
              ColorBox(
                color: Color(themeData.buttonThemeData.prelight_fg),
                name: "prelight_fg",
              ),
              ColorBox(
                color: Color(themeData.buttonThemeData.selected_fg),
                name: "selected_fg",
              ),
              ColorBox(
                color: Color(themeData.buttonThemeData.focused_fg),
                name: "focused_fg",
              ),
              ColorBox(
                color: Color(themeData.buttonThemeData.checked_fg),
                name: "checked_fg",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
