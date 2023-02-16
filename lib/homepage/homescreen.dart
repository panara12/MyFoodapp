import 'package:dairyporduct/homepage/pageveiw.dart';
import 'package:dairyporduct/widgets/big_text.dart';
import 'package:dairyporduct/widgets/smalltext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeSceern extends StatefulWidget {
  const HomeSceern({Key? key}) : super(key: key);

  @override
  State<HomeSceern> createState() => _HomeSceernState();
}

class _HomeSceernState extends State<HomeSceern> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 45, bottom: 15),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(
                      text: 'India',
                      color: Color(0xFF89dad0),
                    ),
                    Row(
                      children: [
                        Smalltext(text: 'Jamnagar'),
                        Icon(Icons.arrow_drop_down_rounded)
                      ],
                    )
                  ],
                ),
                Container(
                  width: 45,
                  height: 45,
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFF89dad0),
                  ),
                )
              ],
            ),
          ),
          Container(child: Page_body(),)
        ],
      ),
    );
  }
}
