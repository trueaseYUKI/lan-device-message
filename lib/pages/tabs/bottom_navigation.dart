import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;
  final PageController pageController;

  const BottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.pageController,
  });

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.currentIndex,
      onTap: (index) {
        widget.pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '主页'),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: '聊天'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: '设置'),
      ],
    );
  }
}
