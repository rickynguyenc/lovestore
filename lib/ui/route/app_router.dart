import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:love_store/ui/pages/authentication/login_page.dart';
import 'package:love_store/ui/pages/home/home_page.dart';
part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, path: '/'),
    AutoRoute(page: LoginPage, path: '/login'),
    RedirectRoute(path: '*', redirectTo: '/'),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
