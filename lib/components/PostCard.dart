import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/bloc/FavoriteBloc.dart';
import 'package:flutter_bloc/bloc/FavoriteCardBloc.dart';
import 'package:flutter_bloc/domain/model/Post.dart';

class PostCard extends StatefulWidget {
  final Post _post;

  PostCard(this._post);

  @override
  _PostCardState createState() {
    return _PostCardState();
  }
}

class _PostCardState extends State<PostCard> {
  FavoriteCardBloc _favoriteCardBloc;
  FavoriteBloc _favoriteBloc;

  @override
  void initState() {
    _favoriteCardBloc = FavoriteCardBloc(widget._post);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _favoriteBloc = BlocProvider.getBloc<FavoriteBloc>();

      _favoriteBloc.favoritesFlux.listen(_favoriteCardBloc.favoritesEvent.add);
    });

    super.initState();
  }

  @override
  void dispose() {
    _favoriteCardBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey,
      child: Container(
        margin: const EdgeInsets.all(10),
        width: 200,
        height: 200,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 0.0, bottom: 10),
                child: Text(
                  "ID: ${widget._post.id}",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0.0, bottom: 10),
                child: Text(
                  "Title: ${widget._post.title}",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Text(
                  "Body: ${widget._post.body}",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              StreamBuilder(
                stream: _favoriteCardBloc.favoriteFlux,
                initialData: false,
                builder: (BuildContext ctx, AsyncSnapshot<bool> snapshot) {
                  return snapshot.data
                      ? IconButton(
                          icon: Icon(Icons.favorite, color: Colors.red),
                          onPressed: () {
                            _favoriteBloc.deleteEvent.add(widget._post);
                          },
                        )
                      : IconButton(
                          icon: Icon(Icons.favorite_border, color: Colors.grey),
                          onPressed: () {
                            _favoriteBloc.favoriteEvent.add(widget._post);
                          });
                },
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
