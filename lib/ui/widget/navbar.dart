import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget? navBar({String? url, IconData? icon}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight),
    child: AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              icon,
              color: Colors.black87,
              size: 20,
            ),
            onPressed: () {
              Get.offAndToNamed(url ?? "/");
            },
          ),
        ],
      ),
    ),
  );
}
