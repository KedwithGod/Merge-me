import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestorer
import 'package:path/path.dart' as Path;
import 'package:flutter/material.dart';

class Firebase {
  static Future uploadFile(String uploadedFileURL, File image) async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('/Onboarding screen images/${Path.basename(image.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      uploadedFileURL = fileURL;
    });
  }

  static Future downloadFile(uploadedFileURL) async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('/Onboarding screen images/Search work.jpg}');
    storageReference.getDownloadURL().then((fileURL) {
      uploadedFileURL = fileURL;
    });
  }
}