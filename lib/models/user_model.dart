import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final int currentStreak;
  final int longestStreak;
  final DateTime? lastCompletedDate;
  final String avatarAsset;

  const UserModel({
    required this.currentStreak,
    required this.longestStreak,
    this.lastCompletedDate,
    this.avatarAsset = 'avatar1.png',
  });

  factory UserModel.empty() =>
      const UserModel(currentStreak: 0, longestStreak: 0);

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        currentStreak: (map['currentStreak'] as num?)?.toInt() ?? 0,
        longestStreak: (map['longestStreak'] as num?)?.toInt() ?? 0,
        lastCompletedDate: map['lastCompletedDate'] != null
            ? (map['lastCompletedDate'] as Timestamp).toDate()
            : null,
        avatarAsset: (map['avatarAsset'] as String?) ?? 'avatar1.png',
      );
}
