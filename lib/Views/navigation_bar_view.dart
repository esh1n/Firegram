import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:picturn/ViewModels/post_list_view_model.dart';
import 'package:picturn/ViewModels/profile_view_model.dart';
import 'package:provider/provider.dart';

import '../runtime_data.dart';
import 'AddingPost/adding_post_view.dart';
import 'Post/post_list_view.dart';
import 'Profile/profile_view.dart';

class NavigationBarView extends StatefulWidget {
  //List<Widget> listTab;

  //NavigationBarView(this.listTab);

  State<StatefulWidget> createState() {
    //return _NavigationBarView(this.listTab);
    return _NavigationBarView();
  }
}

class _NavigationBarView extends State<NavigationBarView> {
  List<Widget> listTab = [
    ChangeNotifierProvider(
      create: (context) => PostListViewModel(PostListType.all),
      child: PostListView(),
    ),
    AddingPostView(),
    ProfileView(
      ProfileViewModel(RuntimeData.currentUserProfileViewModel.profile),
    ),
  ];

  int _currentIndex = 0;

  //List<Widget> listTab;

  //_NavigationBarView(this.listTab);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        children: listTab,
        index: _currentIndex,
      ),
      bottomNavigationBar: SizedBox(
        height: 54,
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          showUnselectedLabels: false,
          onTap: (newIndex) => setState(() => _currentIndex = newIndex),
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                  size: 20,
                ),
                label: 'Лента'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_box_outlined,
                  size: 20,
                ),
                label: 'Добавить'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_box,
                  size: 20,
                ),
                label: 'Профиль')
          ],
        ),
      ),
    );
  }
}
