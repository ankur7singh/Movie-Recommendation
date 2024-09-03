import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recommendation/fightclub.dart';

class Medieval extends StatefulWidget {
  const Medieval({Key? key});

  @override
  State<Medieval> createState() => _MedievalState();
}

class _MedievalState extends State<Medieval> {
  var arrNames = [
    'Game of Thrones',
    'Gladiator',
    'Bahubali',
    'Lord of the Rings',
    'Vinland Saga',
    'House of the Dragon',
    'Vikings',
  ];
  var arrRating = [
    '9.2/10   2.3M Votes',
    '9.5/10   2.1M Votes',
    '8.7/10   81k Votes',
    '7.4/10   741k Votes',
    '9.1/10   515k Votes',
    '8.8/10   652k Votes',
    '8.5/10   585k Votes',
  ];
  var arrImages = [
    'https://assets.vogue.in/photos/5ce40baeb8031105d88f4b5c/1:1/w_1080,h_1080,c_limit/Game-Of-Thrones-Season-1-Recap.jpg',

    'https://www.thesun.co.uk/wp-content/uploads/2023/01/c7272c63-5c31-410f-b88f-a5d13d00a311.jpg',
    'https://i.pinimg.com/736x/5a/a4/84/5aa48452e3c9ed4f644d452c58b0bfac.jpg',
    'https://wallpaper.forfun.com/fetch/9f/9f9954eee8c28202a07b2a1f94e53df5.jpeg',
    'https://i0.wp.com/wallpapercave.com/wp/wp12270312.jpg?ssl=1',
    'https://i.pinimg.com/736x/ea/68/a9/ea68a9b59c7b161a91f0988d7e3e7f26.jpg',
    'https://i.pinimg.com/736x/ea/97/44/ea9744868074ec625fee03ce4cc4545d.jpg',
  ];

  int _currentSlideIndex = 0;



  List<Widget> _pages = [
    Fightclub(),
    Page2(),
    Page3(),
    Page4(),
    Page5(),
    Page6(),
    Page7(),
  ];
  var arrname = [
    'All',
    'Hollywood',
    'Anime',
    'Tv Show',
    'Bollywood',
  ];
  int selectedIndex = -1;

  bool _showMoreText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          margin: EdgeInsets.only(left: 12, right: 10, top: 30),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Medieval',
                    style: GoogleFonts.permanentMarker(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(arrImages[_currentSlideIndex]),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(),
            ),
          ),
          Container(
            color: Colors.transparent,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        margin: EdgeInsets.only(left: 12, top: 70),
                        child: Row(
                          children: List.generate(arrname.length, (index) {
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                      if (selectedIndex == index) {
                                        return Colors.black;
                                      } else {
                                        return Colors.transparent;
                                      }
                                    },
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Text(
                                  arrname[index],
                                  style: TextStyle(color: Colors.white,fontSize: 18),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 22, top: 19),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 30,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 19, left: 20),
                          child: Text(
                            arrRating[_currentSlideIndex],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: CarouselSlider.builder(
                          options: CarouselOptions(
                            height: 450,
                            autoPlay: false,
                            autoPlayInterval: const Duration(seconds: 3),
                            enlargeCenterPage: true,
                            enableInfiniteScroll: true,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentSlideIndex = index;
                              });
                            },
                          ),
                          itemCount: arrImages.length,
                          itemBuilder: (context, index, realIndex) {
                            return Card(
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              color: Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => _pages[index]),
                                  );
                                },
                                child: Hero(
                                  tag: 'background',
                                  child: CachedNetworkImage(
                                    imageUrl: arrImages[index],
                                    imageBuilder: (context, imageProvider) {
                                      return Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black, width: 1),
                                          borderRadius: BorderRadius.circular(40),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          arrNames[_currentSlideIndex],
                          style: GoogleFonts.satisfy(
                            fontSize: 45,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var image = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('Page 2')),
      body: Center(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: image,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Text('Page 2'),
          ],
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var image = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('Page 3')),
      body: Center(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: image,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Text('Page 3'),
          ],
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var image = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('Page 4')),
      body: Center(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: image,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Text('Page 4'),
          ],
        ),
      ),
    );
  }
}

class Page5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var image = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('Page 5')),
      body: Center(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: image,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Text('Page 5'),
          ],
        ),
      ),
    );
  }
}

class Page6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var image = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('Page 6')),
      body: Center(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: image,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Text('Page 6'),
          ],
        ),
      ),
    );
  }
}

class Page7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var image = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('Page 7')),
      body: Center(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: image,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Text('Page 7'),
          ],
        ),
      ),
    );
  }
}
