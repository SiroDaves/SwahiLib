import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../model/general/general.dart';
import '../../theme/theme_colors.dart';

class PageTitle extends StatelessWidget {
  final String? label;
  final Size? size;

  const PageTitle({
    Key? key,
    required this.label,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size!.height * 0.087,
      child: Center(
        child: Text(
          label!,
          style: TextStyle(
            fontSize: size!.height * 0.0367,
            fontWeight: FontWeight.bold,
            color: ThemeColors.primary,
          ),
        ),
      ),
    );
  }
}

class PageSearch extends StatelessWidget {
  final String? label;
  final Size? size;
  final Function()? onTap;

  const PageSearch({
    Key? key,
    required this.label,
    required this.size,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size!.width * 0.608,
        height: size!.height * 0.0732,
        margin: EdgeInsets.symmetric(
          vertical: size!.height * 0.0146,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 3)],
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size!.height * 0.03,
          ),
          child: Row(
            children: [
              Text(
                label!,
                style: TextStyle(
                  fontSize: size!.height * 0.0367,
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.primary,
                ),
              ),
              const Spacer(),
              const Icon(Icons.search, color: ThemeColors.primary),
            ],
          ),
        ),
      ),
    );
  }
}

class SupportUsCarousel extends StatelessWidget {
  final double? height;
  final Function()? onTapSlide1;
  final Function()? onTapSlide2;

  const SupportUsCarousel({
    Key? key,
    this.height,
    this.onTapSlide1,
    this.onTapSlide2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<HomeSlider>? sliders = [
      HomeSlider(1, "assets/images/tshirts.jpg",
          "SUPPORT US.\nOrder, Our Merchandise"),
      HomeSlider(2, "assets/images/donate.jpg",
          "Donate Today or even Monthly.\n SUPPORT US"),
    ];

    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 5.0,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        initialPage: 0,
        autoPlay: true,
      ),
      items: sliders.map((slider) {
        return Builder(
          builder: (BuildContext context) {
            return Hero(
              tag: 'CarouselIndex_${slider.title}',
              child: GestureDetector(
                onTap: () {
                  if (slider.id == 1) {
                    onTapSlide1;
                  } else {
                    onTapSlide2;
                  }
                },
                child: Card(
                  elevation: 2,
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: height! * 0.227,
                        padding: EdgeInsets.all(height! * 0.007),
                        child: Text(
                          slider.title,
                          maxLines: 3,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: height! * 0.025,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Image.asset(
                        slider.image,
                        height: height! * 0.146,
                        width: height! * 0.242,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
