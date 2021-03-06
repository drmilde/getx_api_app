import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_app/controller/product_controller.dart';
import 'package:getx_api_app/widgets/product_tile.dart';
import 'package:google_fonts/google_fonts.dart';

class WarenkorbScreen extends StatelessWidget {
  final ProductController _controller = Get.find();
  final Random rnd = Random();

  WarenkorbScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _buildUpperBar(),
              Expanded(
                child: Obx(() {
                  return Scrollbar(
                    child: ListView.builder(
                      itemCount: _controller.warenkorb.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: ValueKey(rnd.nextInt(1000000000)),
                          direction: DismissDirection.startToEnd,
                          onDismissed: (direction) {
                            if (direction ==
                                DismissDirection.startToEnd) // nach rechts
                            {
                              _controller.removeFromWarenkorb(index);
                            }
                          },
                          child: buildProductTile(index),
                        );
                      },
                    ),
                  );
                }),
              ),
              _buildLowerBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUpperBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Summe",
            style: GoogleFonts.lato(fontSize: 32),
          ),
          Obx(() {
            return Text(
              "\$ ${_controller.summe.toStringAsFixed(2)}",
              style: GoogleFonts.lato(fontSize: 32),
            );
          })
        ],
      ),
    );
  }

  Widget _buildLowerBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                // TODO start order action here
              },
              child: _buildPlaceOrderButton(),
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
    );
  }

  Widget _buildPlaceOrderButton() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        border: Border.all(
          width: 3.0,
          color: Colors.green,
        ),
        borderRadius: BorderRadius.all(
            Radius.circular(12.0) //         <--- border radius here
            ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4.0),
        child: Text(
          "order",
          style: GoogleFonts.lato(fontSize: 32),
        ),
      ),
    );
  }

  Widget buildProductTile(int index) {
    return ProductTile(
      _controller.warenkorb[index],
      index,
      isClickable: false,
    );
  }
}
