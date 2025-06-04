import 'dart:async';
import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:flutter/services.dart';
import 'package:patagonian_employees_app/core/database/database.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(
  version: 1,
  entities: [EmployeeDto],
)
abstract class AppDatabase extends FloorDatabase {
  EmployeeDao get employeesDao;
  
  static late AppDatabase instance;

  static Future<AppDatabase> init(String name) async {
    instance = await $FloorAppDatabase.databaseBuilder(name).addCallback(
      Callback(
        onCreate: (database, version) async {
          // This method is only called when the database is first created.
          await _prepopulateDb(database);
        },
      ),
    ).build();
    return instance;
  }

  static Future<void> _prepopulateDb(sqflite.DatabaseExecutor database) async {
    // Pre-populate the database with employees from a JSON seed file.
    final jsonString = await rootBundle.loadString('assets/employees.json');
    final jsonList = json.decode(jsonString) as List;
    final employees = jsonList.map((json) => EmployeeDto.fromJson(json)).toList();

    for (final employee in employees) {
      // Insert the employee into the database.
      await InsertionAdapter(
        database,
        'employees',
        (EmployeeDto item) => <String, Object?>{
          'id': item.id,
          'name': item.name,
          'email': item.email,
          'password': item.password,
          'job_title': item.jobTitle,
        },
      ).insert(employee, OnConflictStrategy.replace);
    }
  }
}
