import 'package:hunting_app/common/enum.dart';

class CustomCardData {
  final String title;
  final String subtitle;
  final String location;
  final String name;
  final String rating;
  final String status;
  final String price;
  final String timerText;
  final String level;
  final String players;
  final String image;
  final List<Clue> clues; // <-- Add this

  CustomCardData({
    required this.title,
    required this.subtitle,
    required this.location,
    required this.name,
    required this.rating,
    required this.image,
    required this.status,
    required this.price,
    required this.timerText,
    required this.level,
    required this.players,
    required this.clues, // <-- Include in constructor
  });
}
class Clue {
  final String title;
  final ClueStatus status;

  Clue({
    required this.title,
    required this.status,
  });
}
