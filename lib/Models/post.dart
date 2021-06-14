import 'package:date_format/date_format.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:picturn/Models/profile.dart';

class Post {
  final String imagePath;
  final int timestamp;
  final Profile profile;
  final DateTime date;

  bool isLiked;
  int likesCount;

  Set profileLiked = {};

  Post(this.profile, this.date,this.timestamp, this.imagePath, this.likesCount,
      {this.isLiked = false});

  Map<String, dynamic> toJson() {
    return {
      'imagePath': this.imagePath,
      'nickName': this.profile.nickName,
      'email': this.profile.email,
      'avatarImagePath': this.profile.avatarImageUrl,
      'date': dateStr(this.date),
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'profileLiked': this.profileLiked.toList(),
    };
  }

  static String  dateStr(DateTime date) => formatDate(date, [yyyy, '-', mm, '-',dd,'T',HH, ':', nn, ':',ss ]);

  static Post createPost(record) {
    Map<String, dynamic> attributes = {
      'imagePath': '',
      'timestamp': '',
      'nickName': '',
      'email': '',
      'avatarImagePath': '',
      'date': '',
      'profileLiked': [],
    };

    record.forEach((key, value) => {attributes[key] = value});

    print(attributes['date']);
    Post post = new Post(
        Profile(attributes['email'],
             attributes['avatarImagePath'],
            attributes['nickName']),
        DateTime.parse(attributes['date']),
        attributes['timestamp'],
        attributes['imagePath'],
        0);
    return post;
  }
}
