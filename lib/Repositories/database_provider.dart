import 'package:firebase_database/firebase_database.dart';
import 'package:picturn/Models/post.dart';

class DatabaseProvider{
  final databaseReference = FirebaseDatabase.instance.reference();

  final database = FirebaseDatabase.instance.reference();

  DatabaseReference savePost(Post post){
    var id = databaseReference.child('posts/').push();
    id.set(post.toJson());
    return id;
  }

  void updatePost(Post post, DatabaseReference id) {
    id.update(post.toJson());
  }

  Future<List<Post>> getAllPosts() async {
    DatabaseReference ref =  databaseReference.child('posts/');
    DataSnapshot dataSnapshot = await ref.once();
    List<Post> posts = [];
    print('qqqqqqqqqqqqqqqq');
    if (dataSnapshot.value != null) {
      dataSnapshot.value.forEach((key, value) {
        Post post = Post.createPost(value);
        post.setId(databaseReference.child('posts/' + key));
        posts.add(post);
        print(post.profile.nickName);
        //print(formatDate(post.date, [yyyy, '-', mm, '-', dd]));
      });
    }
    return posts;
  }



}