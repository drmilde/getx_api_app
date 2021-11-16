import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_app/controller/product_controller.dart';
import 'package:getx_api_app/widgets/product_tile.dart';
import 'package:google_fonts/google_fonts.dart';

class WarenkorbScreen extends StatelessWidget {
  final ProductController _controller = Get.find();

  WarenkorbScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Obx(() {
                return Scrollbar(
                  child: ListView.builder(
                    itemCount: _controller.warenkorb.length,
                    itemBuilder: (context, index) {
                      return ProductTile(_controller.warenkorb[index], index);
                    },
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "place order",
                      style: GoogleFonts.lato(fontSize: 32),
                    ),
                    IconButton(
                      onPressed: () {
                        _controller.clearWarenkorb();
                      },
                      icon: Icon(Icons.clear),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
