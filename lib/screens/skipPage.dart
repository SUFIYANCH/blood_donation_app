import 'package:blood_donation_app/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SkipPage extends StatefulWidget {
  const SkipPage({super.key});

  @override
  State<SkipPage> createState() => _SkipPageState();
}

class _SkipPageState extends State<SkipPage> {
  late PageController _controller;
  int currentpageindex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: ((pageIndex) {
                setState(() {
                  currentpageindex = pageIndex;
                });
              }),
              controller: _controller,
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  child: Image.asset(
                    "lib/assets/skippage1.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  child: Image.asset(
                    "lib/assets/skippage2.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  child: Image.asset(
                    "lib/assets/skippage5.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: const SlideEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  dotColor: Color.fromARGB(255, 214, 208, 208),
                  activeDotColor: Colors.black),
              onDotClicked: (dotindex) {
                _controller.animateToPage(dotindex,
                    duration: Duration(microseconds: 700),
                    curve: Curves.linear);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 24),
            height: 50,
            width: 150,
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: buttonColor, shape: StadiumBorder()),
              onPressed: () {
                currentpageindex == 2
                    ? Navigator.pushNamed(context, "/")
                    : _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
              },
              child: Text(
                currentpageindex == 2 ? "Start" : 'Next',
                style: TextStyle(
                    color: secondaryColor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
