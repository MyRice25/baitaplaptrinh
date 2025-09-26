import 'package:flutter/material.dart';

Widget buildCartIcon(int count) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      const Icon(Icons.shopping_cart_outlined, color: Colors.black, size: 32),
      if (count > 0)
        Positioned(
          right: -6,
          top: -8,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
            child: Text(
              '$count',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
    ],
  );
}
