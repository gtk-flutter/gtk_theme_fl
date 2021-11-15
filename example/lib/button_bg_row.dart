import 'package:flgtk/flgtk.dart';
import 'package:flgtk_example/ColorBox.dart';
import 'package:flutter/widgets.dart';

class ButtonBGRow extends StatelessWidget {
  final GtkThemeData themeData;

  const ButtonBGRow({Key? key, required this.themeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          const Text("Button BG Colors"),
          const SizedBox(
            height: 5,
          ),
          Wrap(
            children: [
              ColorBox(
                color: Color(themeData.buttonThemeData.normal_bg),
                name: "normal_bg",
              ),
              ColorBox(
                color: Color(themeData.buttonThemeData.active_bg),
                name: "active_bg",
              ),
              ColorBox(
                color: Color(themeData.buttonThemeData.selected_bg),
                name: "selected_bg",
              ),
              ColorBox(
                color: Color(themeData.buttonThemeData.focused_bg),
                name: "focused_bg",
              ),
              ColorBox(
                color: Color(themeData.buttonThemeData.checked_bg),
                name: "checked_bg",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
