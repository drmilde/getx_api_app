import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:getx_api_app/controller/product_controller.dart';
import 'package:getx_api_app/widgets/product_tile.dart';
import 'package:getx_api_app/widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
      ),
      body: Column(
        children: [
          Container(
            child: TextWidget("Hier werden die Daten der Anwendung geladen."
                " Acuh hier wird asynchron gearbeitet und die Daten in einem"
                " GetxController als Observable abgelegt."),
          ),
          Expanded(
            child: Obx(() => buildStaggeredGridView()),
          )
        ],
      ),
    );
  }

  Widget buildStaggeredGridView() {
    return StaggeredGridView.countBuilder(
      itemCount: productController.productList.length,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      crossAxisCount: 2,
      itemBuilder: (context, index) {
        return ProductTile(productController.productList[index]);
      },
      staggeredTileBuilder: (fit) {
        return StaggeredTile.fit(1);
      },
    );
  }
}
