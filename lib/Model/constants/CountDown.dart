import 'dart:async';

import 'package:quiver/async.dart';

class CountDown{

  final StreamController
  _timerStream = StreamController.broadcast(
  );
  Stream get timerStream=>_timerStream.stream;


  Stream loadingWidget(_elapsed,seconds){
 try{   final cd = CountdownTimer(Duration(seconds: seconds), Duration(seconds: 1));
 cd.listen((data) {
   _elapsed = cd.elapsed.inSeconds;
   _timerStream.add(_elapsed);
 }, onDone: () {
   cd.cancel();
   _timerStream.close();
 });
 return _timerStream.stream;
  }catch(e){
    print('error form loading widget:${e.toString()}');  }
  }


  dispose() {
   return _timerStream.close();
  }


  final StreamController
  _initStream = StreamController.broadcast(
  );
  Stream get initStream=>_initStream.stream;


  Stream initLoading(_elapsed,seconds){
    try{   final cd = CountdownTimer(Duration(seconds: seconds), Duration(seconds: 1));
    cd.listen((data) {
      _elapsed = cd.elapsed.inSeconds;
      _initStream.add(_elapsed);
    }, onDone: () {
      cd.cancel();
    });
    return _initStream.stream;
    }catch(e){
      print('error form loading widget:${e.toString()}');  }
  }


  initDispose() {
    return _initStream.close();
  }
}