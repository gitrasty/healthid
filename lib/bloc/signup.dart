import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseAuthHelper {

  static Future<User?> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
required    String account,
    required    String context

  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;
      await user!.updateProfile(displayName: name);
      await user.reload();
      user = auth.currentUser;
      usersFirestore(user!, account);



    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    return user;
  }

  static Future usersFirestore(User user,String account){
    return FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      'username': user.displayName,
      'email':user.email,
      'account': account,
      'userId':user.uid,
      'imageurl':'https://firebasestorage.googleapis.com/v0/b/health-id-99bd5.appspot.com/o/users%2Fuser.png?alt=media&token=e48951e5-037b-4d43-ad5b-fdd2925ad992',

    });

  }





  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }

    return user;
  }

}