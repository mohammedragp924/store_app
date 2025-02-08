import 'package:store_app/helper/api.dart';
// ignore_for_file: missing_required_param


class AllCategoriesServices {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories', token: '');

    return data;
  }
}
