import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recommendation/fightclub.dart';

class Art extends StatefulWidget {
  const Art({Key? key});

  @override
  State<Art> createState() => _ArtState();
}

class _ArtState extends State<Art> {
  var arrNames = [
    'Your Name',
    'Interstellar',
    'Masaan',
    'Dune',
    'Hyouka',
    'La La Land',
    'Kota Factory',
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
    'https://wallpapers.com/images/featured/your-name-p8m6aof3en8atk8i.jpg',
    'https://w0.peakpx.com/wallpaper/982/511/HD-wallpaper-interstellar-nolan-thumbnail.jpg',
    'https://lh4.googleusercontent.com/proxy/JqMSdNRnG0EZJFSTMbSoFDCcEYtwhWP85p7TV_uZ7XRwqA4ehR2JJk6wxdx7h1h3lKvbGMVA1QU86DYwFqDcC73y71WiPpYJcU562JcP',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKvbUSbv0Laeehh2G4Ghti1-qspHTgVlLfsT-93ak_RQ&s',
    'https://i.redd.it/f1943h6w3t131.jpg',
    'https://i.pinimg.com/736x/b1/fb/33/b1fb33ffce4c8a1fff4edfaee68692d4.jpg',
    'https://www.koimoi.com/wp-content/new-galleries/2019/05/kota-factory-review-the-new-tvf-web-series-is-as-magical-as-it-gets-0001.jpg',
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
          margin: EdgeInsets.only(left: 12, right: 90, top: 30),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Art',
                    style: GoogleFonts.permanentMarker(
                      fontSize: 33,
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







                    // Additional text to be revealed
                    // SizedBox(height:20 ,),
                    // GestureDetector(
                    //   onTap: () {
                    //     setState(() {
                    //       _showMoreText = !_showMoreText;
                    //     });
                    //   },
                    //   child: Container(
                    //     margin: EdgeInsets.only(left: 40),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       children: [
                    //         Text(
                    //           'Also In',
                    //           style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    //         ),
                    //         Icon(
                    //           _showMoreText ? Icons.keyboard_arrow_left : Icons.keyboard_arrow_right,
                    //           color: Colors.white,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // if (_showMoreText) // Conditionally show the additional text
                    //   Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    //     child: Text(
                    //       arrSyno[_currentSlideIndex],
                    //       style: TextStyle(color: Colors.white),
                    //       textAlign: TextAlign.center,
                    //     ),
                    //   ),
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