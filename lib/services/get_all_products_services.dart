import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';
// ignore_for_file: missing_required_param


class AllProductsServices {
  Future<List<ProductModel>> getAllProducts() async {
      List<dynamic> data   = await Api().get(url: 'https://fakestoreapi.com/products', token: '');
      List<ProductModel> productsList = [];
      for (int i = 0; i < data.length; i++) {
        productsList.add(
          ProductModel.fromJson(data[i]),
        );
      }
      return productsList;
    
  }
}
