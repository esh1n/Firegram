import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:picturn/ViewModels/post_view_model.dart';
import 'package:picturn/ViewModels/profile_view_model.dart';
import 'package:picturn/Views/Profile/profile_view.dart';
import 'package:picturn/runtime_data.dart';

class PostTitleView extends StatelessWidget {
  PostViewModel postViewModel;

  PostTitleView({this.postViewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 20, top: 5, right: 5, bottom: 5),
        child: Row(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  if (RuntimeData.currentUserProfileViewModel
                      .equalProfiles(this.postViewModel.getProfile)) return;

                  if (RuntimeData.currentOpenProfileViewModel.profile != null &&
                      RuntimeData.currentOpenProfileViewModel
                          .equalProfiles(this.postViewModel.getProfile)) return;

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileView(ProfileViewModel(
                              this.postViewModel.getProfile))));
                },
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  backgroundImage:
                      AssetImage(this.postViewModel.getAvatarImagePath),
                )),
            Padding(
                padding: EdgeInsets.only(left: 10, top: 0, right: 0, bottom: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(this.postViewModel.getAuthor),
                    Text(this.postViewModel.getDate.day.toString() +
                        "." +
                        this.postViewModel.getDate.month.toString() +
                        "." +
                        this.postViewModel.getDate.year.toString())
                  ],
                ))
          ],
        ));
  }
}
