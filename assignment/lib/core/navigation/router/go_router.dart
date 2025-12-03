import 'package:assignment/core/di/di.dart';
import 'package:assignment/presentation/auth/bloc/sign_up_bloc/signup_bloc.dart';
import 'package:assignment/presentation/auth/screens/sign_in_screen.dart';
import 'package:assignment/presentation/auth/screens/signup_screen.dart';
import 'package:assignment/presentation/home/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'signin',
      builder: (context, state) => const SignInScreen(),
    ),

    GoRoute(
      path: '/signup',
      builder: (context, state) {
        return BlocProvider(
          create: (_) => di<SignupBloc>(),
          child: const SignupScreen(),
        );
      },
    ),

    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
