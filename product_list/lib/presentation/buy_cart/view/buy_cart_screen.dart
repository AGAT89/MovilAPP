import 'package:flutter/material.dart';
import 'package:product_list/presentation/product/model/product.dart';

import '../widgets/floating_total.dart';
import '../widgets/shopping_cart_list.dart';

class BuyCartScreen extends StatelessWidget {
  const BuyCartScreen({
    required this.products,
    required this.total,
    super.key,
  });

  final List<Product> products;
  final double total;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green.shade400,
        title: Text(
          'Carrito de compras',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (products.isNotEmpty) ...[
            ShoppingCartList(
              products: products,
            ),
            FloatingTotal(
              total: total,
            ),
          ] else
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Text(
                  'Agregue una cantidad al carrito',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            )
        ],
      ),
    );
  }
}
