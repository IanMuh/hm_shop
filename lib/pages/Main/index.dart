import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Cart/index.dart';
import 'package:hm_shop/pages/Category/index.dart';
import 'package:hm_shop/pages/Home/index.dart';
import 'package:hm_shop/pages/Mine/index.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Map<String,String>> _tableList = [
    {
      "icon": "lib/assets/codex-2026-07-21T12-59-58-270Z.png",
      "active_icon": "lib/assets/codex-2026-07-21T12-59-58-270Z.png",
      "text": "首页",
    },
    {
      "icon": "lib/assets/codex-2026-07-21T12-59-58-270Z.png",
      "active_icon": "lib/assets/codex-2026-07-21T12-59-58-270Z.png",
      "text": "分类",
    },
    {
      "icon": "lib/assets/codex-2026-07-21T12-59-58-270Z.png",
      "active_icon": "lib/assets/codex-2026-07-21T12-59-58-270Z.png",
      "text": "购物车",
    },
    {
      "icon": "lib/assets/codex-2026-07-21T12-59-58-270Z.png",
      "active_icon": "lib/assets/codex-2026-07-21T12-59-58-270Z.png",
      "text": "我的",
    },
  ];

  List<Widget> _getChildren() {
    return [HomeView(), CategoryView(), CartView(), MineView()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("主页面"),),
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _getChildren(),
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _currentIndex = index;
          setState(() {});
        },
        items: _getTabBarWidget(),
        currentIndex: _currentIndex,
      ),
    );
  }

  List<BottomNavigationBarItem> _getTabBarWidget() {
    return List.generate(_tableList.length, (int index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_tableList[index]["icon"]!,height: 40, width: 40,),
        activeIcon: Image.asset(_tableList[index]["icon"]!, height: 30, width: 30,),
        label: _tableList[index]["text"]
      );
    });
  }
}