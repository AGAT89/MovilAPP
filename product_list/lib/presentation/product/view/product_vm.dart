import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/product.dart';

class ProductViewModel extends ChangeNotifier {
  ProductViewModel() {
    initState();
  }

  final ScrollController scrollController = ScrollController();
  final List<Product> _products = [];
  bool hasStockIssues = false;
  bool hasMoreProducts = true;
  bool isLoading = false;
  int page = 1;
  final int pageSize = 5;

  List<Product> get products => _products;

  void initState() {
    getListProducts();
    scrollController.addListener(_scrollListener);
  }

  Future<void> getListProducts() async {
    if (!hasMoreProducts || isLoading) return;

    isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse(
          'https://shop-api-roan.vercel.app/product?page=$page&pageSize=$pageSize'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);

        if (data.isEmpty || data.length < pageSize) {
          hasMoreProducts = false;
        }

        _products.addAll(
          data.map((product) => Product.fromJson(product)).toList(),
        );
      } else {
        log('Error: Falló la carga de productos con código ${response.statusCode}');
      }
    } catch (error) {
      log('Error en la solicitud de productos: $error');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void _scrollListener() {
    if (_isEndOfPage() && hasMoreProducts) {
      pageNext();
    }
  }

  bool _isEndOfPage() {
    return scrollController.position.pixels ==
        scrollController.position.maxScrollExtent;
  }

  void pageNext() {
    page++;
    getListProducts();
  }

  void incrementQuantity(Product product) {
    product.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(Product product) {
    if (product.quantity > 0) {
      product.quantity--;
      notifyListeners();
    }
  }

  void onPressedAdd() {
    hasStockIssues =
        products.any((product) => product.quantity > product.stock);
    notifyListeners();
  }

  double totalSum() {
    return _products.fold(
      0.0,
      (sum, product) => sum + product.price * product.quantity,
    );
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }
}
