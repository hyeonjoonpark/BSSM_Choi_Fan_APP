import 'package:fan_app/ui/screens/board_write_screen.dart';
import 'package:fan_app/ui/screens/login_screen.dart';
import 'package:get/get.dart';

List<GetPage> appRouter = [
  GetPage(
    name: '/board/write',
    page: () => const BoardWriteScreen(),
  ),
  GetPage(
    name: '/login',
    page: () => const LoginScreen(),
  ),
];
