import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/custom_text_filed.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class UpdateProductService extends StatefulWidget {
  const UpdateProductService({super.key});
  static String id = 'UpdateProduct';

  @override
  State<UpdateProductService> createState() => _UpdateProductServiceState();
}

class _UpdateProductServiceState extends State<UpdateProductService> {
  String? productName, description, image, category;

  String? price;
  bool isLoading = false;
  Future<void> updateProduct(
      {String? productName,
      String? description,
      String? price,
      String? image,
      String? category, required int id}) async {
    // Add your update product logic here
  }

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Center(child: Text(UpdateProductService.id)),
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 150),
                CustomTextFiled(
                    onChanged: (data) {
                      productName = data;
                    },
                    title: 'product  name'),
                const SizedBox(height: 20),
                CustomTextFiled(
                    onChanged: (data) {
                      description = data;
                    },
                    title: 'description'),
                const SizedBox(height: 20),
                CustomTextFiled(
                    inputType: TextInputType.number,
                    onChanged: (data) {
                      price = data;
                    },
                    title: 'price'),
                const SizedBox(height: 20),
                CustomTextFiled(
                    onChanged: (data) {
                      image = data;
                    },
                    title: 'image'),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.all(16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () async {
                      isLoading = true;
                      setState(() {});
                      try {
                        await updateProducts(product);
                        print('success');
                      } catch (e) {
                        print(e.toString());
                      }
                      isLoading = false;
                      setState(() {});
                    },
                    child: const Text(
                      'Update Product',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProducts(ProductModel product) async {
    await updateProduct(
      id:product.id,
      productName: productName == null ? product.title : productName!,
      price: price == null ? product.price.toString() : price!,
      description: description == null ? product.description : description!,
      image: image == null ? product.image : image!,
      category: product.category,
    );
  }
}
