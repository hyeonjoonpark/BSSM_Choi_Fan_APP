import 'package:fan_app/ui/screen/board_write_screen.dart';
import 'package:get/get.dart';

List<GetPage> appRouter = [
  GetPage(
    name: '/board/write',
    page: () => const BoardWriteScreen(),
  ),
];
