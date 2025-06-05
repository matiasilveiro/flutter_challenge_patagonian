// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:patagonian_employees_app/core/core.dart' as _i432;
import 'package:patagonian_employees_app/core/preferences/preferences_manager.dart'
    as _i642;
import 'package:patagonian_employees_app/employee/data/repository/local_employee_repository.dart'
    as _i443;
import 'package:patagonian_employees_app/employee/domain/domain.dart' as _i332;
import 'package:patagonian_employees_app/employee/domain/usecase/get_current_employee_use_case.dart'
    as _i616;
import 'package:patagonian_employees_app/employee/domain/usecase/sign_out_use_case.dart'
    as _i46;
import 'package:patagonian_employees_app/employee/presentation/cubit/home_cubit.dart'
    as _i77;
import 'package:patagonian_employees_app/login/data/repository/local_users_repository.dart'
    as _i1070;
import 'package:patagonian_employees_app/login/domain/domain.dart' as _i808;
import 'package:patagonian_employees_app/login/domain/usecase/sign_in_use_case.dart'
    as _i915;
import 'package:patagonian_employees_app/login/presentation/cubit/sign_in_cubit.dart'
    as _i809;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i642.PreferencesManager>(() => _i642.PreferencesManager());
    gh.factory<_i808.UsersRepository>(
        () => _i1070.LocalUsersRepositoryImpl(gh<_i432.EmployeeDao>()));
    gh.factory<_i46.SignOutUseCase>(
        () => _i46.SignOutUseCase(gh<_i432.PreferencesManager>()));
    gh.factory<_i332.EmployeeRepository>(
        () => _i443.LocalEmployeeRepository(gh<_i432.EmployeeDao>()));
    gh.factory<_i915.SignInUseCase>(() => _i915.SignInUseCase(
          gh<_i808.UsersRepository>(),
          gh<_i432.PreferencesManager>(),
        ));
    gh.factory<_i616.GetCurrentEmployeeUseCase>(
        () => _i616.GetCurrentEmployeeUseCase(
              gh<_i332.EmployeeRepository>(),
              gh<_i432.PreferencesManager>(),
            ));
    gh.factory<_i77.HomeCubit>(() => _i77.HomeCubit(
          gh<_i332.GetCurrentEmployeeUseCase>(),
          gh<_i332.SignOutUseCase>(),
        ));
    gh.factory<_i809.SignInCubit>(
        () => _i809.SignInCubit(gh<_i808.SignInUseCase>()));
    return this;
  }
}
