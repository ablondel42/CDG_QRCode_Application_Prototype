import 'dart:convert';
import 'package:cdg_app_v1/pages/home.dart';
import 'package:cdg_app_v1/pages/utils/globals.dart';
import 'package:cdg_app_v1/services/database.dart';
import 'package:cdg_app_v1/services/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cdg_app_v1/pages/widgets/components/appbar.dart';

/// This is the class responsible for fetching the employee data from
/// the API and for filling the first card based on the response. This
/// Widget needs to be updated.

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final employeeIDcontroller = TextEditingController();
  late UserData mainUser;

  Future<String?> getToken() async {
    try {
      final dio = Dio();
      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
      };
      var body = json.encode({
        "username": "admin",
        "password": "1234",
        "companyGroup": "1",
      });
      var response = await dio.post(
        'https://devabi.cdg.co.th/CDGABIApi/api/v1/Authen/GetToken',
        data: body,
        options: Options(
          headers: headers,
        ),
      );
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
    return null;
  }

  Future<Map<String, dynamic>?> getEmployeeInfos(String empno) async {
    try {
      final dio = Dio();
      final token = await getToken();
      if (token != null) {
        var headers = {
          'Accept': '*/*',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };
        var body = {
          "empno": empno,
        };
        final response = await dio.post(
          'https://devabi.cdg.co.th/CDGABIApi/api/v1/OEMS/GetEmployeeInfo',
          data: body,
          options: Options(
            headers: headers,
          ),
        );
        Map<String, dynamic> userData = response.data;
        return userData;
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    employeeIDcontroller.dispose();
    super.dispose();
  }

  void reset() async {
    employeeIDcontroller.text = '';
  }

  void submit() async {
    try {
      if (_formKey.currentState!.validate() && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Processing Data')),
        );
      }
      DatabaseProvider dbProvider = DatabaseProvider();
      final employeeData = await getEmployeeInfos(employeeIDcontroller.text);
      final newUser = UserData.fromJson(employeeData?['responsed'][0]!);
      newUser.isMainUser = 1;
      await dbProvider.insertUser(newUser);
      await prefs.setBool('userActive', true);
      setState(() {
        mainUser = newUser;
      });
      if (kDebugMode) {
        print(mainUser);
      }
      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(userData: mainUser),
          ),
        );
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Appbar(title: 'Login', showBackButton: false),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid employee ID';
                    }
                    return null;
                  },
                  controller: employeeIDcontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your employee ID',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    child: ElevatedButton(
                      onPressed: reset,
                      child: const Text('RESET'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    child: ElevatedButton(
                      onPressed: submit,
                      child: const Text('SUBMIT'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
