import 'package:flutter/material.dart';
import 'package:product_list/presentation/product/product_screen.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    required this.title,
    required this.image,
    super.key,
  });
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: StyleText.title.copyWith(color: Colors.white),
          ),
          Expanded(
            child: Image.asset(
              image,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
