import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:mergeme/Model/UserModel/Post.dart';
import 'package:mergeme/Model/UserModel/userModel.dart';

class FireStoreService {
  final CollectionReference _usersCollectionReference =
  Firestore.instance.collection('DataBase');


  CollectionReference get userCollectionReference => _usersCollectionReference;
  final CollectionReference _postsCollectionReference =
  Firestore.instance.collection('posts');

  final StreamController<List<Post>> _postsController =
  StreamController<List<Post>>.broadcast();

  final StreamController<
      List<PostJobDetails>> _dataFromFireStore = StreamController<
      List<PostJobDetails>>.broadcast();

  Stream get dataFromFireStore => _dataFromFireStore.stream;

/*
  final StreamController<
      User _dataFromDatabase = StreamController<
      User>.broadcast();

  Stream get dataFromDatabase => _dataFromDatabase.stream;*/

  Future createUser(User user) async {
    try {
      await _usersCollectionReference.document(user.id).setData(user.toJson());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future saveData(Map value, String collectionName ) async {
    try {
      await  Firestore.instance.collection(collectionName).add(value);
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Stream listenToJobPosterDataRealTime(collectionName) {
    // Register the handler for when the posts data changes
    Firestore.instance.collection(collectionName).snapshots().listen((snapshot) {
      if (snapshot.documents.isNotEmpty) {
        var dataSnapshot = snapshot.documents
            .map((snapshot) => PostJobDetails.fromData(snapshot.data, snapshot.documentID))
            .toList();

        // Add the posts onto the controller
        _dataFromFireStore.add(dataSnapshot );
      }
    });

    return  _dataFromFireStore.stream;
  }

 /* Stream listenToJobPosterName(documentName) {
    // Register the handler for when the posts data changes
    Firestore.instance.collection('DataBase').document(documentName).snapshots().listen((snapshot) {
      if (snapshot.data.isNotEmpty ) {
        var dataSnapshot = snapshot.data.forEach((key, value) {User.fromData(snapshot.data);});

        // Add the posts onto the controller
        _dataFromFireStore.add(dataSnapshot);
      }
    });

    return  _dataFromFireStore.stream;
  }*/





  retrieveDocumentSnapshot(String collectionName,String documentName ){
    return Firestore.instance.collection(collectionName).document(documentName
    ).snapshots();
  }

  retrieveCollectionSnapshot(String collectionName){
    return Firestore.instance.collection(collectionName).getDocuments();
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.document(uid).get();
      return User.fromData(userData.data);
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }



  Future addPost(Post post) async {
    try {
      await _postsCollectionReference.add(post.toMap());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future getPostsOnceOff() async {
    try {
      var postDocumentSnapshot = await _postsCollectionReference.getDocuments();
      if (postDocumentSnapshot.documents.isNotEmpty) {
        return postDocumentSnapshot.documents
            .map((snapshot) => Post.fromMap(snapshot.data, snapshot.documentID))
            .where((mappedItem) => mappedItem.title != null)
            .toList();
      }
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Stream listenToPostsRealTime() {
    // Register the handler for when the posts data changes
    _postsCollectionReference.snapshots().listen((postsSnapshot) {
      if (postsSnapshot.documents.isNotEmpty) {
        var posts = postsSnapshot.documents
            .map((snapshot) => Post.fromMap(snapshot.data, snapshot.documentID))
            .where((mappedItem) => mappedItem.title != null)
            .toList();

        // Add the posts onto the controller
        _postsController.add(posts);
      }
    });

    return _postsController.stream;
  }

  Future deletePost(String documentId) async {
    await _postsCollectionReference.document(documentId).delete();
  }

  Future updatePost(Post post) async {
    try {
      await _postsCollectionReference
          .document(post.documentId)
          .updateData(post.toMap());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }
}
