import 'package:date_format/date_format.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:picturn/Models/profile.dart';

class Post {
  final String imagePath;
  final Profile profile;
  final DateTime date;

  bool isLiked;
  int likesCount;

  Set profileLiked = {};
  DatabaseReference _id;

  Post(this.profile, this.date, this.imagePath, this.likesCount,
      {this.isLiked = false});

  void setId(DatabaseReference id) {
    this._id = id;
  }

  Map<String, dynamic> toJson() {
    return {
      'imagePath': this.imagePath,
      'nickName': this.profile.nickName,
      'avatarImagePath': this.profile.avatarImagePath,
      'date': formatDate(this.date, [yyyy, '-', mm, '-', dd]),
      'profileLiked': this.profileLiked.toList(),
    };
  }


  static Post createPost(record) {
    Map<String, dynamic> attributes = {
      'imagePath': '',
      'nickName': '',
      'avatarImagePath': '',
      'date': '',
      'profileLiked': [],
    };

    record.forEach((key, value) => {attributes[key] = value});

    print(attributes['date'] + '     hui');
    Post post = new Post(
        Profile(attributes['nickName'],
            avatarImagePath: attributes['avatarImagePath']),
        DateTime.parse(attributes['date']),
        attributes['imagePath'],
        123);
    //post.usersLiked = new Set.from(attributes['usersLiked']);
    return post;
  }
}
