import 'package:fan_app/models/board_list_model.dart';
import 'package:fan_app/ui/widget/navbar.dart';
import 'package:fan_app/utils/colors/colors.dart';
import 'package:fan_app/utils/fonts/main_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({super.key});

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  int currentPage = 0;
  final int pageSize = 5;
  final int totalPage = (boards.length / 5).ceil();
  bool isLoggined = false;

  List<Map<String, dynamic>> getCurrentPageItems() {
    int start = currentPage * pageSize;
    int end = start + pageSize;
    end = end > boards.length ? boards.length : end;
    return boards.sublist(start, end);
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> pageItems = getCurrentPageItems();

    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        appBar: navBar(
          onPress: () => Get.offAndToNamed("/login"),
          icon: isLoggined ? Icons.people : Icons.login_rounded,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 1.0.sw,
                height: 0.24.sh,
                decoration: const BoxDecoration(
                  color: MainColors.primary,
                ),
                child: Center(
                  child: Image.asset(
                    width: 1.0.sw,
                    "assets/images/logo.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 0.02.sh),
              Container(
                width: 1.0.sw,
                height: 0.08.sh,
                padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAndToNamed("/board/write");
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      MainColors.primary,
                    ),
                  ),
                  child: const Text(
                    "작성",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const ListTile(
                title: Text(
                  "★ 게시판운영 공지사항 ★",
                  style: TextStyle(
                    color: MainColors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                subtitle: Text(
                  "작성자: 관리자",
                ),
              ),
              ...pageItems.map((board) {
                final String title = board['title'] as String? ?? '';
                final String writer = board['writer'] as String? ?? '';
                final String date = board['date'] as String? ?? '';
                final String teacher = board['teacher'] as String? ?? '';

                return GestureDetector(
                  onTap: () {},
                  child: ListTile(
                    title: Text(
                      title,
                      style: MainTextStyle.bold_18,
                    ),
                    subtitle: Text('작성자: $writer, 날짜: $date'),
                    trailing: Text(
                      teacher.split(",").length > 1
                          ? '#${teacher.split(",")[0]} 외 ${teacher.split(",").length - 1}명'
                          : '#$teacher',
                      style: const TextStyle(
                        color: MainColors.primary,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                );
              }).toList(),
              Row(
                mainAxisAlignment: currentPage * pageSize == 0
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceAround,
                children: [
                  if (currentPage * pageSize > 0)
                    ElevatedButton(
                      style: ButtonStyle(
                        alignment: Alignment.center,
                        backgroundColor: MaterialStateProperty.all(
                          MainColors.primary,
                        ),
                      ),
                      onPressed: () {
                        if (currentPage * pageSize == 0) {
                          setState(() {
                            currentPage = 0;
                          });
                        } else {
                          setState(() {
                            currentPage--;
                          });
                        }
                      },
                      child: const Text(
                        '이전으로',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  if (currentPage < totalPage - 1)
                    ElevatedButton(
                      style: ButtonStyle(
                        alignment: Alignment.center,
                        backgroundColor: MaterialStateProperty.all(
                          MainColors.primary,
                        ),
                      ),
                      onPressed: () {
                        if (currentPage * pageSize < boards.length) {
                          setState(() {
                            currentPage++;
                          });
                        }
                        if (currentPage == boards.length) {
                          setState(() {
                            currentPage = boards.length - 1;
                          });
                        }
                      },
                      child: const Text(
                        '다음으로',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
