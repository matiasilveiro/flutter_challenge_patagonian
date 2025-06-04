import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:patagonian_employees_app/core/core.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: false,
  asExtension: true,
)
Future<void> configureDependencies() async {
  await AppDatabase.init('app_database.db');

  getIt.registerSingleton<EmployeeDao>(AppDatabase.instance.employeesDao);

  getIt.init();
}
