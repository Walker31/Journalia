import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  CarouselState createState() => CarouselState();
}

class CarouselState extends State<Carousel> {
  final String buildingPath = 'assets/Buildings/B1_top.png';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250, // Adjust the height to fit within the parent constraints
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return BuildingListTile(
            imagePath: buildingPath,
            title: 'Building ${index + 1}',
            index: index,
          );
        },
      ),
    );
  }
}

class BuildingListTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final int index;

  const BuildingListTile({
    required this.imagePath,
    required this.title,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, // Set a width for the container to ensure proper horizontal scrolling
      margin: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: index.isEven
            ? [
                Text(title, textAlign: TextAlign.center),
                const SizedBox(height: 10),
                Image.asset(imagePath, height: 100, width: 100, fit: BoxFit.cover),
              ]
            : [
                Image.asset(imagePath, height: 100, width: 100, fit: BoxFit.cover),
                const SizedBox(height: 10),
                Text(title, textAlign: TextAlign.center),
              ],
      ),
    );
  }
}
