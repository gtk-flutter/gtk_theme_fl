import 'package:flutter/widgets.dart';

class ColorBox extends StatelessWidget {
  final Color color;
  final String name;

  const ColorBox({Key? key, required this.color, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            color: color,
            width: 100,
            height: 100,
          ),
          const SizedBox(height: 8),
          Text(name),
        ],
      ),
    );
  }
}
