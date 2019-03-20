
import 'package:flutter_bloc_pattern/api.dart';
import 'package:flutter_bloc_pattern/bloc.dart';
import 'package:flutter_bloc_pattern/posts.dart';

class PostsBloc extends Bloc<List<Post>>{

  @override
  mapEventToState(Api api) async {
    await api.getPost().then((data) => outSink.add(data));
  }

}