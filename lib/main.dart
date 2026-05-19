import 'package:adv_basics/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

import 'package:adv_basics/register_screen.dart';
import 'package:adv_basics/login_screen.dart';
import 'package:adv_basics/home_screen.dart';
import 'package:adv_basics/communication_screen.dart';
import 'package:adv_basics/habit_screen.dart';
import 'package:adv_basics/calendar_screen.dart';
import 'package:adv_basics/statistic_screen.dart';
import 'package:adv_basics/settings_screen.dart';
import 'package:adv_basics/add_new_focus.dart';
import 'package:adv_basics/running_focus.dart';
import 'package:adv_basics/thoughts_screen.dart';
import 'package:adv_basics/communication_detail_screen.dart';
import 'package:adv_basics/models/task_args.dart';
import 'package:adv_basics/services/notification_service.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationService.instance.init();
  NotificationService.navigatorKey = _navigatorKey;
  final savedNotifSettings = await NotificationService.instance.loadSettings();
  if (savedNotifSettings.anyEnabled) {
    await NotificationService.instance.applySettings(savedNotifSettings);
  }

  final isLoggedIn = FirebaseAuth.instance.currentUser != null;

  runApp(
    MaterialApp(
      navigatorKey: _navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: isLoggedIn ? '/home' : '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/register': (context) => const RegisterScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/habit': (context) => const HabitScreen(),
        '/communication': (context) => const CommunicationScreen(),
        '/calendar': (context) => const CalendarScreen(),
        '/statistic': (context) => const StatisticScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/add_new_focus': (context) => const AddNewFocus(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/running_focus') {
          final args = settings.arguments as TaskArgs;
          return MaterialPageRoute(
            builder: (_) => RunningFocus(args: args),
          );
        }
        if (settings.name == '/thoughts') {
          final args = settings.arguments as TaskArgs;
          return MaterialPageRoute(
            builder: (_) => ThoughtsScreen(args: args),
          );
        }
        if (settings.name == '/communication_detail') {
          final args = settings.arguments as TaskArgs;
          return MaterialPageRoute(
            builder: (_) => CommunicationDetailScreen(args: args),
          );
        }
        return null;
      },
    ),
  );
}
