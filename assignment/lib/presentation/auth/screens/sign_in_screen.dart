import 'package:assignment/core/contants/string_constants.dart';
import 'package:assignment/core/utils/validators.dart';
import 'package:assignment/presentation/auth/bloc/signin_bloc/signin_bloc.dart';
import 'package:assignment/presentation/auth/bloc/signin_bloc/signin_event.dart';
import 'package:assignment/presentation/auth/bloc/signin_bloc/signin_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SigninBloc, SigninState>(
        listener: (context, state) {
          if (state is SigninSuccess) {
            context.go('/home');
          } else if (state is SigninFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          final bool isLoading = state is SigninLoading;

          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text(
                      StringConstants.welcome,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4A56A4),
                      ),
                    ),
                    const SizedBox(height: 30),

                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: StringConstants.enterEmail,
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                      ),
                      validator: Validators.email,
                    ),
                    const SizedBox(height: 20),

                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: StringConstants.enterPassword,
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                      ),
                      validator: Validators.password,
                    ),
                    const SizedBox(height: 40),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4A56A4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: isLoading
                            ? null
                            : () {
                                if (formKey.currentState!.validate()) {
                                  context.read<SigninBloc>().add(
                                    SignInEvent(
                                      emailController.text.trim(),

                                      passwordController.text.trim(),
                                    ),
                                  );
                                }
                              },
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                StringConstants.signIn,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 12),

                   
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(StringConstants.noAccount),
                        TextButton(
                          onPressed: () {
                            context.go('/signup');
                          },
                          child: Text(StringConstants.signUp),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
