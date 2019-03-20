import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/bloc.dart';
import 'package:flutter_bloc_pattern/posts.dart';
import 'package:flutter_bloc_pattern/posts_bloc.dart';
import 'package:flutter_bloc_pattern/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Splash'),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return BlocProvider<PostsBloc>(
                  builder: (context, bloc) => bloc ?? PostsBloc(),
                  onDispose: (context, bloc) => bloc.dispose(),
                  child: Home());
            }));
          },
          child: Text('Next'),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PostsBloc bloc = Provider.of<PostsBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Posts',
          textScaleFactor: 1,
        ),
      ),
      body: StreamBuilder<List<Post>>(
          stream: bloc.outStream,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              var posts = snapshot.data;
              return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        posts[index].title,
                        textScaleFactor: 1,
                      ),
                      subtitle: Text(posts[index].content,maxLines: 2,overflow: TextOverflow.ellipsis,),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
