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

   Future uploadAnyFile(String fileFolder, File file) async {
    try{
      StorageReference storageReference = FirebaseStorage.instance
          .ref()
          .child(fileFolder);
      StorageUploadTask uploadTask = storageReference.putFile(file);
      await uploadTask.onComplete;
      uploadTask.isComplete==true?print('\n Uploading task completed \n'):
      print('\n Uploading task Not completed \n');
      return true;
    }catch(e){
      print(e.toString());
    }
  }

   Future downloadAnyFile(String fileFolder, File file, uploadedFileURL) async {
     StorageReference storageReference = FirebaseStorage.instance
         .ref()
         .child('$fileFolder/$file');
    await storageReference.getDownloadURL().then((fileURL) {
      uploadedFileURL = fileURL;
    });
    return await uploadedFileURL;
  }
}
