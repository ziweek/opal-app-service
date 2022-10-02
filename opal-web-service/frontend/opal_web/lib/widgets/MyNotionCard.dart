import 'package:flutter/material.dart';

class MyNotionCard extends StatelessWidget {
  const MyNotionCard({
    Key? key,
    required this.image,
    // required this.width,
    required this.height,
    required this.content,
  }) : super(key: key);
  final String image;
  // final double width;
  final double height;
  final List<Widget> content;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        // alignment: AlignmentDirectional.bottomStart,
        children: [
          Image.asset(
            image,
            height: height * 0.7,
            // width: width,
            fit: BoxFit.cover,
          ),
          Stack(
            children: [
              Container(
                // width: width,
                height: height * 0.3,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: content,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
