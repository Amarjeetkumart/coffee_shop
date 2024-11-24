import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 23, 19, 24),
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(171, 71, 188, 1),
                  Colors.deepPurple,
                  // Theme.of(context).colorScheme.primaryContainer,
                  // Theme.of(context)
                  //     .colorScheme
                  //     .primaryContainer
                  //     .withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white70,
                      ),
                      tooltip: "Back",
                    ),
                  ],
                ),
                const SizedBox(
                  width: 40,
                ),
                const Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Colors.white,
                  //color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 18),
                Text(
                  "Cooking UP!",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                        // color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.restaurant,
              size: 26,
              color: Colors.white,
              //color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text(
              "Coffee",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    //color: Theme.of(context).colorScheme.onSurface,
                    color: Colors.white70,
                    fontSize: 24,
                  ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              size: 26,
              color: Colors.white,
              //color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text(
              "Filters",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    //color: Theme.of(context).colorScheme.onSurface,
                    color: Colors.white70,
                    fontSize: 24,
                  ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
