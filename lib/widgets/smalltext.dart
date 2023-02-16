import 'package:flutter/cupertino.dart';

class Smalltext extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  double height;
  Smalltext({Key? key, this.color = const Color(0xFFccc7c5),
    required this.text,
    this.overFlow=TextOverflow.ellipsis,
    this.size=12,
    this.height=1.2,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
          color: color,
          fontSize: size,
          height: height,
      ),
    );
  }
}
