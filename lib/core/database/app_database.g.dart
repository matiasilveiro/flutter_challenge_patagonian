// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  EmployeeDao? _employeesDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `employees` (`id` INTEGER NOT NULL, `email` TEXT NOT NULL, `password` TEXT NOT NULL, `name` TEXT NOT NULL, `job_title` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE UNIQUE INDEX `index_employees_email` ON `employees` (`email`)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  EmployeeDao get employeesDao {
    return _employeesDaoInstance ??= _$EmployeeDao(database, changeListener);
  }
}

class _$EmployeeDao extends EmployeeDao {
  _$EmployeeDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _employeeDtoInsertionAdapter = InsertionAdapter(
            database,
            'employees',
            (EmployeeDto item) => <String, Object?>{
                  'id': item.id,
                  'email': item.email,
                  'password': item.password,
                  'name': item.name,
                  'job_title': item.jobTitle
                }),
        _employeeDtoUpdateAdapter = UpdateAdapter(
            database,
            'employees',
            ['id'],
            (EmployeeDto item) => <String, Object?>{
                  'id': item.id,
                  'email': item.email,
                  'password': item.password,
                  'name': item.name,
                  'job_title': item.jobTitle
                }),
        _employeeDtoDeletionAdapter = DeletionAdapter(
            database,
            'employees',
            ['id'],
            (EmployeeDto item) => <String, Object?>{
                  'id': item.id,
                  'email': item.email,
                  'password': item.password,
                  'name': item.name,
                  'job_title': item.jobTitle
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<EmployeeDto> _employeeDtoInsertionAdapter;

  final UpdateAdapter<EmployeeDto> _employeeDtoUpdateAdapter;

  final DeletionAdapter<EmployeeDto> _employeeDtoDeletionAdapter;

  @override
  Future<List<EmployeeDto>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM employees',
        mapper: (Map<String, Object?> row) => EmployeeDto(
            id: row['id'] as int,
            email: row['email'] as String,
            password: row['password'] as String,
            name: row['name'] as String,
            jobTitle: row['job_title'] as String));
  }

  @override
  Future<EmployeeDto?> findById(int id) async {
    return _queryAdapter.query('SELECT * FROM employees WHERE id = ?1',
        mapper: (Map<String, Object?> row) => EmployeeDto(
            id: row['id'] as int,
            email: row['email'] as String,
            password: row['password'] as String,
            name: row['name'] as String,
            jobTitle: row['job_title'] as String),
        arguments: [id]);
  }

  @override
  Future<EmployeeDto?> findByEmailAndPassword(
    String email,
    String password,
  ) async {
    return _queryAdapter.query(
        'SELECT * FROM employees WHERE email = ?1 AND password = ?2',
        mapper: (Map<String, Object?> row) => EmployeeDto(
            id: row['id'] as int,
            email: row['email'] as String,
            password: row['password'] as String,
            name: row['name'] as String,
            jobTitle: row['job_title'] as String),
        arguments: [email, password]);
  }

  @override
  Future<void> insertEmployee(EmployeeDto employee) async {
    await _employeeDtoInsertionAdapter.insert(
        employee, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateEmployee(EmployeeDto employee) async {
    await _employeeDtoUpdateAdapter.update(employee, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteEmployee(EmployeeDto employee) async {
    await _employeeDtoDeletionAdapter.delete(employee);
  }
}
