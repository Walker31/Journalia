import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  CarouselState createState() => CarouselState();
}

final List<String> imagePaths = [];
late List<Widget> _pages;
int _activePage = 0;

final PageController _pageController = PageController(initialPage: 0);

class CarouselState extends State<Carousel> {
  @override
  void initState() {
    super.initState();
    _pages = List.generate(imagePaths.length,
        (index) => ImagePlaceHolder(imagePath: imagePaths[index]));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 4,
                child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        _activePage = value;
                      });
                    },
                    controller: _pageController,
                    itemCount: imagePaths.length,
                    itemBuilder: (context, index) {
                      //return image variable
                      return _pages[index];
                    })),
            //code for page Indicator
            Positioned(
              bottom: 10,
              right: 0,
              left: 0,
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                      _pages.length,
                      (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: InkWell(
                              onTap: (){
                              _pageController.animateToPage(index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                              },
                              child: CircleAvatar(
                                radius: 4,
                                backgroundColor: _activePage == index
                                    ? Colors.indigo
                                    : Colors.grey,
                              ),
                            ),
                          )),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class ImagePlaceHolder extends StatelessWidget {
  final String? imagePath;
  const ImagePlaceHolder({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset('', fit: BoxFit.cover);
  }
}
