import 'package:flutter/cupertino.dart';
import 'package:picturn/ViewModels/post_list_view_model.dart';
import 'package:picturn/Views/Post/post_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class PostListView extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _PostListView();
  }
}

class _PostListView extends State<PostListView> {
  PostListViewModel postListViewModel;

  @override
  Widget build(BuildContext context) {
    if (postListViewModel == null)
      postListViewModel = Provider.of<PostListViewModel>(context);
    int postCount = postListViewModel.postViewModels.length;
    return Container(child: ListView.builder(itemBuilder: (context, index) {
      print(index.toString() + ' index ' + postCount.toString() + ' постов');
      if (index >= postCount) postListViewModel.fetchPosts();
      if (index < postCount)
        return PostView(postListViewModel.postViewModels[index]);
      else
        return null;
    }));
  }
}
