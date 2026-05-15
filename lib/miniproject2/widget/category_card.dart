import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String image;
  const CategoryCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(4),
      height: 56,
      width: 121,
      decoration: BoxDecoration(
        color: Color(0xFFDFF1E6),
        borderRadius: .circular(50),
      ),
      child: Row(
        spacing: 8,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              shape: OvalBorder(),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: const Color(0xFF505050),
              fontSize: 15,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
