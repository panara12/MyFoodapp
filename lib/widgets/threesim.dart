import 'package:dairyporduct/widgets/smalltext.dart';
import 'package:flutter/cupertino.dart';

class Threesim extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconcolor;
  const Threesim({Key? key,
    required this.icon,
    required this.text,
    required this.iconcolor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconcolor,),
        SizedBox(width: 5,),
        Smalltext(text: text,)
      ],
    );
  }
}
