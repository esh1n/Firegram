import 'package:picturn/Models/profile.dart';

class Post {
  final String imagePath;
  final Profile profile;
  final DateTime date;
  bool isLiked;
  int likesCount;

  Post(this.profile, this.date, this.imagePath, this.likesCount,
      {this.isLiked = false});
}
