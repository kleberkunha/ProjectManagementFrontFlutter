import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:projectmanagementflutter/pages/home.dart';
import 'package:projectmanagementflutter/pages/login.dart';
import 'package:projectmanagementflutter/pages/profile.dart';
import 'package:projectmanagementflutter/pages/register.dart';

import 'models/user_model.dart';


final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Home();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        final emailController = TextEditingController();
        final passwordController = TextEditingController();
        return Login(
          emailController: emailController,
          passwordController: passwordController,
          onPressed: () {}, // You can provide an onPressed function here
        );
      },
    ),
    GoRoute(
      path: '/profile/:id',
      builder: (BuildContext context, GoRouterState state) {
        User user = state.pathParameters['user'] as User; // Access parameters from the state
        return Profile(user);
      },
    ),
    GoRoute(
      path: '/register',
      builder: (BuildContext context, GoRouterState state) {
        final emailController = TextEditingController();
        final passwordController = TextEditingController();
        return RegistrationPage(
          emailController: emailController,
          passwordController: passwordController,
          onPressed: () {}, // You can provide an onPressed function here
        );
      },
    ),
  ],
);
