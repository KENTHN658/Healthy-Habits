import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobiletest3/views/home/home_view.dart';
import 'package:mobiletest3/views/home/sub_home_view.dart';

import 'package:mobiletest3/views/settings/settings_view.dart';
import 'package:mobiletest3/views/settings/sub_setting_view.dart';

import 'package:mobiletest3/views/walk/walk_setting_view.dart';
import 'package:mobiletest3/views/walk/walk_view.dart';
import 'package:mobiletest3/views/wrapper/main_wrapper.dart';

class AppNavigation {
  AppNavigation._();

  static String initial = "/home";

  // Private navigators
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorHome =
  GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _shellNavigatorSettings =
  GlobalKey<NavigatorState>(debugLabel: 'shellSettings');

  static final _shellNavigatorWalk =
  GlobalKey<NavigatorState>(debugLabel: 'shellWalk');

  // GoRouter configuration
  static final GoRouter router = GoRouter(
    initialLocation: initial,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      /// MainWrapper
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainWrapper(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          // Walk
          StatefulShellBranch(
            navigatorKey: _shellNavigatorWalk,
            routes: <RouteBase>[
              GoRoute(
                path: "/walk",
                name: "Walk",
                builder: (BuildContext context, GoRouterState state) =>
                const WalkView(),
                routes: [
                  GoRoute(
                    path: 'subWalk',
                    name: 'subWalk',
                    pageBuilder: (context, state) => CustomTransitionPage<void>(
                      key: state.pageKey,
                      child: const SubWalkView(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                          FadeTransition(opacity: animation, child: child),
                    ),
                  ),
                ],
              ),
            ],
          ),
          /// Brach Home
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHome,
            routes: <RouteBase>[
              GoRoute(
                path: "/home",
                name: "Home",
                builder: (BuildContext context, GoRouterState state) =>
                const HomeView(),
                routes: [
                  GoRoute(
                    path: 'subHome',
                    name: 'subHome',
                    pageBuilder: (context, state) => CustomTransitionPage<void>(
                      key: state.pageKey,
                      child: const SubHomeView(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                          FadeTransition(opacity: animation, child: child),
                    ),
                  ),
                ],
              ),
            ],
          ),

          /// Brach Setting
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSettings,
            routes: <RouteBase>[
              GoRoute(
                path: "/settings",
                name: "Settings",
                builder: (BuildContext context, GoRouterState state) =>
                const SettingsView(),
                routes: [
                  GoRoute(
                    path: "subSetting",
                    name: "subSetting",
                    pageBuilder: (context, state) {
                      return CustomTransitionPage<void>(
                        key: state.pageKey,
                        child: const SubSettingsView(),
                        transitionsBuilder: (
                            context,
                            animation,
                            secondaryAnimation,
                            child,
                            ) =>
                            FadeTransition(opacity: animation, child: child),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),

      /// Player
      // GoRoute(
      //   parentNavigatorKey: _rootNavigatorKey,
      //   path: '/player',
      //   name: "Player",
      //   builder: (context, state) => wPlayerVie(
      //     key: state.pageKey,
      //   ),
      // )

    ],
  );
}