// ignore_for_file: avoid_print
import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:cdg_app_v1/main.dart';
import 'package:cdg_app_v1/pages/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

///This is the class responsible for displaying the login form from
///Microsoft Azure AD, after the user is logged in, he is redirected to
///the application Login() widget.

class Auth {
  late final config = Config(
    tenant: dotenv.env['TENANT_ID'] ?? '',
    clientId: dotenv.env['CLIENT_ID'] ?? '',
    redirectUri: dotenv.env['REDIRECT_URL'] ?? '',
    scope: 'openid profile offline_access User.read',
    navigatorKey: navKey,
    loader: const Center(child: CircularProgressIndicator()),
  );

  Future<void> login(BuildContext context) async {
    try {
      final AadOAuth oauth = AadOAuth(config);
      final result = await oauth.login();
      result.fold(
        (failure) => print(failure.toString()),
        (token) => print('$token'),
      );
      String? grant = await oauth.getAccessToken();
      await prefs.setString('accessToken', grant ?? '');
      // if (context.mounted) {
      //   Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => const Login(),
      //     ),
      //   );
      // }
    } catch (error) {
      print(error);
    }
  }

  void logout(BuildContext context) async {
    final AadOAuth oauth = AadOAuth(config);
    await prefs.remove('activeUser');
    await prefs.remove('accessToken');
    await oauth.logout();
    if (context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MainApp(),
        ),
      );
    }
  }
}

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  late final config = Config(
    tenant: dotenv.env['TENANT_ID'] ?? '',
    clientId: dotenv.env['CLIENT_ID'] ?? '',
    redirectUri: dotenv.env['REDIRECT_URL'] ?? '',
    scope: 'openid profile offline_access User.read',
    navigatorKey: navKey,
    loader: const Center(child: CircularProgressIndicator()),
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => Auth().login(context));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
