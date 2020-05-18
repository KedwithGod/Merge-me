import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestorer
import 'package:path/path.dart' as Path;

class Firebase {
  static Future uploadFile(String uploadedFileURL, File image) async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('/Views.Onboarding screen images/${Path.basename(image.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      uploadedFileURL = fileURL;
    });
    return uploadedFileURL;
  }

  static Future downloadFile(uploadedFileURL) async {
    StorageReference storageReference = FirebaseStorage().ref();
    var uploadedFileURL = await storageReference
        .child("Views.Onboarding screen images")
        .child("Search work")
        .getDownloadURL();
    return uploadedFileURL;
  }
}