import 'package:flutter/material.dart';
import 'package:product_list/presentation/product/product_screen.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    required this.products,
    super.key,
  });

  final List<Map<String, dynamic>> products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.asset(
                    product['image'],
                    width: 64,
                    height: 64,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product['name'],
                          style: StyleText.body1,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          product['brand'],
                          style: textStyle.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    product['price'],
                    style: StyleText.body1.copyWith(color: Colors.green),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
