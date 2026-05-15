import 'package:flutter/material.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: PageView(
        controller: pageController,
        children: [
          ClipRRect(
            borderRadius: .circular(30),
            child: Image.asset(
              'assets/images/hero.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          ClipRRect(
            borderRadius: .circular(30),
            child: Image.asset(
              'assets/images/tomato.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          ClipRRect(
            borderRadius: .circular(30),
            child: Image.asset(
              'assets/images/berries.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          ClipRRect(
            borderRadius: .circular(30),
            child: Image.asset(
              'assets/images/milk.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          ClipRRect(
            borderRadius: .circular(30),
            child: Image.asset(
              'assets/images/tulsi.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
