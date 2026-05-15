import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workshop_1/miniproject/detail_page.dart';

class ProductCard extends StatefulWidget {
  final String title;
  final String description;
  final String image;
  final String rating;
  final bool isFavorite;

  const ProductCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.rating,
    required this.isFavorite,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late bool isFavorite; // ini state buat nyimpen status favorite

  @override
  void initState() {
    super.initState();
    isFavorite =
        widget.isFavorite; // inisialisasi state dengan nilai dari constructor
  }

  void toggleFavorite() {
    // fungsi buat toggle status favorite
    // bakalan rebuild widget setiap kali isFavorite berubah
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              title: widget.title,
              description: widget.description,
              image: widget.image,
              rating: widget.rating,
              isFavorite: isFavorite,

              // passing fungsi toggleFavorite ke DetailPage
              // mirip lambda onClick kalo di kotlin
              onClickFavorite: () => toggleFavorite(),
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Stack(
            alignment: .topRight,
            children: [
              Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: .circular(30),
                ),
              ),

              Positioned(
                right: 12,
                top: 12,
                child: GestureDetector(
                  /*
                   toggle status favorite saat icon di tap. 
                   Sama kayak onClickFavorite: () => toggleFavorite() di atas
                  */
                  onTap: () => toggleFavorite(),

                  child: ClipRRect(
                    borderRadius: .circular(30),
                    child: BackdropFilter(
                      filter: .blur(sigmaX: 2, sigmaY: 2),
                      child: Container(
                        padding: .all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.4),
                          shape: BoxShape.circle,
                        ),
                        child:
                            isFavorite // tampilkan icon merah kalo favorit, kalo engga putih aja
                            ? Icon(Icons.favorite, color: Colors.red, size: 20)
                            : Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                                size: 20,
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 12),

          Text(
            widget.title,
            style: TextStyle(
              color: const Color(0xFF505050),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 6),

          Row(
            spacing: 4,
            children: [
              Icon(Icons.star, color: Colors.yellow[700], size: 16),

              RichText(
                text: TextSpan(
                  text: widget.rating.substring(0, 3),
                  style: TextStyle(
                    color: const Color(0xFF505050),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: widget.rating.substring(3),
                      style: TextStyle(
                        color: const Color(0xFF939393),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 6),

          Text(
            widget.description,
            maxLines: 2,
            style: TextStyle(
              fontFamily: GoogleFonts.quicksand().fontFamily,
              color: const Color(0xFF939393),
              fontSize: 14,
              fontWeight: FontWeight.w600,
              overflow: .ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
