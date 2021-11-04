import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandableLatterScreen extends StatefulWidget {
  @override
  _ExpandableLatterScreenState createState() => _ExpandableLatterScreenState();
}

class _ExpandableLatterScreenState extends State<ExpandableLatterScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: AnimCard(
          Color(0xFF000000),
          '',
          '',
          '',
        ),
      ),
    );
  }
}

class AnimCard extends StatefulWidget {
  final Color color;
  final String num;
  final String numEng;
  final String content;

  // ignore: use_key_in_widget_constructors
  const AnimCard(this.color, this.num, this.numEng, this.content);

  @override
  _AnimCardState createState() => _AnimCardState();
}

class _AnimCardState extends State<AnimCard> {
  var padding = 150.0;
  var bottomPadding = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPadding(
          padding: EdgeInsets.only(top: padding, bottom: bottomPadding),
          duration: const Duration(milliseconds: 1000),
          curve: Curves.fastLinearToSlowEaseIn,
          child: CardItem(
            widget.color,
            widget.num,
            widget.numEng,
            widget.content,
            () {
              setState(() {
                padding = padding == 0 ? 150.0 : 0.0;
                bottomPadding = bottomPadding == 0 ? 150 : 0.0;
              });
            },
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20, left: 20, top: 200),
                height: 180,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2), blurRadius: 30)
                  ],
                  color: Colors.grey.shade300,
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(15)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CardItem extends StatelessWidget {
  final Color color;
  final String num;
  final String numEng;
  final String content;
  final onTap;

  // ignore: use_key_in_widget_constructors
  const CardItem(this.color, this.num, this.numEng, this.content, this.onTap);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        height: 220,
        width: width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFD81A1A).withOpacity(0.4),
              blurRadius: 25,
            ),
          ],
          color: color.withOpacity(1.0),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'Tap To View More',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Widgets that have global keys reparent their subtrees when they are moved from one location in the tree to another location in the tree. In order to reparent its subtree, a widget must arrive at its new location in the tree in the same animation frame in which it was removed from its old location the tree.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
