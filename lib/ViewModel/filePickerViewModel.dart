import 'dart:io';
import 'package:mergeme/Model/constants/route_path.dart' as route;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mergeme/Model/Service/Navigator_service.dart';
import 'package:mergeme/Model/Service/localStorage_service.dart';
import 'package:mergeme/Model/Service/locator_setup.dart';
import 'package:mergeme/ViewModel/BaseModel.dart';

class FilePickerViewModel extends BaseModel{
  final NavigatorService _navigationService = locator<NavigatorService>();
  final LocalStorageService _storageService = locator<LocalStorageService>();
  String fileName;
  String path;
  Map<String, String> paths;
  String extension;
  bool loadingPath = false;
  bool multiPick = false;
  FileType pickingType = FileType.any;
  File file;
  int length;


  bool get mounted => path != null || paths!=null;

  openFileExplorer() async {
    loadingPath = true;
    notifyListeners();
    try {
      if (multiPick) {
        path = null;
        paths = await FilePicker.getMultiFilePath(
            type: pickingType,
            allowedExtensions: (extension?.isNotEmpty ?? false)
                ? extension?.replaceAll(' ', '')?.split(',')
                : null);
        // Storing file in Storage service
        paths!=null? paths.forEach((key, value) async {file=File(value);
        length++;
        notifyListeners();
        await _storageService.setUser('${route.PostJobMultiplePaths}+$length', file);
        }):null;
        await _storageService.setUser(route.LengthOfFileUploaded, length);

      } else {
        paths = null;
        path = await FilePicker.getFilePath(
            type: pickingType,
            allowedExtensions: (extension?.isNotEmpty ?? false)
                ? extension?.replaceAll(' ', '')?.split(',')
                : null);
         path!=null? file=File(path):file=null;
         await _storageService.setUser(route.PostJobFilePath, file);

      }
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) return;
      loadingPath = false;
      fileName = path != null ? path.split('/').last : paths != null ? paths.keys.toString() : '...';
      notifyListeners();
  }



  void clearCachedFiles( _scaffoldKey) {
    FilePicker.clearTemporaryFiles().then((result) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          backgroundColor: result ? Colors.green : Colors.red,
          content: Text((result ? 'Temporary files removed with success.' : 'Failed to clean temporary files')),
        ),
      );
    });
  }

  selectFolder() {
    FilePicker.getDirectoryPath().then((value) {
       path = value;
       notifyListeners();
    });

  }

  // updating any value in the FilePicker page
  updatePickType(newValue){
    pickingType=newValue;
    notifyListeners();
  }

  updateMultiPick(newValue){
   multiPick=newValue;
    notifyListeners();
  }
  updateController( oldValue,newValue){
    oldValue=newValue;
    notifyListeners();
  }
  updateExtension(newValue){
    extension=newValue;
    notifyListeners();
  }


}


