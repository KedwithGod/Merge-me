import 'dart:io';
import 'package:flutter/material.dart';
import 'file:///C:/Users/user/Documents/Flutter_projects/merge_me/lib/Model/Service/Waiter.dart';
import 'package:mergeme/Views/Onboarding/LearnTrade.dart';
import 'package:mergeme/Views/Onboarding/SearchJob.dart';
import 'Model/Uielements/Generaltextdisplay.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:isolate';

import 'Views/Onboarding/GiveWork.dart';



void main() {
  runApp(MyApp());}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {




    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.blue,
      ),
      home:LearnTradeOnBoarding(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  waiterFun(){
    ReceivePort rPort = ReceivePort();
    rPort.listen((message) {
      if (message is String){
        setState(() {
          read=message;
        });
        print(message);
      }
      else {
        setState(() {
          readLast=message;
        });
        print ("Pi is $message");
        rPort.close();
      }
    });
    Isolate.spawn(
        Calculate.calculatePI,rPort.sendPort
    );

  }

  File _image;
  String _imagepath;
  String _uploadedFileURL;
  String read;
  double readLast;



  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width= MediaQuery.of(context).size.width;



    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore File Upload proj'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[

        read==null?GeneralTextDisplay('Download image', Color.fromRGBO(121, 121, 121,1.0), 1,28.0 , FontWeight.w400, 'Description text'):
        GeneralTextDisplay(readLast==null?read:"$readLast", Color.fromRGBO(121, 121, 121,1.0), 1,28.0 , FontWeight.w400, 'Description text'),
        _image != null
            ? Image.network(_imagepath)
        /*Image.asset(
          _image.path,
          height: 150,
        )*/
            : Container(height: 150),
        RaisedButton(
                    child: Text('get image File'),
                    onPressed: () {waiterFun();},
                    color: Colors.cyan,
                  ),
            /*_image != null
                ? RaisedButton(
                    child: Text('Upload image'),
                    onPressed: () async{await Firebase.uploadFile(_uploadedFileURL, _image).then((onValue){
                      setState(() {
                        _uploadedFileURL=onValue;
                      });
                    });},
                  )
                : Container(),
            Text('Uploaded Image'),
            _uploadedFileURL != null
                ? Image.network(
                    _uploadedFileURL,
                    height: 150,
                  )
                : Container(),*/
          ],
        ),
      ),
    );
  }
}
