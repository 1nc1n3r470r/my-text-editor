import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class VerifyCarousel extends StatefulWidget {
  const VerifyCarousel({super.key});

  @override
  State<VerifyCarousel> createState() => _VerifyCarouselState();
}

class _VerifyCarouselState extends State<VerifyCarousel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<Widget> list = [const Text("1"), const Text("2"), const Text("3")];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Carousel with indicator controller demo')),
      body: Column(
        children: [
          Expanded(
            child: CarouselSlider(
              items: list,
              carouselController: _controller,
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: list.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
