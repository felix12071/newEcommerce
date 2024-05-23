import 'dart:convert';
import 'package:caproject_ecommerce_app/components/productcontroller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:caproject_ecommerce_app/models/shoe.dart';
import 'package:flutter/foundation.dart';

ProductController productController = Get.put(ProductController());

class Cart extends ChangeNotifier {

  // List of shoes for sale
  List<Shoe> shoeShop = [];

  // Method to fetch shoe data from API

  // List of items in user cart
  List<Shoe> userCart = [];

  // Get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // Get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // Add items to cart
  void addItemsToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // Remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();

    // Method to fetch shoe data from API
  }
  Future<void> fetchShoes() async {
    try {
      final response = await http.get(
          Uri.parse('http://www.nattiee.com/ecom/getproducts.php'));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(
            response.body)['products'];
        shoeShop = responseData.map((data) => Shoe.fromJson(data)).toList();
        notifyListeners(); // Notify listeners after updating the data
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

}