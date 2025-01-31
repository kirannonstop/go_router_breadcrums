import 'package:go_router/go_router.dart';
import 'package:go_router_demo/circular.dart';
import 'package:go_router_demo/contact_us.dart';
import 'package:go_router_demo/dashboard_page.dart';
import 'package:go_router_demo/dialog_as_a_route.dart';
import 'package:go_router_demo/dialog_as_page.dart';
import 'package:go_router_demo/extensions.dart';
import 'package:go_router_demo/homework.dart';
import 'package:go_router_demo/layout.dart';
import 'package:go_router_demo/message.dart';



final GoRouter router = GoRouter(
  routes: [
    // Parent route for the dashboard
    ShellRoute(
      builder: (context, state, child) => AppLayout(child: child),
      routes: [
        // Child routes for Dashboard
        GoRoute(
          path: '/',
          builder: (context, state) => const DashboardPage(),
        ),
        GoRoute(
          path: '/dashboard/homework',
          builder: (context, state) => const Homework(),
        ),
        GoRoute(
          path: '/dashboard/messages',
          builder: (context, state) => const Message(),
        ),
        GoRoute(
          path: '/dashboard/circular',
          builder: (context, state) => const Circular(),
          routes: [
            //dialog route
            GoRoute(
              path: '/dialog',
              pageBuilder: (context, state) =>  DialogPage(
                width: context.width * 0.3,
                height: context.height * 0.3,
                builder: (context) =>  const DialogAsARoute(),
              ),
            )
          ]
        ),
      ],
    ),

    // Independent route for Contact Us
    GoRoute(
      path: '/contactus',
      builder: (context, state) => const AppLayout(child:  ContactUs()),
    ),
  ],
);
