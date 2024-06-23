import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_bunny/features/auth/application/application.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: TextButton.icon(
          icon: const Icon(Icons.logout),
          onPressed: context.read<AuthCubit>().signOut,
          label: const Text('Logout'),
        ),
      ),
    );
  }
}
