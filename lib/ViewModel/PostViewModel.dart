/*
import 'package:mergeme/Model/Service/Navigator_service.dart';
import 'package:mergeme/Model/Service/dialog_service.dart';
import 'package:mergeme/Model/Service/firestore_service.dart';
import 'package:mergeme/Model/Service/locator_setup.dart';
import 'package:mergeme/Model/UserModel/Post.dart';

import 'BaseModel.dart';

class CreatePostViewModel extends BaseModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigatorService _navigationService = locator<NavigatorService>();

  Post _edittingPost;

  bool get _editting => _edittingPost != null;

  Future addPost({String title}) async {
    setBusy(true);

    var result;

    if (!_editting) {
      result = await _firestoreService
          .addPost(Post(title: title, userId: currentUser.id));
    } else {
      result = await _firestoreService.updatePost(Post(
        title: title,
        userId: _edittingPost.userId,
        documentId: _edittingPost.documentId,
      ));
    }

    setBusy(false);

    if (result is String) {
      await _dialogService.showDialog(
        title: 'Cound not create post',
        description: result,
      );
    } else {
      await _dialogService.showDialog(
        title: 'Post successfully Added',
        description: 'Your post has been created',
      );
    }

    _navigationService.goBack();
  }

  void setEdittingPost(Post edittingPost) {
    _edittingPost = edittingPost;
  }
}
*/
