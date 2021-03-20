import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationBarView extends StatefulWidget {
  List<Widget> listTab;

  NavigationBarView(this.listTab);

  State<StatefulWidget> createState() {
    return _NavigationBarView(this.listTab);
  }
}

class _NavigationBarView extends State<NavigationBarView> {
  int _currentIndex = 0;
  List<Widget> listTab;

  _NavigationBarView(this.listTab);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        children: listTab,
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        showUnselectedLabels: false,
        onTap: (newIndex) => setState(() => _currentIndex = newIndex),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: 'Лента'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined), label: 'Добавить'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'Профиль')
        ],
      ),
    );
  }
}
