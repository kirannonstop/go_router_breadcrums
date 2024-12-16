import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class AppLayout extends StatelessWidget {
  final Widget child;
  const AppLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My App")),
      drawer: MediaQuery.of(context).size.width < 600
          ? Drawer(
              child: NavigationMenu(
                onTap: (route) {
                  context.go(route);
                },
              ),
            )
          : null,
      body: Row(
        children: [
          // Side menu for web layout
          if (MediaQuery.of(context).size.width >= 600)
            SizedBox(
              width: 200,
              child: NavigationMenu(
                onTap: (route) => context.go(route),
              ),
            ),
          // Main content area
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (MediaQuery.of(context).size.width >= 600) Breadcrumbs(),
                Expanded(child: child),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class NavigationMenu extends StatefulWidget {
  final Function(String route) onTap;
  const NavigationMenu({super.key, required this.onTap});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  bool isDashboardExpanded = false; // To toggle the Dashboard submenu

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Dashboard with submenu toggle
        ListTile(
          title: const Text("Dashboard"),
          trailing: Icon(isDashboardExpanded ? Icons.expand_less : Icons.expand_more),
          onTap: () {
            setState(() {
              isDashboardExpanded = !isDashboardExpanded;
            });
          },
        ),
        if (isDashboardExpanded) ...[
          ListTile(
            title: const Padding(
              padding: EdgeInsets.only(left: 16.0), // Indent for submenu
              child: Text("Homework"),
            ),
            onTap: () {
              widget.onTap('/dashboard/homework');
              _closeDrawer(context);
            },
          ),
          ListTile(
            title: const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text("Messages"),
            ),
            onTap: () {
              widget.onTap('/dashboard/messages');
              _closeDrawer(context);
            },
          ),
          ListTile(
            title: const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text("Circular"),
            ),
            onTap: () {
              widget.onTap('/dashboard/circular');
              _closeDrawer(context);
            },
          ),
        ],
        const Divider(),
        // Contact Us
        ListTile(
          title: const Text("Contact Us"),
          onTap: () {
            widget.onTap('/contactus');
            _closeDrawer(context);
          },
        ),
      ],
    );
  }

  void _closeDrawer(BuildContext context) {
    if (MediaQuery.of(context).size.width < 600) {
      Navigator.of(context).pop(); // Close the drawer on mobile
    }
  }
}


class Breadcrumbs extends StatelessWidget {
  const Breadcrumbs({super.key}) ;
  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouter.of(context).routerDelegate.currentConfiguration.fullPath;
    final segments = currentLocation.split('/').where((s) => s.isNotEmpty).toList();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 8.0,
        children: [
          // Add the root "Dashboard" breadcrumb only if the current location contains "dashboard".
          if (segments.isNotEmpty && segments.first == 'dashboard') ...[
            InkWell(
              onTap: () => context.go('/'),
              child: const Text(
                'Dashboard',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
          for (int i = 1; i < segments.length; i++) ...[
            const Text(' > '),
            InkWell(
              onTap: () {
                final path = '/' + segments.sublist(0, i + 1).join('/');
                context.go(path);
              },
              child: Text(
                segments[i].capitalize(),
                style: const TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() => '${this[0].toUpperCase()}${substring(1)}';
}
