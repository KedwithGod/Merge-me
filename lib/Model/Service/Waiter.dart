import "dart:isolate";


class Calculate{
  static void calculatePI(SendPort sPort){
    int iters =1000;
    double s=1.0;
    double den=3.0;
    double neg=-1.0;

    for (int i=0; i<iters; i++){
      s+=(neg*(1/den));
      den+=2.0;
      neg*=-1.0;
      for ( double j=0.0; j<0.99; j=j+0.10){
        if (i/iters==j){
          sPort.send("${i/iters*100}% Complete");
        }
      }


    }
    double pi=4*s;
    sPort.send(pi);

  }

 void waiterFun() {
   ReceivePort rPort = ReceivePort();
   rPort.listen((message) {
     if (message is String) {
       print(message);
       return message;
     }
     else {
       print("Pi is $message");
       rPort.close();
       return message;
     }
   });
   Isolate.spawn(
       Calculate.calculatePI, rPort.sendPort
   );
 }}