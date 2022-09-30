import '/about/about.dart';
import '/profile/profile.dart';
import '/login/login.dart';
import '/topics/topics.dart';
import '/home/home.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => LoginScreen(),
  '/topics': (context) => const TopicsScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/about': (context) => const AboutScreen(),
};
