import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:picturn/ViewModels/post_list_view_model.dart';
import 'package:picturn/Views/Post/post_view.dart';
import 'package:provider/provider.dart';

class PostListView extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _PostListView();
  }
}

class _PostListView extends State<PostListView> {
  PostListViewModel postListViewModel;

  ScrollController _scrollController;

  _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      postListViewModel.fetchLatestPost();
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (postListViewModel == null)
      postListViewModel = Provider.of<PostListViewModel>(context);
    int postCount = postListViewModel.postViewModels.length;
    return Container(
        child: ListView.builder(
            controller: _scrollController,
            itemCount: postCount,
            itemBuilder: (context, index) {
              // if (index >= postCount) postListViewModel.fetchLatestPost();
              if (index < postCount)
                return PostView(postListViewModel.postViewModels[index]);
              else
                return null;
            }));
  }
}
