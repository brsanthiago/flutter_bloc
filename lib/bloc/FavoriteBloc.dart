import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_bloc/domain/model/Favorite.dart';
import 'package:flutter_bloc/domain/model/Post.dart';
import 'package:rxdart/rxdart.dart';

class FavoriteBloc extends BlocBase {

  final _favorite = Favorite();

  FavoriteBloc() {
    favoriteFlux.listen(_handleAdd);
    deleteFlux.listen(_handlerRemove);
  }

  void _handleAdd(final Post post) {
    _favorite.add(post);
    updateList();
  }

  void _handlerRemove(final Post post) {
    _favorite.remove(post);
    updateList();
  }

  void updateList() {
    favoritesEvent.add(_favorite.posts);
  }


  final _controller = BehaviorSubject<List<Post>>();
  Observable<List<Post>> get favoritesFlux => _controller.stream;
  Sink<List<Post>> get favoritesEvent => _controller.sink;

  final _postController = BehaviorSubject<Post>();
  Observable<Post> get favoriteFlux => _postController.stream;
  Sink<Post> get favoriteEvent => _postController.sink;

  final _deleteController = BehaviorSubject<Post>();
  Observable<Post> get deleteFlux => _deleteController.stream;
  Sink<Post> get deleteEvent => _deleteController.sink;


  @override
  void dispose() {
    _controller.close();
    _postController.close();
    _deleteController.close();
    super.dispose();
  }
}
