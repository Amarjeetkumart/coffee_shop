import 'package:coffee_shop_ui/screens/sunflower.dart';
import 'package:flutter/material.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 80,
      decoration: BoxDecoration(
        color: const Color(0xFF212325),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 8,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //bottom icon button
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.home,
              color: Color(0xFFE57734),
              size: 35,
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.favorite_outlined,
              color: Colors.white,
              size: 35,
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.add_shopping_cart_sharp,
              color: Colors.white,
              size: 35,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Sunflower(),
                ),
              );
            },
            child: const Icon(
              Icons.person,
              color: Colors.white,
              size: 35,
            ),
          ),
          // Icon(
          //   Icons.favorite_outlined,
          //   color: Colors.white,
          //   size: 35,
          // ),
          // Icon(
          //   Icons.notifications,
          //   color: Colors.white,
          //   size: 35,
          // ),
          // Icon(
          //   Icons.person,
          //   color: Colors.white,
          //   size: 35,
          // ),
        ],
      ),
    );
  }
}
