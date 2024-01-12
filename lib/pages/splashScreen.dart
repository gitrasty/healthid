import 'package:flutter/material.dart';
import 'package:healthid/pages/welcome/welcomeScreen.dart';
import 'package:provider/provider.dart';
import '../bloc/signInBloc.dart';
import '../component/next_screen.dart';
import 'login.dart';


class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin{

  late AnimationController _controller;



  afterSplash(){
    final SignInBloc sb = context.read<SignInBloc>();
    Future.delayed(Duration(milliseconds: 1000)).then((value){
      sb.isSignedIn == true || sb.guestUser == true
          ?  gotoHomePage()
          : gotoSignInPage();

    });
  }


  gotoHomePage () {
    final SignInBloc sb = context.read<SignInBloc>();
    if(sb.isSignedIn == true){
      sb.getDataFromSp();
    }
    nextScreenReplace(context, welcomeScreen()//HomePage()
    );
  }




  gotoSignInPage (){
    nextScreenReplace(context, welcomeScreen()//SignInPage()
    );
  }






  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _controller.forward();
    afterSplash();
  }






  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }









  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child:
          RotationTransition(

              turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
              child: Text('splash')
              // Image(
              //   image: AssetImage(Config().splashIcon),
              //   height: 140,
              //   width: 140,
              //   fit: BoxFit.contain,
              // )
          ),
        ));
  }
}
