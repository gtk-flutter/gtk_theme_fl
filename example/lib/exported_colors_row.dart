import 'package:gtk_theme_fl/gtk_theme_fl.dart';
import 'package:gtk_theme_fl_example/ColorBox.dart';
import 'package:flutter/widgets.dart';

class ExportedColorsRow extends StatelessWidget {
  final GtkThemeData themeData;

  const ExportedColorsRow({Key? key, required this.themeData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        const Text("Exported Colors"),
        const SizedBox(
          height: 5,
        ),
        Wrap(
          children: [
            ColorBox(
              color: Color(themeData.success_color),
              name: "success_color",
            ),
            ColorBox(
              color: Color(themeData.warning_color),
              name: "warning_color",
            ),
            ColorBox(
              color: Color(themeData.error_color),
              name: "error_color",
            ),
          ],
        ),
      ],
    );
  }
}
