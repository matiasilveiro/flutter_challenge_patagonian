import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:patagonian_employees_app/core/core.dart';
import 'package:patagonian_employees_app/core/widgets/loading_overlay.dart';
import 'package:patagonian_employees_app/employees/presentation/routes.dart';
import 'package:patagonian_employees_app/login/presentation/presentation.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final cubit = getIt<SignInCubit>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit,
      child: BlocConsumer<SignInCubit, SignInState>(
        listenWhen: (_, current) => current.errorMessage != null || current.user != null,
        listener: _onStateChanged,
        builder: (context, state) {
          return LoadingScreen(
            isLoading: state.isLoading,
            child: Scaffold(
              body: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FlutterLogo(
                        size: 200,
                        style: FlutterLogoStyle.stacked,
                      ),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'Enter valid email as abc@gmail.com',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: passwordController,
                        obscureText: !isPasswordVisible,
                        autocorrect: false,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter your secure password',
                          suffixIcon: IconButton(
                            onPressed: _togglePasswordVisibility,
                            icon: Icon(
                              isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      TextButton(
                        onPressed: _onUnimplementedFeature,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: _onUnimplementedFeature,
                        child: Text(
                          'Don\'t have an account? Sign up',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton(
                          onPressed: _onLoginButtonPressed,
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _onStateChanged(BuildContext context, SignInState state) {
    if (state.errorMessage != null) {
      _showSnackBar(state.errorMessage!);
    } else if (state.user != null) {
      context.pushReplacementNamed(EmployeesRoutes.home);
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void _onUnimplementedFeature() {
    // Hide the keyboard and navigate
    FocusManager.instance.primaryFocus?.unfocus();
    _showSnackBar('This feature is not implemented yet.');
  }

  void _onLoginButtonPressed() {
    // Hide the keyboard
    FocusManager.instance.primaryFocus?.unfocus();

    // Run the validations inside the Form-type widgets
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final credentials = LoginCredentials(
      email: emailController.text,
      password: passwordController.text,
    );
    cubit.signIn(credentials);

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
