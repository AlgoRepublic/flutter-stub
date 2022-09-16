import 'package:base_project/presentations/authentication/cubit/authentication_cubit_cubit.dart';
import 'package:base_project/presentations/splash/splash_view.dart';
import 'package:base_project/repositories/authentication_repository.dart';
import 'package:base_project/src/utils/network_client.dart';
import 'package:base_project/src/language/languages.dart';
import 'package:base_project/src/language/locales.dart';
import 'package:base_project/src/theme/theme.dart';
import 'package:base_project/src/utils/global_constants.dart';
import 'package:base_project/src/utils/notifications_setup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    NotificationSetup().initNotification();
    NotificationSetup().firebaseNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(
        AuthenticationRepository(
          NetworkClient(
            getUserAuthToken: getUserToken,
          ),
        ),
      ),
      child: GetMaterialApp(
        title: appTitle,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.getTheme(),
        translations: Languages(),
        locale: engLocale,
        fallbackLocale: engLocale,
        supportedLocales: const [
          engLocale,
          urLocale,
        ],
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        home: const SplashView(),
      ),
    );
  }

  Future<String?> getUserToken() async {
    return Future.value('');
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}
