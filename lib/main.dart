import 'package:flutter/material.dart';
import 'package:picturn/Views/AddingPost/adding_post_view.dart';
import 'package:picturn/runtime_data.dart';
import 'package:provider/provider.dart';

import 'Models/profile.dart';
import 'ViewModels/post_list_view_model.dart';
import 'ViewModels/profile_view_model.dart';
import 'Views/Post/post_list_view.dart';
import 'Views/Profile/profile_view.dart';
import 'Views/navigation_bar_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RuntimeData.currentUserProfileViewModel = ProfileViewModel(Profile('Ilon'));
    RuntimeData.currentOpenProfileViewModel = ProfileViewModel(null);

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

    return MaterialApp(title: 'Picturn', home: NavigationBarView(listTab));
  }
}
