import 'package:cdg_app_v1/pages/home.dart';
import 'package:cdg_app_v1/pages/utils/globals.dart';
import 'package:cdg_app_v1/services/database.dart';
import 'package:cdg_app_v1/services/user_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cdg_app_v1/themes/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

const exampleJson = {
  "empNo": "",
  "engTName": "",
  "thaiTName": "",
  "engName": "",
  "thaiName": "",
  "compID": "",
  "companyname": "",
  "unitname": "",
  "mobile": "",
  "email": "",
  "mainPositionEDesc": "",
  "compename": "",
  "nickName": "",
  "pathImage": "",
  "imageName": "",
  "location": "",
};

final exampleUser = UserData(
  isMainUser: 1,
  firstName: '',
  lastName: '',
  organization: '',
  title: '',
  email: '',
  landPhone: '',
  mobilePhone: '',
  fax: '',
  street: '',
  city: '',
  region: '',
  postcode: '',
  country: '',
  url: '',
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  prefs = await SharedPreferences.getInstance();
  await DatabaseProvider.initialize();
  await dotenv.load(fileName: '.env');
  // Uncomment the following line to see the widget borders in debugging.
  // debugPaintSizeEnabled = true;
  runApp(const MainApp());
}

/// This is the root widget, it should redirect to Auth if no token is
/// saved in sharedPreferences. the instance is declared in globals.dart and
/// initialized in the main function.
/// SEE: https://docs.flutter.dev/ui/layout

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final String? grant = prefs.getString('accessToken');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cdg_app_v1',
      debugShowCheckedModeBanner: false,
      navigatorKey: navKey,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        brightness: Brightness.light,
        textTheme: textTheme,
      ),
      home: SafeArea(
        child: Scaffold(
          body: HomePage(
            userData: UserData(
              isMainUser: 1,
              firstName: '',
              lastName: '',
              organization: '',
              title: '',
              email: '',
              landPhone: '',
              mobilePhone: '',
              fax: '',
              street: '',
              city: '',
              region: '',
              postcode: '',
              country: '',
              url: '',
            ),
          ),
        ),
      ),
    );
  }
}
