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
    gh.factory<_i808.UsersRepository>(
        () => _i1070.LocalUsersRepositoryImpl(gh<_i432.EmployeeDao>()));
    gh.factory<_i915.SignInUseCase>(
        () => _i915.SignInUseCase(gh<_i808.UsersRepository>()));
    gh.factory<_i809.SignInCubit>(
        () => _i809.SignInCubit(gh<_i808.SignInUseCase>()));
    return this;
  }
}
