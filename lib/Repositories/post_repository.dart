import 'package:picturn/Models/post.dart';
import 'package:picturn/Models/profile.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'database_provider.dart';

class PostRepository {
  var databaseProvider = DatabaseProvider();

  var postDataBase = [
    Post(Profile('John', avatarImagePath: 'res/images/ava1.jpg'), DateTime.now(), 'res/images/1.jpg', 777),
    Post(Profile('Ilon'), DateTime.now(), 'res/images/2.jpg', 666),
    Post(Profile('Сергей Александрович', avatarImagePath: 'res/images/ava2.jpg'),  DateTime.now(), 'res/images/3.jpg', 555)
  ];

  Future<String> downloadURLExample() async {
    return await firebase_storage.FirebaseStorage.instance
        .ref('images/4.jpg')
        .getDownloadURL();
  }

  Future<void> savePost(Post post) async {
    this.databaseProvider.savePost(post);
  }

  Future<List<Post>> fetchPosts() async {
    return await this.databaseProvider.getAllPosts();

    //return await Future.delayed(Duration(seconds: 0), () => postDataBase);

    // return await Future.delayed(Duration(seconds: 0), () => downloadURLExample().then((value) => [
    //   Post(Profile('John', avatarImagePath: 'res/images/ava1.jpg'), DateTime.now(), value, 777),
    // ]));
  }

  Future<List<Post>> fetchProfilePosts(String nickName) async {
    //TODO get запрос получения постов пользователя
    return await Future.delayed(
        Duration(seconds: 0),
        () => postDataBase
            .where((element) => element.profile.nickName == nickName)
            .toList());
  }

  Future<bool> sendPostLikes(
      String imagePath, String nickName, bool isLiked) async {
    //TODO запрос на добавление/удаление лайка пользователя к посту
    print('сервер получил лайк');
    return await Future.delayed(Duration(seconds: 0), () => true);
  }

  Future<int> fetchPostLikes(String imagePath) async {
    //TODO get запрос получения кол-ва лайков поста
    int count = await Future.delayed(Duration(seconds: 0), () => 15);
    return count;
  }
}
