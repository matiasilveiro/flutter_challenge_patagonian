import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:patagonian_employees_app/core/core.dart';
import 'package:patagonian_employees_app/employee/presentation/presentation.dart';
import 'package:patagonian_employees_app/login/presentation/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cubit = getIt<HomeCubit>();

  @override
  void initState() {
    super.initState();

    cubit.getCurrentEmployee();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit,
      child: BlocConsumer<HomeCubit, HomeState>(
        listenWhen: (_, current) =>
            current.errorMessage != null || current.loggedOut,
        listener: _onStateChanged,
        builder: (context, state) {
          return LoadingScreen(
            isLoading: state.isLoading,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Employee Details'),
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: state.when<Widget>(
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    error: (message) => Center(child: Text('Error: $message')),
                    success: (employee) => Column(
                      children: [
                        EmployeeDetails(employee),
                        const Spacer(),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: _onLogout,
                            icon: const Icon(Icons.logout),
                            label: const Text("Log out"),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _onStateChanged(BuildContext context, HomeState state) {
    if (state.errorMessage != null) {
      _showSnackBar(state.errorMessage!);
    }
    if (state.loggedOut) {
      context.pushReplacementNamed(LoginRoutes.signIn);
    }
  }

  void _onLogout() {
    cubit.signOut();
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
