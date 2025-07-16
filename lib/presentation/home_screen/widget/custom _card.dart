import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hunting_app/common/custom_padding.dart';
import 'package:hunting_app/common/text_style_custom.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String location;
  final String name;
  final String status;
  final String price;
  final String timerText;
  final String level;
  final String players;
  final String rating;

  const CustomCard({super.key, 
    required this.title,
    required this.players,
    required this.subtitle,
    required this.location,
    required this.name,
    required this.status,
    required this.price,
    required this.timerText,
    required this.level,
    required this.rating,
  });

  @override
Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: Color(0xff72889A)),
        gradient: LinearGradient(colors: [
          Color(0xff111827),
          Color(0xff181F27),
        ])
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: customTextStyleAuth(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff97BECA)
                    )
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, size: 14, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        '$location, $name',
                        style: customTextStyleAuth(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff9E9E9E),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              // 2nd Child - Status container with icon
              Container(
                padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
                decoration: BoxDecoration(
                  color: getStatusColor(status),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  children: [
                    Icon(
                      getStatusIcon(status),
                      color: getStatusIconColor(status),
                      size: 18,
                    ),
                    SizedBox(width: 4),
                    Text(
                      status,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
    
          // 2nd Row - Price and Timer icon
          Row(
            children: [
              Row(
                children: [
                  SvgPicture.asset("assets/icon/trophy.svg"),
                  SizedBox(width: 4),
                  Text(
                    price,
                    style: customTextStyleAuth(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      
                    ),
                  ),
                  hPad10,
                     Icon(Icons.access_time, color: Color(0xff9E9E9E), size: 20),
                      hPad5,
                  Text(
                    timerText,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Spacer(),
             
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
          SizedBox(height: 12),
    
          // Divider between sections
          Divider(color: Colors.grey.withOpacity(0.4)),
    
          // 4th Row - Levels with icon and color
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  levelRowItem(level, Icons.diamond, getLevelIconsColor(level) , getLevelColor(level)),
              hPad10,
              Text("$players players", style: customTextStyleAuth(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: Color(0xff9E9E9E)
              ),)
                ],
              ),
              Row(
                children: [
                  Icon(Icons.star, color: Color(0xffC89800),size: 15,),
                  Text(rating, style: customTextStyleAuth(
                    fontSize: 11,
                    fontWeight: FontWeight.w500
                  ),),
                ],
              )
             
            ],
          ),
        ],
      ),
    );
  }

  // Helper method to get the status color
  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return Color(0xff009963).withOpacity(0.8);
      case 'coming soon':
        return Color(0xff2765A1).withOpacity(0.8);
      case 'completed':
        return Color(0xff9E9E9E).withOpacity(0.8);
      default:
        return Colors.grey;
    }
  }

  // Helper method to get the status icon
  IconData getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return Icons.check_box;
      case 'coming soon':
        return Icons.timer;
      case 'completed':
        return Icons.check_box;
      default:
        return Icons.help_outline;
    }
  }

    Color getStatusIconColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return Colors.green;
      case 'coming soon':
        return Colors.white;
      case 'completed':
        return Colors.green;
      default:
        return Colors.red;
    }
  }

  Color getLevelColor(String status) {
    switch (status.toLowerCase()) {
      case 'easy':
        return Color(0xff2765A1).withOpacity(0.4);
      case 'medium':
        return Color(0xff995900).withOpacity(0.7);
      case 'hard':
        return Color(0xffE33629).withOpacity(0.6);
      default:
        return Colors.red;
    }
  }
    Color getLevelIconsColor(String status) {
    switch (status.toLowerCase()) {
      case 'easy':
        return Color(0xff2765A1);
      case 'medium':
        return Color(0xff995900);
      case 'hard':
        return Color(0xffE33629);
      default:
        return Colors.red;
    }
  }


  // Helper method to create level row items
  Widget levelRowItem(String level, IconData icon, Color iconColor, Color backgroundColor) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: iconColor, width: 1.0),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 18),
          SizedBox(width: 4),
          Text(
            level,
            style: customTextStyleAuth(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              
            ),
          ),
        ],
      ),
    );
  }
}
