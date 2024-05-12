import 'package:fan_app/utils/colors/colors.dart';
import 'package:fan_app/utils/fonts/main_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget goodsList(List<Map<String, dynamic>> list) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: list
          .map(
            (entry) => Padding(
              padding: EdgeInsets.symmetric(
                vertical: 0.01.sh,
                horizontal: 0.02.sh,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 140,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: MainColors.primary,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: Image.network(
                          entry["image"]!,
                        ).image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    entry["name"] ?? "",
                    style: MainTextStyle.bold_12,
                    textAlign: TextAlign.left, // 텍스트 왼쪽 정렬
                  ),
                  Text(
                    "${entry["price"].toString()}원",
                    style: const TextStyle(
                      color: MainColors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "#${entry["teacher"]}",
                        style: const TextStyle(
                          color: MainColors.primary,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
          .toList(),
    ),
  );
}
