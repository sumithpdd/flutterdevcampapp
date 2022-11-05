import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/app_constants/app_constants.dart';
import 'package:news_app/authentication/authentication.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: TextButton(
              onPressed: () async {
                await ref.read(authStateProvider.notifier).logOut();
              },
              child: const Text(
                AppStrings.logOut,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
