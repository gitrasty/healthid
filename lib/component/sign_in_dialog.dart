//  import 'package:flutter/material.dart';
//
// import 'package:healthid/language/localizations/localizations.dart';
//
// import '../pages/login.dart';
// import 'next_screen.dart';
// // import 'package:easy_localization/easy_localization.dart';
//
// openSignInDialog(context){
//    return showDialog(
//       context: context,
//       barrierDismissible: true,
//       builder: (ctx){
//         return AlertDialog(
//           title: Text('no sign in title'.tr(context)) ,
//           content: Text('no sign in subtitle'.tr(context)) ,
//           actions: [
//             MaterialButton(
//               onPressed: (){
//                 Navigator.pop(context);
//                 nextScreenPopup(context, SignInPage(tag: 'popup',));
//               },
//               child: Text('sign in'.tr(context)) ),
//
//               MaterialButton(
//               onPressed: (){
//
//
//                 Navigator.pop(context);
//               },
//               child: Text('cancel'.tr(context)) )
//           ],
//         );
//       }
//     );
//  }