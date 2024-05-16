import 'dart:io';

import 'package:fan_app/models/board_list_model.dart';
import 'package:fan_app/models/teacher_list.dart';
import 'package:fan_app/ui/widget/navbar.dart';
import 'package:fan_app/utils/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_mentions/flutter_mentions.dart';
import 'package:intl/intl.dart';

class BoardWriteScreen extends StatefulWidget {
  const BoardWriteScreen({super.key});

  @override
  State<BoardWriteScreen> createState() => _BoardWriteScreenState();
}

class _BoardWriteScreenState extends State<BoardWriteScreen> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> _pickedImages = [];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final GlobalKey<FlutterMentionsState> _mentionsKey =
      GlobalKey<FlutterMentionsState>();

  Future<void> _pickImage() async {
    final List<XFile>? pickedImage = await _picker.pickMultiImage();
    if (pickedImage != null) {
      setState(() {
        _pickedImages = pickedImage;
      });
    }
  }

  void _submitPost() {
    final content = _mentionsKey.currentState!.controller!.text;
    print(content);

    // 멘션된 사람들의 이름 또는 아이디를 추출하는 로직
    // #이름으로 멘션했습니다
    final mentionPattern = RegExp(r'#([\w가-힣]+)');
    final mentions = mentionPattern.allMatches(content);

    List<String> mentionedPeople = mentions.map((match) {
      // 멘션된 사람들의 이름을 반환합니다. 아이디가 필요하다면 다른 방식으로 추출해야 합니다.
      return match.group(1)!;
    }).toList();

    // 멘션한 사람들의 이름을 쉼표로 구분한 문자열로 변환
    final mentionedPeopleStr = mentionedPeople.join(', ');
    print(mentionedPeopleStr);

    boards.insert(
      0,
      {
        "title": _titleController.text,
        "content": content,
        "writer": "박현준",
        "teacher": mentionedPeopleStr, // 멘션된 사람들의 이름을 저장합니다.
        "date": DateFormat('yyyy-MM-dd').format(DateTime.now()),
      },
    );
    Get.offAndToNamed("/");
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Portal(
        child: Scaffold(
          appBar: navBar(
            onPress: () {
              Get.offAndToNamed("/");
            },
            icon: Icons.arrow_back_ios_new,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 0.9.sw,
                    margin: EdgeInsets.only(top: 0.1.sh),
                    child: Text(
                      "게시글 작성하기",
                      style: TextStyle(
                        color: MainColors.primary,
                        fontSize: 20.0.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Container(
                    width: 0.9.sw,
                    margin: EdgeInsets.only(top: 10.0.h),
                    child: TextFormField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        hintText: "제목을 입력해주세요",
                        floatingLabelStyle: TextStyle(
                          color: MainColors.primary,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 0.9.sw,
                    margin: EdgeInsets.only(top: 10.0.h),
                    child: FlutterMentions(
                      maxLines: 10,
                      key: _mentionsKey,
                      suggestionPosition: SuggestionPosition.Bottom,
                      decoration: const InputDecoration(
                        hintText: "내용을 입력해주세요",
                        floatingLabelStyle: TextStyle(
                          color: MainColors.primary,
                        ),
                      ),
                      mentions: [
                        Mention(
                          suggestionBuilder: (p0) {
                            return Container(
                              padding: const EdgeInsets.all(10),
                              color: MainColors.primary,
                              child: Text(
                                p0['display'],
                                style: const TextStyle(
                                  color: MainColors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                            );
                          },
                          trigger: '#',
                          style: const TextStyle(
                            color: MainColors.primary,
                          ),
                          data: somaTeacher,
                          matchAll: false,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 0.9.sw,
                    margin: EdgeInsets.only(top: 10.0.h),
                    child: ElevatedButton(
                      onPressed: _pickImage,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          MainColors.primary,
                        ),
                      ),
                      child: const Text(
                        "이미지 선택",
                        style: TextStyle(
                          color: MainColors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 0.9.sw,
                    margin: EdgeInsets.only(top: 10.0.h),
                    child: ElevatedButton(
                      onPressed: _submitPost,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          MainColors.primary,
                        ),
                      ),
                      child: const Text(
                        "게시물 작성",
                        style: TextStyle(
                          color: MainColors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 0.9.sw,
                    margin: EdgeInsets.only(top: 10.0.h),
                    child: Column(
                      children: _pickedImages
                          .map(
                            (e) => Image.file(
                              File(e.path),
                              width: 0.9.sw,
                              height: 0.3.sh,
                              fit: BoxFit.cover,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
