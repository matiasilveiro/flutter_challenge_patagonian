import 'package:go_router/go_router.dart';
import 'package:patagonian_employees_app/employee/presentation/presentation.dart';
import 'package:patagonian_employees_app/employee/presentation/routes.dart';
import 'package:patagonian_employees_app/login/presentation/presentation.dart';
import 'package:patagonian_employees_app/login/presentation/routes.dart';

final appRouter = GoRouter(
  initialLocation: LoginRoutes.signIn,
  routes: [
    GoRoute(
      name: LoginRoutes.signIn,
      path: LoginRoutes.signIn,
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      name: EmployeesRoutes.home,
      path: EmployeesRoutes.home,
      builder: (context, state) => const HomePage(),
    ),
  ],
);
