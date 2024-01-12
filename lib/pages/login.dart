import 'dart:io';
 import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthid/language/localizations/localizations.dart';
// import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import '../bloc/InternetBloc.dart';
import '../bloc/signInBloc.dart';
import '../component/next_screen.dart';
import '../component/snacbar.dart';
import '../windget/language.dart';
import 'doneScreen.dart';
//import 'package:easy_localization/easy_localization.dart';import 'package:asansafar/widgets/language.dart';



class SignInPage extends StatefulWidget {

  final String? tag;
  const  SignInPage({Key? key, this.tag}) : super(key: key);

  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  bool googleSignInStarted = false;
  bool facebookSignInStarted = false;
  bool appleSignInStarted = false;

  var scaffoldKey = GlobalKey<ScaffoldState>();


  handleSkip (){
    final sb = context.read<SignInBloc>();
    sb.setGuestUser();
    nextScreen(context, DonePage());

  }


  handleGoogleSignIn() async{
    final sb = context.read<SignInBloc>();
    final ib = context.read<InternetBloc>();
    setState(() =>googleSignInStarted = true);
    await ib.checkInternet();
    if(ib.hasInternet == false){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('check your internet connection!'),
          action: SnackBarAction(
            label: ' ',
            onPressed: () {
              // Code to execute.
            },
          ),
        ),
      );

