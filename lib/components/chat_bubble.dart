import 'package:chatapp/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  const ChatBubble(
      {super.key, required this.message, required this.isCurrentUser});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isCurrentUser
              ? isDarkMode
                  ? Colors.green.shade600
                  : Colors.green.shade500
              : isDarkMode
                  ? Colors.grey.shade800
                  : Colors.grey.shade200),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Text(message,
          style: TextStyle(color: isDarkMode ? Colors.white : Colors.black)),
    );
  }
}
