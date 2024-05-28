import 'package:fan_app/provider/bottom_navigation_provider.dart';
import 'package:fan_app/ui/widget/bottom_navigation_widget.dart';
import 'package:fan_app/ui/widget/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});

  late BottomNavigationProvider bottomNavigationProvider;
  @override
  Widget build(BuildContext context) {
    bottomNavigationProvider = Provider.of<BottomNavigationProvider>(context);

    return Scaffold(
      body: navigationBody(bottomNavigationProvider),
      bottomNavigationBar: bottomNavigationBarWidget(bottomNavigationProvider),
    );
  }
}
