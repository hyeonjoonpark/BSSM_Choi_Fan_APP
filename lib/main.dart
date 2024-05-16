import 'package:fan_app/provider/bottom_navigation_provider.dart';
import 'package:fan_app/provider/count_provider.dart';
import 'package:fan_app/routes/app_router.dart';
import 'package:fan_app/ui/screen/home.dart';
import 'package:fan_app/utils/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      getPages: appRouter,
      theme: ThemeData(
        primaryColor: MainColors.primary,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => CountProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => BottomNavigationProvider(),
          ),
        ],
        child: Home(),
      ),
    );
  }
}
