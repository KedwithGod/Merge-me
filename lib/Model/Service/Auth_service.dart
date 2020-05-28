import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:mergeme/Model/UserModel/userModel.dart';
import 'package:mergeme/Model/UserModel/Post.dart';
import 'firestore_service.dart';
import 'locator_setup.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FireStoreService _fireStoreService =locator<FireStoreService>();

  User _currentUser;
  User get currentUser => _currentUser;

  // making user data available
  Future _populateCurrentUser(FirebaseUser user) async {
    if (user != null) {
      _currentUser = await _fireStoreService.getUser(user.uid);
    }
  }

  // get user name at welcome back
  welcomeBack() async{
    var user = await _firebaseAuth.currentUser();
    await _populateCurrentUser(user);
  }
  UserId _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? UserId( user.uid) : null;
  }

// get user data at login
  Stream<UserId> get userValue {
    return _firebaseAuth .onAuthStateChanged
    //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

// check if user is log in
  Future<bool> isUserLoggedIn() async {
    var user = await _firebaseAuth.currentUser();
    await _populateCurrentUser(user);
    return user != null;
  }

  // Login with email and password

  Future loginWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _populateCurrentUser(user.user);
      return user != null;
    } catch (e) {
      return e.message;
    }
  }

  // sign up with email and password
  Future signUpWithEmail({
    @required String email,
    @required String password,
    @required String fullName,
    @required String mobileNo,
    String workNumber,
     String tradeName,
     String nin,
     String tutorOption,
     String tradeCategory,
      String specificTrade,
  }) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // create a new user profile on firestore
      _currentUser = User(password,mobileNo,workNumber,
          tradeName,
          nin,
          tutorOption,
          tradeCategory,
          authResult.user.uid,
          fullName,
          email,
          specificTrade
      );
      User user;
      

      await _fireStoreService.createUser(_currentUser);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

}