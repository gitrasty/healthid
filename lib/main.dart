import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_kurdish_localization/kurdish_cupertino_localization_delegate.dart';
import 'package:flutter_kurdish_localization/kurdish_widget_localization_delegate.dart';
import 'package:healthid/pages/splashScreen.dart';

import 'package:provider/provider.dart';

import 'bloc/InternetBloc.dart';
import 'bloc/signInBloc.dart';
import 'package:flutter_kurdish_localization/kurdish_material_localization_delegate.dart';
import 'language/localizations/localezations_constant.dart';
import 'language/localizations/localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Locale _locale=Locale('en');
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<InternetBloc>(create: (context) => InternetBloc(),),
        ChangeNotifierProvider<SignInBloc>(create: (context) => SignInBloc(),),
        // ChangeNotifierProvider<RegisterBloc>(create: (context) => RegisterBloc()),

      ],
      child: MaterialApp(
          locale: _locale,
          supportedLocales: const [Locale('en'), Locale('ku'),Locale('ar')],
          localizationsDelegates: [
            AppLocalizations.delegate,
            KurdishMaterialLocalizations.delegate,
            KurdishWidgetLocalizations.delegate,
            KurdishCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          // supportedLocales: context.supportedLocales,
          // localizationsDelegates: context.localizationDelegates,
          // locale: context.locale,
          theme: ThemeData(
              primarySwatch: Colors.blue,
              primaryColor: Colors.blueAccent,
              iconTheme: IconThemeData(color: Colors.grey[900]),
              fontFamily: 'Muli',
              scaffoldBackgroundColor: Colors.grey[100],
              appBarTheme: AppBarTheme(
                color: Colors.white,
                elevation: 0,
                iconTheme: IconThemeData(
                  color: Colors.grey[800],
                ),
                // brightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
                // textTheme: TextTheme(
                //     headline6: GoogleFonts.montserrat(
                //       fontSize: 18,
                //       color: Colors.grey[900],
                //       fontWeight: FontWeight.w500
                //     )),

              )),
          debugShowCheckedModeBanner: false,
          home: SplashPage()),
    );
  }
}

