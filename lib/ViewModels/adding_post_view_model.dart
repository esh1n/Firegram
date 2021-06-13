import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:picturn/Models/post.dart';
import 'package:picturn/Models/profile.dart';
import 'package:picturn/Repositories/post_repository.dart';
import 'package:picturn/Views/auth.dart';

class AddingPostViewModel{
  var postRepository = PostRepository();

  Future<void> addPost(Post post) async{
    postRepository.savePost(post);
  }

  Future<void> addFilePost(File imageFile) async{
    var imageUrl = await uploadImageToFirebase(imageFile);
    var userId = getCurrentUserId();
    Post post = Post(Profile(userId, avatarImagePath: 'res/images/ava2.jpg'),  DateTime.now(), imageUrl, 0);
    postRepository.savePost(post);
  }

  Future<String> uploadImageToFirebase(File imageFile) async {
    String fileName = basename(imageFile.path);
    Reference storageReference = FirebaseStorage.instance.ref().child('uploads/$fileName');
    await storageReference.putFile(imageFile);
    return storageReference.getDownloadURL();
  }
}