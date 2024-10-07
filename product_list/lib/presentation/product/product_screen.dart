import 'package:flutter/material.dart';
import 'package:product_list/components/image_container.dart';
import 'package:product_list/components/product_container.dart';

const String font = 'Poppins';

const TextStyle textStyle = TextStyle(
  fontFamily: font,
  color: Colors.black87,
);
const double _display16Size = 16;
const double _display25Size = 25;

abstract class StyleText {
  static TextStyle body1 = textStyle.copyWith(
    fontSize: _display16Size,
    fontWeight: FontWeight.w800,
  );
  static TextStyle title = textStyle.copyWith(
    fontSize: _display25Size,
    fontWeight: FontWeight.w800,
  );
}

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    super.key,
  });

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {
        'name': 'Arroz',
        'brand': 'Costeño 1kg',
        'price': 'S/ 5.00',
        'image': 'assets/img/arroz.jpeg',
      },
      {
        'name': 'Azúcar',
        'brand': 'Cartavio 1kg',
        'price': 'S/ 4.80',
        'image': 'assets/img/azucar.jpeg',
      },
      {
        'name': 'Aceite',
        'brand': 'Primor 1L',
        'price': 'S/ 9.90',
        'image': 'assets/img/aceite.jpeg',
      },
      {
        'name': 'Lente',
        'brand': 'Lente 1Kg',
        'price': 'S/ 8.90',
        'image': 'assets/img/lenteja.jpeg',
      },
      {
        'name': 'Frijol',
        'brand': 'frijol 1Kg',
        'price': 'S/ 10.00',
        'image': 'assets/img/frijol.jpeg',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Bodega Digital',
          style: StyleText.body1,
        ),
      ),
      body: Column(
        children: [
          const ImageContainer(
            title: 'Lista de productos',
            image: 'assets/img/market.png',
          ),
          ProductContainer(
            products: products,
          )
        ],
      ),
    );
  }
}
