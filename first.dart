import 'package:flutter/material.dart';
import 'package:recommendation/basic_catagories.dart';
import 'package:recommendation/medieval.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:google_fonts/google_fonts.dart';

import 'art.dart';
import 'badass.dart';
import 'depressing.dart';
import 'inside.dart';

class AlternatingPage extends StatefulWidget {
  @override
  State<AlternatingPage> createState() => _AlternatingPageState();
}

class _AlternatingPageState extends State<AlternatingPage> {
  var arrimages = [
    'https://steamuserimages-a.akamaihd.net/ugc/1016067628656126735/DDC973F0E54452551ED5266EE61227C55C354066/?imw=5000&imh=5000&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3fgUVDXzsuOOp8Q37UeDBBFOjzuxb6az6xOZWSEFelw&s',
    'https://m.media-amazon.com/images/M/MV5BMGQ1ZGZmNTAtM2MyYi00NmZhLTkwYmYtNTNlZDRhMzU2ZTgwXkEyXkFqcGdeQW1yb3NzZXI@._V1_QL75_UX500_CR0,0,500,281_.jpg',
    'https://akm-img-a-in.tosshub.com/indiatoday/images/media_bank/202308/brad-pitt-222626-16x9.jpg?VersionId=8vuIa1kwJqTsLf9OTiG3d7EqOBMHwYhi&size=690:388',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4H40zA5W7nWlZv5ME0FZbdfuyD2VueqripvXiHM-3Ag&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5C9mHf_OPMY6i2P82TvFo4O1gBaT7oLD2uMhYlrDhmg&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSj_LSNJI3IDINerCQvN5RPAUlODIHb3E8-L7wnG-nJiw&s',
    'https://static1.colliderimages.com/wordpress/wp-content/uploads/2021/08/Attack-on-Titan-Season-4-eren-1.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRdur7MGPBwHfjAxZ4CiUZwhvAC5ZbxqIlTAbZS531SwYfUg0TQILGqQLgZEvSh_mw9U8&usqp=CAU',
    'https://i.ytimg.com/vi/MVYUiZNt4Ok/maxresdefault.jpg',
  ];
  var arrnames = [
    'Art',
    'Badass Main Character',
    'Depressing',
    'Unexpected Twist',
    'Franchises',
    'Medieval',
    'Philosophical',
    'Well Built Story',
    'One Season Wonder',
    'Satisfying Ending',
  ];

  var arrname = [
    'All',
    'Basic Categories',
    'Actor',
    'Director'
  ];

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black87,
        title: Container(
          margin: EdgeInsets.only(top: 15),
          child: GradientText(
            'Pick Your Mood',
            style: GoogleFonts.satisfy(
              fontSize: 35,
              fontWeight: FontWeight.w600,
            ),
            colors: [
              Colors.grey.shade700,
              Colors.white,
            ],
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: IconButton(
              icon: Icon(Icons.search, size: 35, color: Colors.white70,),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.grey.shade900,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: EdgeInsets.only(left: 13),
                child: Row(
                  children: List.generate(arrname.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (selectedIndex == index) {
                                return Colors.grey.shade800;
                              } else {
                                return Colors.grey.shade600;
                              }
                            },
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            selectedIndex = index;
                          });
                          // _navigateToPages(context, index);
                        },
                        child: Text(
                          arrname[index],
                          style: TextStyle(color: Colors.white70,fontSize: 18),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: List.generate(arrimages.length, (index) {
                  return _buildSection(
                    title: arrnames[index],
                    color: Colors.grey.shade800,
                    image: arrimages[index],
                    page: index,
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required Color color,
    required String image,
    required int page,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.only(left: 30),
          child: GradientText(
            title,
            style: GoogleFonts.satisfy(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            colors: [
              Colors.grey.shade700,
              Colors.white,
            ],
          ),
        ),
        SizedBox(height: 1),
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey.shade900,
                    border:  Border(
                      bottom: BorderSide(width: 6, color: Colors.grey.shade800),
                      left: BorderSide(width: 6, color: Colors.grey.shade800),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        color: color,
                        alignment: Alignment.center,
                        child: Image.network(
                          image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,

                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 13.5,
                  right: 8,
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        colors: [
                          Colors.grey.shade800,
                          Colors.blueGrey.shade900,
                        ],
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        _navigateToPage(page);
                      },
                      child: Text(
                        'Explore',
                        style: TextStyle(color: Colors.white70, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 32),
      ],
    );
  }

  void _navigateToPage(int page) {
    switch (page) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => Art()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => Badass()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => Depressing()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => Inside()));
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (context) => Inside()));
        break;
      case 5:
        Navigator.push(context, MaterialPageRoute(builder: (context) => Medieval()));
        break;
      default:
        break;
    }
  }
  // void _navigateToPages(BuildContext context, int page) {
  //   switch (page) {
  //     case 0:
  //       break;
  //     case 1:
  //       Navigator.push(context, MaterialPageRoute(builder: (context) => Baca()));
  //       break;
  //     case 2:
  //       Navigator.push(context, MaterialPageRoute(builder: (context) => Depressing()));
  //       break;
  //     case 3:
  //       Navigator.push(context, MaterialPageRoute(builder: (context) => Inside()));
  //       break;
  //     case 4:
  //       Navigator.push(context, MaterialPageRoute(builder: (context) => Inside()));
  //       break;
  //     case 5:
  //       Navigator.push(context, MaterialPageRoute(builder: (context) => Medieval()));
  //       break;
  //     default:
  //       break;
  //   }
  // }
}


class TwistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Twist Page')),
      body: Center(child: Text('Twist Page')),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AlternatingPage(),
  ));
}


