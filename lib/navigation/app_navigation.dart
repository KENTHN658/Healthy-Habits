import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobiletest3/views/home/home_view.dart';


import 'package:mobiletest3/views/ar/ar_view.dart';

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
                const ARView(),

              ),
            ],
          ),
        ],
      ),

      // / Player
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