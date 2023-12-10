import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectedScreen});

  final void Function(String selectedScreen) onSelectedScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColor.withOpacity(0.5)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: Row(children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  "Cooking food",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Theme.of(context).colorScheme.primary),
                )
              ])),
          ListTile(
            onTap: () {
              onSelectedScreen("meals");
            },
            leading: const Icon(Icons.restaurant, size: 20),
            title: Text(
              "Meals",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          ListTile(
            onTap: () {
              onSelectedScreen("filters");
            },
            leading: const Icon(Icons.settings, size: 20),
            title: Text(
              "filters",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          )
        ],
      ),
    );
  }
}
