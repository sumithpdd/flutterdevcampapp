import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/app_constants/app_constants.dart';
import 'package:news_app/authentication/authentication.dart';
import 'package:news_app/helpers/helpers.dart';
import 'package:news_app/user/profile/constants/constants.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userProvider)!;
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                user.photoURL!,
              ),
              maxRadius: 80,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            user.displayName!,
            style: Theme.of(context).primaryTextTheme.headline2,
            textAlign: TextAlign.center,
          ),
          const DividerWithMargins(
            marginHeight: 10,
          ),
          ExpansionTile(
            title: Text(
              ProfileViewStrings.savedArticles,
              style: Theme.of(context).primaryTextTheme.bodyText1,
            ),
          ),
          ExpansionTile(
            title: Text(
              ProfileViewStrings.selectedSources,
              style: Theme.of(context).primaryTextTheme.bodyText1,
            ),
          ),
          Expanded(
            child: Center(
              child: ElevatedButton.icon(
                icon: const Icon(
                  FontAwesomeIcons.arrowRightFromBracket,
                  color: AppColors.white,
                  size: 20,
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                ),
                onPressed: () async {
                  final result = ref.read(authStateProvider.notifier).logOut();
                  result.log();
                },
                label: Text(
                  ProfileViewStrings.logOut,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
