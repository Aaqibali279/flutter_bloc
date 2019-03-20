
import 'dart:async';
import 'package:flutter_bloc_pattern/api.dart';

abstract class Bloc<T>{


  Bloc(){
    _inController.stream.listen(mapEventToState);
    inSink.add(Api());
  }

  StreamController<T> _outController = StreamController<T>();
  StreamSink<T> get outSink => _outController.sink;
  Stream<T> get outStream => _outController.stream;

  StreamController<Api> _inController = StreamController<Api>();
  StreamSink<Api> get inSink => _inController.sink;

  mapEventToState(Api api);

  dispose(){
    _outController.close();
    _inController.close();
    print('/////////////////////////////////////////DISPOSE');
  }

}