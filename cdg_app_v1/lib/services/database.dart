import 'package:cdg_app_v1/services/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final List<UserData> fakeUsers = [
  UserData(
    isMainUser: 0,
    firstName: 'Admin42',
    lastName: 'Admin42',
    organization: 'Dev',
    title: 'Mr.',
    email: 'ablonde@42.dev',
    landPhone: '+0200000000',
    mobilePhone: '+0600000000',
    fax: '+0200000000',
    street: 'streetname',
    city: 'cityname',
    region: 'regionname',
    postcode: '000000',
    country: 'country',
    url: 'https://some-url.co.th',
  ),
];

/// This class contains the init method and crud operations for the sqflite package.
/// you will certainly need to change those. And you need to add error handling to show
/// the user a friendly message in a flushbar to inform him/her about the issue.

class DatabaseProvider {
  static late Database database;

  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    /// UNCOMMENT THESE TO RESET THE DATABASE WHEN YOU CHANGE THE USERDATA MODEL

    // final dbPath = await getDatabasesPath();
    // final path = join(dbPath, 'database.db');
    // await deleteDatabase(path);
    database = await openDatabase(
      join(await getDatabasesPath(), 'database.db'),
      onCreate: (db, version) async {
        return db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, isMainUser INTEGER, firstName TEXT, lastName TEXT, organization TEXT, title TEXT, email TEXT, landPhone TEXT, mobilePhone TEXT, fax TEXT, street TEXT, city TEXT, region TEXT, postcode TEXT, country TEXT, url TEXT)',
        );
      },
      version: 1,
    );
  }

  /// Inserts a new user in the database, if isMainUser is set to 1 then its a personal
  /// card, otherwise (0) its a card belonging to another user.
  Future<void> insertUser(UserData userData) async {
    try {
      await database.insert(
        'users',
        userData.toJson(),
        conflictAlgorithm: ConflictAlgorithm.abort,
      );
      if (kDebugMode) {
        print('-- INSERT USER: SUCCESS => ${userData.toString()}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('-- INSERT USER: FAILURE');
      }
      rethrow;
    }
  }

  /// This method will return all entries where "isMainUser" is (0)
  /// This is the setter for the ListView widget on the HomePage.
  Future<List<UserData>> getAllCards() async {
    try {
      final List<Map<String, dynamic>> queryResult = await database.query(
        'users',
        where: 'isMainUser = ?',
        whereArgs: [
          0
        ],
      );
      final List<UserData> users = List.generate(queryResult.length, (index) {
        return UserData.fromJson(queryResult[index]);
      });
      if (kDebugMode) {
        print('-- GET ALL USERS: SUCCESS => $users');
      }
      return users;
    } catch (e) {
      if (kDebugMode) {
        print('-- GET ALL USERS: FAILURE');
      }
      rethrow;
    }
  }

  /// This method will return all entries where "isMainUser" is (1)
  /// This is the setter for the Header widget on the HomePage.
  Future<List<UserData>> getMainUserCards() async {
    try {
      final List<Map<String, dynamic>> queryResult = await database.query(
        'users',
        where: 'isMainUser = ?',
        whereArgs: [
          1
        ],
      );
      final List<UserData> users = List.generate(queryResult.length, (index) {
        return UserData.fromJson(queryResult[index]);
      });
      if (kDebugMode) {
        print('-- GET MAIN USER CARDS: SUCCESS => $users');
      }
      return users;
    } catch (e) {
      if (kDebugMode) {
        print('-- GET MAIN USER CARDS: FAILURE');
      }
      rethrow;
    }
  }

  /// This function is designed to update the card that the main user has
  /// selected in the Edit Page. You need to perform validation and watch out
  /// for eventual sql injection.
  Future<void> updateUser(UserData userData) async {
    try {
      await database.update(
        'users',
        userData.toJson(),
        where: 'id = ?',
        whereArgs: [
          userData.id
        ],
      );
      if (kDebugMode) {
        print('-- UPDATE USER: SUCCESS => ${userData.toString()}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('-- UPDATE USER: FAILURE');
      }
      rethrow;
    }
  }

  /// Delete the card with the corresponding ID.
  Future<void> deleteUser(int id) async {
    try {
      await database.delete(
        'users',
        where: 'id = ?',
        whereArgs: [
          id
        ],
      );
      if (kDebugMode) {
        print('-- DELETE USER: SUCCESS => $id');
      }
    } catch (e) {
      if (kDebugMode) {
        print('-- DELETE USER: FAILURE');
      }
      rethrow;
    }
  }
}
