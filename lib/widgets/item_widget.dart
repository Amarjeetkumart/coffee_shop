//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:coffee_shop_ui/screens/single_item_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ItemWidget extends StatelessWidget {
  List img = [
    "Americano",
    "Cappuccino",
    "Latte",
    "Flat White",
    //chatGpt
    "Espresso",
    "Mocha",
    "Macchiato",
    "Affogato",
    "Cortado",
    "Ristretto",
    "Breve",
    "Irish Coffee",
  ];

  final List<String> subtitles = [
    "Rich and bold",
    "Smooth and creamy",
    "Milky delight",
    "Silky and smooth",
    //chatGpt
    "Strong and bold",
    "Chocolate infused",
    "Rich and layered",
    "Coffee with ice cream",
    "Equal parts espresso and milk",
    "Concentrated espresso",
    "Creamy and rich",
    "With a touch of whiskey",
  ];

  final List<double> prices = [
    3.00,
    3.50,
    4.00,
    4.50,
    //chatGpt
    2.50,
    3.75,
    3.25,
    4.00,
    3.00,
    2.75,
    3.50,
    5.00,
  ];

  ItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: (2 / 3),
      children: [
        for (int i = 0; i < img.length; i++)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFF212325),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 8,
                ),
              ],
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SingleItemScreen(
                          img: img[i],
                          subtitles: subtitles[i],
                          prices: prices[i],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.asset(
                      "lib/images/${img[i]}.png",
                      //coffee Image Sizes
                      width: 200,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, top: 5, left: 9),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          img[i],
                          style: const TextStyle(
                            //coffee Name
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          //coffee subtitle
                          // "Best Coffee",
                          subtitles[i],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white60,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //text for prices and Icon on bottom
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //price

                      Text(
                        //price on home_screen
                        "\$ ${prices[i].toStringAsFixed(2)}",
                        style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      //add Button on home_screen
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE57734),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: InkWell(
                          child: const Icon(
                            Icons.add,
                            size: 25,
                            color: Colors.white,
                          ),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Item is added to Cart',
                                  style: GoogleFonts.lato(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 500),
                              ),
                            );
                          },
                        ),
                        // child: const Icon(
                        //   Icons.add,
                        //   size: 20,
                        //   color: Colors.white,
                        // ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
