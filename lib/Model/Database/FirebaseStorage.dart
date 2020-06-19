import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestorer
import 'package:path/path.dart' as Path;
import 'package:http/http.dart' as http;

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

   Future downloadAnyFile(String fileFolder,) async {
     try{
       StorageReference storageReference = FirebaseStorage.instance
           .ref()
           .child(fileFolder);
       var uploadedFileURL;
       await storageReference.getDownloadURL().then((fileURL) {
         uploadedFileURL = fileURL;

       });
       print('uploadedFileUrl: $uploadedFileURL');
       final http.Response downloadData = await http.get(uploadedFileURL );
       /* print('downloadData: $downloadData');*/
       final  fileContents = downloadData.headers;
       /* print('download body : $fileContents');*/
       final String name = await storageReference.getName();
       final String bucket = await storageReference.getBucket();
       final String path = await storageReference.getPath();
       /*print('name: $name');
     print('bucket: $bucket');
     print('path: ${File(path)}');*/
       return uploadedFileURL;
     }catch(e){
       print(e);
     }
  }
}