      // openSnacbar(scaffoldKey, 'check your internet connection!'.tr());

    }else{
      await sb.signInWithGoogle().then((_){
        if(sb.hasError == true){
          // openSnacbar(scaffoldKey, 'something is wrong. please try again.'.tr());
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('something is wrong. please try again.'),
              action: SnackBarAction(
                label: ' ',
                onPressed: () {
                  // Code to execute.
                },
              ),
            ),
          );
          setState(() =>googleSignInStarted = false);


        }else {
          sb.checkUserExists().then((value){
            if(value == true){
              sb.getUserDatafromFirebase(sb.uid)
                  .then((value) => sb.saveDataToSP()
                  .then((value) => sb.guestSignout())
                  .then((value) => sb.setSignIn()
                  .then((value){
                setState(() =>googleSignInStarted = false);
                afterSignIn();
              })));
            } else{
              sb.getJoiningDate()
                  .then((value) => sb.saveToFirebase()
                  .then((value) => sb.increaseUserCount())
                  .then((value) => sb.saveDataToSP()
                  .then((value) => sb.guestSignout()
                  .then((value) => sb.setSignIn()
                  .then((value){
                setState(() => googleSignInStarted = false);
                afterSignIn();
              })))));
            }
          });

        }
      });
    }
  }


  ///facebook sign in
  // handleFacebookSignIn() async{
  //   final sb = context.read<SignInBloc>();
  //   final ib = context.read<InternetBloc>();
  //   setState(() =>facebookSignInStarted = true);
  //   await ib.checkInternet();
  //   if(ib.hasInternet == false){
  //     openSnacbar(scaffoldKey, 'check your internet connection!'.tr(context));
  //
  //   }else{
  //     await sb.signInwithFacebook().then((_){
  //       if(sb.hasError == true){
  //         openSnacbar(scaffoldKey, 'something is wrong. please try again.'.tr(context));
  //         setState(() =>facebookSignInStarted = false);
  //
  //       }else {
  //         sb.checkUserExists().then((value){
  //         if(value == true){
  //           sb.getUserDatafromFirebase(sb.uid)
  //           .then((value) => sb.saveDataToSP()
  //           .then((value) => sb.guestSignout())
  //           .then((value) => sb.setSignIn()
  //           .then((value){
  //             setState(() =>facebookSignInStarted = false);
  //             afterSignIn();
  //           })));
  //         } else{
  //           sb.getJoiningDate()
  //           .then((value) => sb.saveToFirebase()
  //           .then((value) => sb.increaseUserCount())
  //           .then((value) => sb.saveDataToSP()
  //           .then((value) => sb.guestSignout()
  //           .then((value) => sb.setSignIn()
  //           .then((value){
  //             setState(() =>facebookSignInStarted = false);
  //             afterSignIn();
  //           })))));
  //         }
  //           });
  //
  //       }
  //     });
  //   }
  // }

  ///apple signin
  handleAppleSignIn() async{
    final sb = context.read<SignInBloc>();
    final ib = context.read<InternetBloc>();
    setState(() =>appleSignInStarted = true);
    await ib.checkInternet();
    if(ib.hasInternet == false){
      openSnacbar(scaffoldKey, 'check your internet connection!'.tr(context));

    }else{
      await sb.signInWithApple().then((_){
        if(sb.hasError == true){
          openSnacbar(scaffoldKey, 'something is wrong. please try again.'.tr(context));
          setState(() =>appleSignInStarted = false);

        }else {
          sb.checkUserExists().then((value){
            if(value == true){
              sb.getUserDatafromFirebase(sb.uid)
                  .then((value) => sb.saveDataToSP()
                  .then((value) => sb.guestSignout())
                  .then((value) => sb.setSignIn()
                  .then((value){
                setState(() =>appleSignInStarted = false);
                afterSignIn();
              })));
            } else{
              sb.getJoiningDate()
                  .then((value) => sb.saveToFirebase()
                  .then((value) => sb.increaseUserCount())
                  .then((value) => sb.saveDataToSP()
                  .then((value) => sb.guestSignout()
                  .then((value) => sb.setSignIn()
                  .then((value){
                setState(() =>appleSignInStarted = false);
                afterSignIn();
              })))));
            }
          });

        }
      });
    }
  }


  afterSignIn (){
    if(widget.tag == null){
      nextScreen(context, DonePage()
      );
    }else{
      Navigator.pop(context);
    }

  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      appBar: AppBar(
        actions: [
          widget.tag != null
              ? Container()
              : MaterialButton(
              onPressed: () => handleSkip(),
              child: Text('skip'.tr(context),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )) ),

          IconButton(
            alignment: Alignment.center,
            padding: EdgeInsets.all(0),
            iconSize: 22,
            icon: Icon(Icons.language,),
            onPressed: (){
              nextScreenPopup(context, LanguagePopup());
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'welcome to'.tr(context),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.grey[700]),
                  ) ,
                  SizedBox(height: 5,),
                  Text(
                    'Health ID ',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey[700]
                    ),
                  ),
                ],
              )),
          Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Text(
                      'welcome message'.tr(context),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[700]),
                    ) ,
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 3,
                    width: MediaQuery.of(context).size.width * 0.50,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(40)),
                  ),
                ],
              )),
          Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.80,
                    child: MaterialButton(
                        onPressed: () => handleGoogleSignIn(),
                        color: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: googleSignInStarted == false
                            ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.google,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Sign In with Google',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )
                          ],
                        )
                            : Center(
                          child: CircularProgressIndicator(
                              backgroundColor: Colors.white),
                        )),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // Container(
                  //   height: 45,
                  //   width: MediaQuery.of(context).size.width * 0.80,
                  //   child: MaterialButton(
                  //       onPressed: () {
                  //         handleFacebookSignIn();
                  //       },
                  //       color: Colors.indigo,
                  //       shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(5)),
                  //       child: facebookSignInStarted == false
                  //           ? Row(
                  //               crossAxisAlignment: CrossAxisAlignment.center,
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                 Icon(
                  //                   FontAwesomeIcons.facebookF,
                  //                   color: Colors.white,
                  //                 ),
                  //                 SizedBox(
                  //                   width: 10,
                  //                 ),
                  //                 Text(
                  //                   'Sign In with Facebook',
                  //                   style: TextStyle(
                  //                       fontSize: 16,
                  //                       fontWeight: FontWeight.w600,
                  //                       color: Colors.white),
                  //                 )
                  //               ],
                  //             )
                  //           : Center(
                  //               child: CircularProgressIndicator(
                  //                   backgroundColor: Colors.white),
                  //             )),
                  // ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  Platform.isAndroid
                      ? Container()
                      : Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.80,
                    child: MaterialButton(
                        onPressed: () {
                          handleAppleSignIn();
                        },
                        color: Colors.grey[900],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: appleSignInStarted == false
                            ? Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.apple,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Sign In with Apple',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )
                          ],
                        )
                            : Center(
                          child: CircularProgressIndicator(
                              backgroundColor: Colors.white),
                        )),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05)
                ],
              )),
        ],
      ),
    );
  }




}
