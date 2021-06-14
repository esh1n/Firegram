class Profile {
  String nickName;
  String avatarImageUrl;

  Profile(this.nickName, {this.avatarImageUrl});

  bool isSameById(Profile profile){
    return profile.nickName == nickName;
  }
}
