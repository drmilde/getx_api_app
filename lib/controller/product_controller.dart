import 'package:get/get.dart';
import 'package:getx_api_app/model/product.dart';
import 'package:getx_api_app/services/remote_services.dart';

class ProductController extends GetxController{
  var productList = List<Product>.empty().obs;

  @override
  void onInit() {
    super.onInit();
    //fetchProducts();
    fetchProductsFromAssets();
  }

  void fetchProducts() async {
    var products = await RemoteServices.fetchProducts();
    productList.value = products;
  }

  void fetchProductsFromAssets() async {
    var products = await RemoteServices.fetchProductsFromAssets();
    productList.value = products;
  }

}