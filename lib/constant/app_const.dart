//
import 'package:hunting_app/common/enum.dart';

import '../model/clues_model.dart';
import '../model/custom_card_data.dart';
final List<CustomCardData> data = [
  CustomCardData(
    title: "Jungle Safari",
    subtitle: "Explore the wild",
    location: "Amazon",
    name: "Carlos Gonzalez",
    rating: "4.7",
    status: "Active",
    image: "assets/clues_pic.png",
    price: "\$120",
    timerText: "Completed",
    level: "Easy",
    players: "30",
    clues: [
      Clue(title: "Trail Start", status: ClueStatus.completed),
      Clue(title: "Monkey Puzzle", status: ClueStatus.completed),
      Clue(title: "Hidden Falls", status: ClueStatus.inProgress),
    ],
  ),
  CustomCardData(
    title: "Treasure Hunt",
    subtitle: "Exciting quest",
    location: "Africa",
    name: "John Doe",
    rating: "3.5",
    status: "Active",
    price: "\$50",
    timerText: "5 days left",
    image: "assets/puzzle_pic.png",
    level: "Medium",
    players: "14",
    clues: [
      Clue(title: "Map Discovery", status: ClueStatus.completed),
      Clue(title: "X Marks the Spot", status: ClueStatus.inProgress),
      Clue(title: "Treasure Chamber", status: ClueStatus.locked),
    ],
  ),
  CustomCardData(
    image: "assets/clues_pic.png",
    title: "Space Adventure",
    subtitle: "Journey to the stars",
    location: "Space",
    name: "Alice Smith",
    rating: "4.2",
    status: "Coming Soon",
    price: "\$80",
    timerText: "3 days left",
    level: "Hard",
    players: "20",
    clues: [
      Clue(title: "Launch Sequence", status: ClueStatus.locked),
      Clue(title: "Asteroid Maze", status: ClueStatus.locked),
      Clue(title: "Final Orbit", status: ClueStatus.locked),
    ],
  ),
  CustomCardData(
    image: "assets/puzzle_pic.png",
    title: "Underwater Expedition",
    subtitle: "Discover the deep sea",
    location: "Pacific Ocean",
    name: "Michael Brown",
    rating: "4.0",
    status: "Active",
    price: "\$100",
    timerText: "7 days left",
    level: "Medium",
    players: "18",
    clues: [
      Clue(title: "Coral Clue", status: ClueStatus.completed),
      Clue(title: "Shark Signal", status: ClueStatus.inProgress),
      Clue(title: "Sunken Treasure", status: ClueStatus.locked),
    ],
  ),
  CustomCardData(
    image: "assets/clues_pic.png",
    title: "Mountain Climb",
    subtitle: "Reach new heights",
    location: "Himalayas",
    name: "Sarah Lee",
    rating: "4.8",
    status: "Completed",
    price: "\$200",
    timerText: "Completed",
    level: "Hard",
    players: "25",
    clues: [
      Clue(title: "Base Camp", status: ClueStatus.completed),
      Clue(title: "Icy Ridge", status: ClueStatus.completed),
      Clue(title: "Summit Quest", status: ClueStatus.completed),
    ],
  ),
];


final List<Map<String, String>> rules = [
    {"rule": "Complete all clues in correct sequence", "status": "incomplete"},
    {"rule": "Take photos at each checkpoint for verification", "status": "incomplete"},
    {"rule": "Respect private property and local regulations", "status": "incomplete"},
    {"rule": "Hunt must be completed within time limit", "status": "incomplete"},
  ];



  final List<ClueStepData> clueStepsDemo = [
  ClueStepData(
    number: 1,
    label: 'The Secret Steps',
    status: ClueStatus.completed,
  ),
  ClueStepData(
    number: 2,
    label: 'Hidden Treasure',
    status: ClueStatus.inProgress,
  ),
  ClueStepData(
    number: 3,
    label: 'Final Goal',
    status: ClueStatus.locked,
  ),
];


