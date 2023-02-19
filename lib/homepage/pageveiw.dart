import 'package:dairyporduct/widgets/big_text.dart';
import 'package:dairyporduct/widgets/smalltext.dart';
import 'package:dairyporduct/widgets/threesim.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page_body extends StatefulWidget {
  const Page_body({Key? key}) : super(key: key);

  @override
  State<Page_body> createState() => _Page_bodyState();
}

class _Page_bodyState extends State<Page_body> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double height = 220;

  @override
  void initSatate() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        print("current page " + _currPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, position) {
          return _buildPageItem(position);
        },
      ),
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currtrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currtrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currtrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currtrans, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 220,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://wallpapershome.com/images/pages/ico_h/17072.jpg'))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5)
                  ),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0)
                  ),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0)
                  )
                ]
              ),
              child: Container(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: 'Chinese Side'),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                              5,
                              (index) => Icon(
                                    Icons.star,
                                    color: Color(0xFF89dad0),
                                    size: 15,
                                  )),
                        ),
                        SizedBox(width: 10),
                        Smalltext(text: '4.5'),
                        SizedBox(
                          width: 10,
                        ),
                        Smalltext(text: '1247'),
                        SizedBox(
                          width: 10,
                        ),
                        Smalltext(text: 'comment')
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        Threesim(
                            icon: Icons.circle,
                            text: 'normal',
                            iconcolor: Color(0xFFffd28d)),
                        Threesim(
                            icon: Icons.location_on,
                            text: '32 min',
                            iconcolor: Color(0xFFfcab88)),
                        Threesim(
                            icon: Icons.punch_clock,
                            text: 'normal',
                            iconcolor: Color(0xFFffd28d)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
