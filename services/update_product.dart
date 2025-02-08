import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';
// ignore_for_file: missing_required_param

class UpdateProduct {
  Future<ProductModel> updateProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
    required int id,
  }) async {
    print('product id: $id');
    Map<String, dynamic> data = await Api().put(
        url: 'https://fakestoreapi.com/products/:$id',
        body: {
          'title': title,
          'price': price,
          'description': description,
          'image': image,
          'category': category,
        },
        token: '');
    return ProductModel.fromJson(data);
  }
}
