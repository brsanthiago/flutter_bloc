import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/bloc/PostBloc.dart';
import 'package:flutter_bloc/components/PostCard.dart';
import 'package:flutter_bloc/domain/model/Post.dart';

import 'FavoritesPage.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() {
    return _PostPageState();
  }
}

class _PostPageState extends State<PostPage> {
  PostBloc _postBloc;

  @override
  void initState() {
    _postBloc = PostBloc();
    super.initState();
  }

  @override
  void dispose() {
    _postBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        centerTitle: true,
      ),
      body: Container(
        child: StreamBuilder(
          stream: _postBloc.postsFlux,
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            if (snapshot.hasData && snapshot.data.isNotEmpty) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  final Post _post = snapshot.data[index];
                  return PostCard(_post);
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite),
        onPressed: () => Navigator.push(
            context, CupertinoPageRoute(builder: (context) => FavoritesPage())),
      ),
    );
  }
}
