import 'package:assignment/presentation/theme/bloc/theme_bloc.dart';
import 'package:assignment/presentation/theme/bloc/theme_event.dart';
import 'package:assignment/presentation/theme/bloc/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userBox = Hive.box('usersBox');
    final email = userBox.get('loggedInEmail', defaultValue: 'Unknown');

    return Scaffold(
      appBar: AppBar(title: const Text("Profile / Settings")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            
            ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: Text(email),
              subtitle: const Text("Logged in user"),
            ),
            const Divider(),

            
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return SwitchListTile(
                  title: const Text("Dark Theme"),
                  value: state.isDark,
                  onChanged: (value) {
                    context.read<ThemeBloc>().add(ToggleThemeEvent(value));
                  },
                );
              },
            ),

            const Divider(),

            
            ElevatedButton.icon(
              onPressed: () async {
                userBox.delete('loggedInEmail');
                context.go('/signin');
              },
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
