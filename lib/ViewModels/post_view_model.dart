import 'package:flutter/cupertino.dart';
import 'package:picturn/Models/post.dart';
import 'package:picturn/Models/profile.dart';

class PostViewModel extends ChangeNotifier {
  final Post post;

  PostViewModel({this.post});

  String get getImagePath => this.post.imagePath;

  String get getAuthor => this.post.profile.nickName;

  DateTime get getDate => this.post.date;

  Profile get getProfile => this.post.profile;

  String get getAvatarImagePath =>
      this.post.profile.avatarImagePath ?? 'res/images/no_avatar.png';

  int get getLikesCount => this.post.likesCount;

  bool trySetLike() {
    this.post.isLiked = !this.post.isLiked;
    this.post.isLiked ? this.post.likesCount++ : this.post.likesCount--;
    return this.post.isLiked;
  }

  //TODO
  Future<void> updateLike() async {
    notifyListeners();
  }
}
