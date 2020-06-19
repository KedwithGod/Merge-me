import 'package:data_connection_checker/data_connection_checker.dart';

class Main{



    Future<bool> networkStat() async{
      return await DataConnectionChecker().hasConnection;
    }
    // returns a bool
    Future<DataConnectionStatus> networkNum() async {
      return await DataConnectionChecker().connectionStatus;
    }

    // prints either DataConnectionStatus.connected
    // or DataConnectionStatus.disconnected

    // This returns the last results from the last call
    // to either hasConnection or connectionStatus
    /*print("Last results: ${DataConnectionChecker().lastTryResults}");

    // actively listen for status updates


    // close listener after 30 seconds, so the program doesn't run forever
    await Future.delayed(Duration(seconds: 30));
    await listener.cancel();*/

  listener(data) {
    var listen= DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          data=true;
          return data;
          break;
        case DataConnectionStatus.disconnected:
          data=false;
          return data;
          break;
      }

    });
    return listen;
  }

}