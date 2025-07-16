import 'package:hunting_app/common/enum.dart';

class ClueStepData {
  final int number;
  final String label;
  final ClueStatus status;

  ClueStepData({
    required this.number,
    required this.label,
    required this.status,
  });
}