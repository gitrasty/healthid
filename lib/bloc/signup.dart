import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:healthid/component/next_screen.dart';
import 'package:healthid/pages/bottomBar.dart';
import 'package:healthid/pages/switchPasge.dart';

class FirebaseAuthHelper {

  static Future usersFirestore({User? user, String? account,DateTime? Birthday,String? city}){
    return FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
      'username': user.displayName,
      'email':user.email,
      'account': account,
      'userId':user.uid,
      'birthday':Birthday,
      'city':city,
      'phoneNumber':'',
      'imageurl':'https://firebasestorage.googleapis.com/v0/b/health-id-99bd5.appspot.com/o/users%2Fuser.png?alt=media&token=e48951e5-037b-4d43-ad5b-fdd2925ad992',

    });

  }





  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
    context
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      if(user!=null) {
        nextScreen(context, switchPage());
      }
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