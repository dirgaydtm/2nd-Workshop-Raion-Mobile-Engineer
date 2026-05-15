import 'package:flutter/material.dart';

class CarouselViewWidget extends StatelessWidget {
  final CarouselController carouselController;
  final double carouselItemExtend;

  const CarouselViewWidget({
    super.key,
    required this.carouselController,
    required this.carouselItemExtend,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: CarouselView(
        controller: carouselController,
        itemExtent: carouselItemExtend,
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
