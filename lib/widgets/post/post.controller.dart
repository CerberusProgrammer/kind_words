import 'package:get/get.dart';
import 'package:kind_words/widgets/post/post.dart';

class PostController extends GetxController {
  var posts = <Post>[Post(content: 'Hola mundo :)')].obs;

  void addPost(Post post) {
    posts.add(post);
    update();
  }
}
