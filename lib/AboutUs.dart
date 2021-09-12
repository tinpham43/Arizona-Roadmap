import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AboutUs extends StatelessWidget {
  //Container for each Dev member

  //Javanshir Pashayev
  final Widget titleOne = Container(
    padding: const EdgeInsets.all(32),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            'Javanshir Pashayev',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          'I am an Informatics major that loves traveling across the world. '
          'The outdoors are where I grew up and where I spend most of my time. '
          'I like to play guitar and exercise whenever I can. Driving has always '
          'been a passion of mine and I hope to bring something unique into this '
          'world through it.',
          style: TextStyle(
            color: Colors.grey[500],
          ),
        ),
      ],
    ),
  );

//Markus Valvur
  final Widget titleTwo = Container(
    padding: const EdgeInsets.all(32),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /*2*/
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            'Markus Valvur',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          'I am a computer science student who has a wide range of interests and passions. '
          'Throughout my life I have loved technology and also loved seeing the advancements '
          'in that technology. In addition to this, I love sports and doing anything that '
          'keeps me active such as hiking or working out.',
          style: TextStyle(
            color: Colors.grey[500],
          ),
        ),
      ],
    ),
  );

//Tin Pham
  final Widget titleThree = Container(
    padding: const EdgeInsets.all(32),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /*2*/
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            'Tin Pham',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          'I am a computer Science Major who loves coding and trying new technologies.',
          style: TextStyle(
            color: Colors.grey[500],
          ),
        ),
      ],
    ),
  );

  //Dina Bataq
  final Widget titleFour = Container(
    padding: const EdgeInsets.all(32),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            'Dina Bataq',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          'I am a computer science major who loves traveling. I love how technology makes '
          'discovering new places possible and easy. I love hiking and playing basketball. ',
          style: TextStyle(
            color: Colors.grey[500],
          ),
        ),
      ],
    ),
  );

  //about us section
  /* Widget textSection = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'About the Arizona RoadMap app',
      softWrap: true,
    ),
  );*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About Us')),
      body: Column(
        children: [
          // textSection,
          titleOne,
          titleTwo,
          titleThree,
          titleFour,
        ],
      ),
    );
  }
}
