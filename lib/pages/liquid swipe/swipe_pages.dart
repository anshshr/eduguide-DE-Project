// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../my widgets/my_button.dart';
import '../register_page.dart';
import 'pages.dart';

class SwipePages extends StatefulWidget {
  const SwipePages({super.key});

  @override
  State<SwipePages> createState() => _SwipePagesState();
}

class _SwipePagesState extends State<SwipePages> {
  LiquidController controller = LiquidController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            pages: pages,
            liquidController: controller,
            onPageChangeCallback: (index) {
              setState(() {});
            },
          ),
          Positioned(
            right: 20,
            bottom: 13,
            left: 20,
            child: controller.currentPage != pages.length - 1
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        child: Text(
                          'SKIP',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black87),
                        ),
                        onPressed: () {
                          controller.jumpToPage(page: pages.length - 1);
                        },
                      ),
                      AnimatedSmoothIndicator(
                        activeIndex: controller.currentPage,
                        count: pages.length,
                        effect: WormEffect(
                            spacing: 10,
                            dotColor: Colors.white,
                            activeDotColor: Colors.black87),
                        onDotClicked: (index) =>
                            controller.animateToPage(page: index),
                      ),
                      TextButton(
                        child: Text('NEXT',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black)),
                        onPressed: () {
                          final page = controller.currentPage + 1;
                          controller.animateToPage(
                              page: page > pages.length ? 0 : page,
                              duration: 500);
                        },
                      ),
                    ],
                  )
                : Align(
                    alignment: Alignment.bottomCenter,
                    child: my_button(
                        text: "L E T ' S   S T A R T",
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(),
                              ));
                        })),
          )
        ],
      ),
    );
  }
}
