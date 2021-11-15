import 'package:flgtk/flgtk.dart';
import 'package:flgtk_example/ColorBox.dart';
import 'package:flutter/widgets.dart';

class CommonColorsRow extends StatelessWidget {
  final GtkThemeData themeData;

  const CommonColorsRow({Key? key, required this.themeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          const Text("Common Colors"),
          const SizedBox(
            height: 5,
          ),
          Wrap(
            children: [
              ColorBox(
                color: Color(themeData.theme_fg_color),
                name: "theme_fg_color",
              ),
              ColorBox(
                color: Color(themeData.theme_text_color),
                name: "theme_text_color",
              ),
              ColorBox(
                color: Color(themeData.theme_bg_color),
                name: "theme_bg_color",
              ),
              ColorBox(
                color: Color(themeData.theme_base_color),
                name: "theme_base_color",
              ),
              ColorBox(
                color: Color(themeData.theme_selected_bg_color),
                name: "theme_selected_bg_color",
              ),
              ColorBox(
                color: Color(themeData.theme_selected_fg_color),
                name: "theme_selected_fg_color",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
