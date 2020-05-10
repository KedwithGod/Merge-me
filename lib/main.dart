import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import './Model/Imagehandling.dart';
import './Model/FirebaseStorage.dart';
import 'Model/FirebaseStorage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestorer
import 'package:path/path.dart' as Path;

void main() => runApp(MyApp());

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
      home: MyHomePage(title: 'Test project 1'),
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

  File _image;
  String _uploadedFileURL;

  Future downloadFile() async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('/Onboarding screen images/Search work.jpg}');
    storageReference.getDownloadURL().then((fileURL) {
      _uploadedFileURL = fileURL;
    });
  }





  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width= MediaQuery.of(context).size.width;
    print ('this is width $width');
    print ('and here comes the height $height');
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore File Upload proj'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[

        GeneralTextDisplay('Select image', Color.fromRGBO(121, 121, 121,1.0), 1,28.0 , FontWeight.w400, 'Description text'),
        _image != null
            ? Image.asset(
          _image.path,
          height: 150,
        )
            : Container(height: 150),
        RaisedButton(
                    child: Text('get imaege File'),
                    onPressed: downloadFile,
                    color: Colors.cyan,
                  ),
            _image != null
                ? RaisedButton(
                    child: Text('Clear Selection'),
                    onPressed: null,
                  )
                : Container(),
            Text('Uploaded Image'),
            _uploadedFileURL != null
                ? Image.network(
                    _uploadedFileURL,
                    height: 150,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
