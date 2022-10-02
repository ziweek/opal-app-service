import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:opal/widgets/MyNotionCard.dart';

class MyCarousel extends StatefulWidget {
  const MyCarousel({
    Key? key,
    required this.data,
  }) : super(key: key);
  final List data;

  @override
  State<MyCarousel> createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  late int _current = widget.data.length.toInt() - 1;
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _carouselController,
          itemCount: widget.data.length.toInt(),
          itemBuilder: (
            BuildContext context,
            int itemIndex,
            int pageViewIndex,
          ) =>
              AnimatedOpacity(
            opacity: 1,
            duration: Duration(milliseconds: 500),
            child: Container(
              child: MyNotionCard(
                image: 'assets/images/rainy.png',
                height: 10,
                content: [],
              ),
            ),
          ),
          options: CarouselOptions(
            initialPage: 0,
            disableCenter: true,
            // height: 100,
            // aspectRatio: 16 / 9,
            onPageChanged: (index, reason) {
              setState(() {
                // _current = index;
                _current = widget.data.length - index - 1;
              });
              print(_current);
            },
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            viewportFraction: 1,
            reverse: true,
          ),
        ),
        AnimatedOpacity(
          opacity: true ? 1 : 0,
          duration: Duration(milliseconds: 500),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.data.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => {
                  // _carouselController
                  //     .animateToPage(entry.key);
                  print(entry.key)
                },
                child: Container(
                  width: 6.0,
                  height: 6.0,
                  margin: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 4.0,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(
                      _current == entry.key ? 0.9 : 0.4,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
