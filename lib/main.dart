import 'package:flutter/material.dart';

import 'package:adv_basics/welcome_screen.dart';
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

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const ThoughtsScreen(),
        //'/': (context) => const WelcomeScreen(),
        // '/register': (context) => const RegisterScreen(),
        // '/login': (context) => const LoginScreen(),
        // '/home': (context) => const HomeScreen(),
        // '/habit': (context) => const HabitScreen(),
        // '/communication': (context) => const CommunicationScreen(),
        // '/calendar': (context) => const CalendarScreen(),
        // '/statistic': (context) => const StatisticScreen(),
        // '/settings': (context) => const SettingsScreen(),
        // '/add_new_focus': (context) => const AddNewFocus(),
        // '/running_focus': (context) => const RunningFocus(),
        // '/thoughts': (context) => const ThoughtsScreen(),
      },
    ),
  );
}
