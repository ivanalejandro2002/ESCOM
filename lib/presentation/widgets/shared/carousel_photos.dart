import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
List<String> imgList = [
  'https://pbs.twimg.com/media/F2Y27FdXQAElrik?format=jpg&name=4096x4096',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTD4XqaDxwrEHl8I1hiW0QrNg5wuS0e_uA_yQ&s',
  'https://upload.wikimedia.org/wikipedia/commons/b/b4/EscomIPNchmr.jpg'
];
List<String> legendPhotos = [
  'Fundación',
  'Logo',
  'Entrada'
];


final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          legendPhotos[imgList.indexOf(item)],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class CarouselPhotos extends StatelessWidget {
  const CarouselPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      items: imageSliders,
    );
  }
}