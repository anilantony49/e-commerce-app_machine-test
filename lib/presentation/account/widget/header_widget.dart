import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: Image.asset(
            "assets/img/u1.png",
            width: 60,
            height: 60,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Profile',
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.edit,
                  color: Appcolor.primary,
                  size: 18,
                )
              ],
            ),
          ],
        ))
      ],
    );
  }
}
