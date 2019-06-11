import 'Post.dart';

class Favorite {
  final _posts = <Post>{};

  void add(final Post post) {
    _posts.add(post);
  }

  void remove(final Post post) {
    _posts.remove(post);
  }

  List<Post> get posts => _posts.toList();
}
