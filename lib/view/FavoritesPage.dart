import 'package:flutter/material.dart';
import 'package:flutter_bloc/bloc/FavoriteBloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_bloc/components/FavoriteCard.dart';
import 'package:flutter_bloc/components/PostCard.dart';
import 'package:flutter_bloc/domain/model/Post.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() {
    return _FavoritesPageState();
  }
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {

    FavoriteBloc _favoriteBloc = BlocProvider.getBloc<FavoriteBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Favoritos"),
        centerTitle: true,
      ),
      body: Container(
        child: StreamBuilder(
          stream: _favoriteBloc.favoritesFlux,
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            if(snapshot.hasData && snapshot.data.isNotEmpty) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  final Post _post = snapshot.data[index];
                  return Dismissible(
                    onDismissed: (direction) {
                        _favoriteBloc.deleteEvent.add(_post);
                    },
                    child: FavoriteCard(_post),
                    key: Key("${_post.id}"),
                  );
                },
              );
            } else {
              return Center(
                child: Text("Você ainda não possui favoritos."),
              );
            }
          },
        )
        ,
      ),
    );
  }
}
