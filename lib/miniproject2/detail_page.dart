import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  final String title;
  final String description;
  final String image;
  final String rating;
  final bool isFavorite;
  final VoidCallback onClickFavorite; // ini mirip lambda onClick di kotlin, buat passing fungsi dari parent widget

  const DetailPage({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.rating,
    required this.isFavorite,
    required this.onClickFavorite,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late bool isFavorite; // ini state buat nyimpen status favorite, biar bisa diubah di DetailPage tanpa harus langsung ngubah di ProductCard

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite; // inisialisasi state dengan nilai dari constructor
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
    widget.onClickFavorite(); // panggil fungsi yang dipassing dari parent widget (ProductCard) buat ngubah status favorite di ProductCard
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: .start,
        children: [
          Stack(
            children: [
              Container(
                width: .infinity,
                height: 319,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: .circular(10),
                    bottomRight: .circular(10),
                  ),
                ),
              ),

              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: ClipRRect(
                          borderRadius: .circular(30),
                          child: BackdropFilter(
                            filter: .blur(sigmaX: 4, sigmaY: 4),
                            child: Container(
                              padding: .all(10),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.3),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.arrow_back_ios_new, size: 15),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: toggleFavorite,
                        child: ClipRRect(
                          borderRadius: .circular(30),
                          child: BackdropFilter(
                            filter: .blur(sigmaX: 4, sigmaY: 4),
                            child: Container(
                              padding: .all(8),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.3),
                                shape: BoxShape.circle,
                              ),
                              child: isFavorite
                                  ? Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 20,
                                    )
                                  : Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(36),
            child: Column(
              crossAxisAlignment: .start,
              spacing: 8,
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontWeight: .w600,
                        fontSize: 24,
                        fontFamily: GoogleFonts.quicksand().fontFamily,
                      ),
                    ),
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
                  ],
                ),
                Text(
                  widget.description,
                  style: TextStyle(
                    fontFamily: GoogleFonts.quicksand().fontFamily,
                    fontWeight: .w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
