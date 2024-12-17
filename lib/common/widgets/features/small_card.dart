import 'package:flutter/material.dart';

import '../../../core/theme/theme_colors.dart';

class SmallCard extends StatelessWidget {
  final String cardName;
  final String image;
  final void Function()? onTap;

  const SmallCard({
    super.key,
    required this.cardName,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 1,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          height: size.width / 2.1,
          child: Card(
            elevation: 0,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  height: size.width / 3,
                  width: size.width / 3,
                ),
                Text(
                  cardName,
                  style: const TextStyle(
                    fontSize: 15,
                    color: ThemeColors.blackText,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PayCardx extends StatelessWidget {
  final String cardName;
  final String image;
  final void Function()? onTap;
  final double height;
  final bool isSelected;

  const PayCardx({
    super.key,
    required this.cardName,
    required this.image,
    this.onTap,
    this.height = 0,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? Colors.white : Colors.black,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          height: height != 0 ? height : size.width / 2.1,
          child: Card(
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            color: isSelected ? ThemeColors.primary : Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  height: height - 40,
                ),
                Text(
                  cardName,
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
