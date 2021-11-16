import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_app/controller/product_controller.dart';
import 'package:getx_api_app/model/product.dart';
import 'package:getx_api_app/screens/warenkorb_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductController controller = Get.find();
  int index;

  ProductDetailsScreen(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Product product = controller.productList[index];
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WarenkorbScreen()));
                      },
                      child: Text(
                        "Warenkorb",
                        style: GoogleFonts.lato(fontSize: 32),
                      ),
                    ),
                    Obx(() {
                      return Text(
                        "\$ ${controller.summe.toStringAsFixed(2)}",
                        style: GoogleFonts.lato(fontSize: 32),
                      );
                    })
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 300,
                          width: double.infinity,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Image.network(
                            product.image!,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      _showTitle(product),
                      _showDescription(product),
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _showRating(product),
                            Text(
                              '\$${product.price}',
                              style:
                                  TextStyle(fontSize: 32, fontFamily: 'avenir'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 64,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.addWarenkorb(controller.productList[index]);
          },
          child: Icon(
            Icons.add_shopping_cart_outlined,
            size: 32,
          ),
        ),
      ),
    );
  }

  Widget _showRating(Product product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            product.rating!.rate.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          Icon(
            Icons.star,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _showTitle(Product product) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Text(
            product.title!,
            style: GoogleFonts.alef(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _showDescription(Product product) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Text(
          product.description!,
          textAlign: TextAlign.justify,
          style: GoogleFonts.lato(
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
