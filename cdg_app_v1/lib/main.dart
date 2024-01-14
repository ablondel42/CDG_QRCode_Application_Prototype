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
  "empNo": "005965",
  "engTName": "Mr.",
  "thaiTName": "นาย",
  "engName": "CHURAWUT MEEKUSON",
  "thaiName": "จุฬาวุธ มีกุศล",
  "compID": "001",
  "companyname": "บริษัท คอนโทรล ดาต้า (ประเทศไทย) จำกัด",
  "unitname": "IT Corporate System Development Department",
  "mobile": "08-6651-3182",
  "email": "churawut.m@cdg.co.th",
  "mainPositionEDesc": "Application Manager",
  "compename": "Control Data (Thailand) Ltd.",
  "nickName": "ปุ๊",
  "pathImage": "http://cdgisweb.cdg.co.th/telimage",
  "imageName": "PS005965_01.jpg",
  "location": "CDG HOUSE",
};

final exampleUser = UserData(
  isMainUser: 1,
  firstName: 'นาย จุฬาวุธ มีกุศล',
  lastName: 'Mr. CHURAWUT MEEKUSON',
  organization: 'บริษัท คอนโทรล ดาต้า (ประเทศไทย) จำกัด',
  title: 'Application Manager',
  email: 'churawut.m@cdg.co.th',
  landPhone: '08-6631-3262',
  mobilePhone: '06-6651-3182',
  fax: '08-6654-1462',
  street: 'Chongnonsee Yannawa',
  city: 'Bangkok',
  region: 'Sathon',
  postcode: '10120',
  country: 'Thailand',
  url: 'https://cdg.co.th',
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
              firstName: 'นาย จุฬาวุธ มีกุศล',
              lastName: 'Mr. CHURAWUT MEEKUSON',
              organization: 'บริษัท คอนโทรล ดาต้า (ประเทศไทย) จำกัด',
              title: 'Application Manager',
              email: 'churawut.m@cdg.co.th',
              landPhone: '08-6651-3182',
              mobilePhone: '08-6651-3182',
              fax: '08-6651-3182',
              street: 'Chongnonsee',
              city: 'Bangkok',
              region: 'Sathon',
              postcode: '10120',
              country: 'Thailand',
              url: 'https://cdg.co.th',
            ),
          ),
        ),
      ),
    );
  }
}
