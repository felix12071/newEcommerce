import 'package:get/get.dart';

class ProductController extends GetxController {
  var productList = [].obs;
  updateProductList(list){
    productList.value = list;
    print('Product list updated: $list');
  }
}