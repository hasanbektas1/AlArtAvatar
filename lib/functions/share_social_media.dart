import 'package:flutter/material.dart';

mixin ShowSocialMediaModalMixin {
  void showSocialMediaModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: const Color(0xFF2A2A2A),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSocialMediaItem(
                  Icons.facebook, 'Facebook', Colors.blue, Colors.white),
              _buildSocialMediaItem(
                  Icons.close, 'Twitter', Colors.blue, Colors.white),
              _buildSocialMediaItem(
                  Icons.camera_alt, 'Instagram', Colors.purple, Colors.white),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSocialMediaItem(
      IconData icon, String title, Color iconColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: iconColor),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(color: textColor),
          ),
        ],
      ),
    );
  }
}
