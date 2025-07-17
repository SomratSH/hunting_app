import 'package:flutter/material.dart';
import 'package:hunting_app/constant/app_colors.dart';
import '../../common/text_style_custom.dart';

class NotificationScreen extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      "title": "New Message",
      "body": "You have received a new message.",
      "time": "2 mins ago",
      "icon": "message"
    },
    {
      "title": "App Update",
      "body": "Version 2.0 is now available.",
      "time": "1 hour ago",
      "icon": "system_update"
    },
    {
      "title": "Reminder",
      "body": "Don't forget your meeting at 3 PM.",
      "time": "3 hours ago",
      "icon": "event"
    },
    {
      "title": "Success",
      "body": "Your profile was updated successfully.",
      "time": "Yesterday",
      "icon": "check_circle"
    },
    {
      "title": "New Offer",
      "body": "Check out our new deals and discounts.",
      "time": "2 days ago",
      "icon": "local_offer"
    },
  ];

  IconData _getIcon(String iconName) {
    switch (iconName) {
      case "message":
        return Icons.message;
      case "system_update":
        return Icons.system_update;
      case "event":
        return Icons.event;
      case "check_circle":
        return Icons.check_circle;
      case "local_offer":
        return Icons.local_offer;
      default:
        return Icons.notifications;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                ),
                Expanded(
                  child: Text(
                    "Notification",
                    style: customTextStyleAuth(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 48), // space to balance IconButton
              ],
            ),
               Divider(color: blueShade3),

            // Notifications list
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(12),
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return Card(
                    color: card1,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: blue1,
                        child: Icon(
                          _getIcon(notification["icon"]!),
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        notification["title"]!,
                        style: customTextStyleAuth(fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                      subtitle: Text(notification["body"]!),
                      trailing: Text(
                        notification["time"]!,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
