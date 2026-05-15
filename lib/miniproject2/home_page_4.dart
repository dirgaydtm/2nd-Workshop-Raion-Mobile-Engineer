import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workshop_1/miniproject/widget/carousel_view_widget.dart';
import 'package:workshop_1/miniproject/widget/category_card.dart';
import 'package:workshop_1/miniproject/widget/page_view_widget.dart';
import 'package:workshop_1/miniproject/widget/product_card.dart';

class HomePage4 extends StatefulWidget {
  const HomePage4({super.key});

  @override
  State<HomePage4> createState() => _HomePage4State();
}

class _HomePage4State extends State<HomePage4> {
  late PageController _pageController;
  late CarouselController _carouselController;
  final double _carouselItemExtend = 300;
  int pageCount = 5;
  int _pageViewPage = 0;
  int _carouselPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _carouselController = CarouselController();
    _carouselController.addListener(() {
      setState(() {
        _carouselPage = (_carouselController.offset / _carouselItemExtend)
            .round();
      });
    });
    _pageController.addListener(() {
      setState(() {
        _pageViewPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _carouselController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          "Explore",
          style: TextStyle(
            color: const Color(0xFF007E2F),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const .only(left: 20, right: 20, bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .start,
            spacing: 20,
            children: [
              Padding(
                padding: const .only(top: 15.0),
                child: TextField(
                  decoration: InputDecoration(

                    // [INI BUAT ICON SEARCH NYA]
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        top: 10,
                        bottom: 10,
                        right: 10,
                      ),
                      child: Image.asset('assets/icons/search.png', width: 18),
                    ),

                    // [INI BUAT HINT TEXT NYA]
                    hintText: 'Search..',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: .w800,
                      color: Color(0xFF939393),
                    ),

                    // [INI BUAT TIPE BORDER UMUM BUAT SEMUA KONDISI]
                    border: OutlineInputBorder(borderRadius: .circular(30)),

                    // [INI BUAT TIPE BORDER  KALO LAGI GA NGAPA NGAPAIN]
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF505050),
                        width: 0.1,
                      ),
                      borderRadius: .circular(30),
                    ),

                    contentPadding: .zero,
                  ),
                ),
              ),

              // [INI BUAT YANG PENGEN NYOBA TIPE CAROUSEL]
              CarouselViewWidget(
                carouselController: _carouselController,
                carouselItemExtend: _carouselItemExtend,
              ),

              // INI DOT INDICATOR BUAT CAROUSEL
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 6,
                children: List.generate(
                  pageCount,
                  (index) => Container(
                    width: 6,
                    height: 6,
                    decoration: ShapeDecoration(
                      color:
                          _carouselPage ==
                              index // kalo index sama dengan page yang aktif, warnanya hijau, kalo engga abu abu
                          ? Color(0xFF007E2F)
                          : Color(0xFFD9D9D9),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
              ),

              // [INI BUAT YANG PENGEN NYOBA TIPE PAGE VIEW]
              PageViewWidget(pageController: _pageController),

              // INI DOT INDICATOR BUAT PAGE VIEW
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 6,
                /*
                  List.generate itu buat generate widget sebanyak pageCount, 
                  terus index itu buat ngecek page yang aktif.
                  Semacam loop gitu tapi buat widget.
                */
                children: List.generate( 
                  pageCount, // jumlah widget yg mau dibuat
                  (index) => Container(
                    width: 6,
                    height: 6,
                    decoration: ShapeDecoration(
                      color:
                          _pageViewPage ==
                              index // kalo index sama dengan page yang aktif, warnanya hijau, kalo engga abu abu
                          ? Color(0xFF007E2F)
                          : Color(0xFFD9D9D9),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
              ),

              Text(
                'Categories',
                style: TextStyle(
                  fontWeight: .w500,
                  fontSize: 16,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),

              // [KATEGORI]
              SingleChildScrollView(
                scrollDirection: .horizontal,
                child: Row(
                  spacing: 5,
                  children: [
                    CategoryCard(
                      title: 'Fruits',
                      image: 'assets/images/fruits.png',
                    ),
                    CategoryCard(
                      title: 'Grains',
                      image: 'assets/images/grains.png',
                    ),
                    CategoryCard(
                      title: 'Herbs',
                      image: 'assets/images/herbs.png',
                    ),
                  ],
                ),
              ),

              Text(
                'Browse Products',
                style: TextStyle(fontWeight: .w500, fontSize: 16),
              ),

              // INI GRIDVIEW BUAT TAMPILIN PRODUKNYA
              // Pake row biasa juga boleh, tapi kalo gridview bisa lebih rapi dan gampang buat nampilin banyak produk
              GridView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  mainAxisExtent: 280,
                ),
                children: [
                  ProductCard(
                    title: 'Berries',
                    description: 'Berries is a sweet fruit with red color.',
                    image: 'assets/images/berries.png',
                    rating: '4.5 (200)',
                    isFavorite: false,
                  ),
                  ProductCard(
                    title: 'Tulsi',
                    description: 'Leaf of berries is very green and fresh.',
                    image: 'assets/images/tulsi.png',
                    rating: '4.9 (324)',
                    isFavorite: false,
                  ),
                  ProductCard(
                    title: 'Milk',
                    description: 'Milk is a white liquid produced by mammals.',
                    image: 'assets/images/milk.png',
                    rating: '4.5 (672)',
                    isFavorite: false,
                  ),
                  ProductCard(
                    title: 'Tomato',
                    description: 'Is tomato a fruit or a vegetable?',
                    image: 'assets/images/tomato.png',
                    rating: '4.9 (324)',
                    isFavorite: false,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
