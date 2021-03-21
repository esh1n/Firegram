import 'package:picturn/Models/post.dart';
import 'package:picturn/Models/profile.dart';

class PostRepository {
  var postDataBase = [
    Post(Profile('John', avatarImagePath: 'res/images/ava1.jpg'), DateTime.now(), 'res/images/1.jpg', 777),
    Post(Profile('Ilon'), DateTime.now(), 'res/images/2.jpg', 666),
    Post(Profile('Сергей Александрович', avatarImagePath: 'res/images/ava2.jpg'),  DateTime.now(), 'res/images/3.jpg', 555)
  ];

  Future<List<Post>> fetchPosts() async {
    //TODO get запрос получения всех постов
    return await Future.delayed(Duration(seconds: 0), () => postDataBase);
  }

  Future<List<Post>> fetchProfilePosts(String nickName) async {
    // var result = [
    //   Post(Profile('Ilon'), DateTime.now(), 'res/images/2.jpg', 666),
    // ];
    //TODO get запрос получения постов пользователя
    return await Future.delayed(
        Duration(seconds: 0),
        () => postDataBase
            .where((element) => element.profile.nickName == nickName)
            .toList());
    // return postDataBase.where((element) => element.profile.nickName == nickName).toList();
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
