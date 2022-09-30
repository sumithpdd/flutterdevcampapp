import 'package:flutter/material.dart';

import '../helpers/app_constants.dart';
import '../services/auth.dart';
import '../shared/shared.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var user = AuthService().user;

    if (user != null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor:
              AppConstants.hexToColor(AppConstants.appPrimaryColorGreen),
          title: Text(user.displayName ?? 'Guest'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(user.photoURL ??
                        'https://www.gravatar.com/userimage/147551125/df757af1cf5b5b8844afbbedb56d990d.jpg'),
                  ),
                ),
              ),
              Text(user.email ?? '',
                  style: Theme.of(context).textTheme.headline6),
              const Spacer(),
              Text('0', style: Theme.of(context).textTheme.headline2),
              Text('Quizzes Completed',
                  style: Theme.of(context).textTheme.subtitle2),
              const Spacer(),
              ElevatedButton(
                child: const Text('logout'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppConstants.hexToColor(
                      AppConstants.appPrimaryColorGreen),
                ),
                onPressed: () async {
                  await AuthService().signOut();
                  if (mounted) {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/', (route) => false);
                  }
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      );
    } else {
      return const Loader();
    }
  }
}
