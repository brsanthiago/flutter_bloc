import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_bloc/domain/model/Post.dart';
import 'package:rxdart/rxdart.dart';

class FavoriteCardBloc extends BlocBase {
  final _favoriteController = BehaviorSubject<List<Post>>();
  Observable<List<Post>> get favoritesFlux => _favoriteController.stream;
  Sink<List<Post>> get favoritesEvent => _favoriteController.sink;

  final _controller = BehaviorSubject<bool>();
  Observable<bool> get favoriteFlux => _controller.stream;
  Sink<bool> get favoriteEvent => _controller.sink;

  FavoriteCardBloc(Post post) {
    favoritesFlux
        .map((data) => data.contains(post))
        .listen(favoriteEvent.add);
  }

  @override
  void dispose() {
    _favoriteController.close();
    _controller.close();
    super.dispose();
  }
}
