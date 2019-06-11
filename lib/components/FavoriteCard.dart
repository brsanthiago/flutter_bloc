import 'package:flutter/material.dart';
import 'package:flutter_bloc/domain/model/Post.dart';

class FavoriteCard extends StatefulWidget {
  final Post _post;

  FavoriteCard(this._post);

  @override
  _FavoriteCardState createState() {
    return _FavoriteCardState();
  }
}

class _FavoriteCardState extends State<FavoriteCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey,
      child: Container(
        margin: const EdgeInsets.all(10),
        width: 200,
        height: 160,
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
            ],
          ),
        ),
      ),
    );
    ;
  }
}
