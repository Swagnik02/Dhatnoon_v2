import 'package:flutter/material.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
  }

  void onNextPressed() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % 2;
      _tabController.animateTo(_currentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector();
  }
}
