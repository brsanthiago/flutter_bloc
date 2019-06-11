import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_bloc/domain/model/Post.dart';
import 'package:flutter_bloc/domain/service/PostService.dart';
import 'package:rxdart/rxdart.dart';

class PostBloc extends BlocBase {
  final _service = PostService();

  final _controller = BehaviorSubject<List<Post>>();

  Observable<List<Post>> get postsFlux => _controller.stream;

  Sink<List<Post>> get postsEvent => _controller.sink;

  PostBloc() {
    _service.getPosts().then(postsEvent.add);
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
