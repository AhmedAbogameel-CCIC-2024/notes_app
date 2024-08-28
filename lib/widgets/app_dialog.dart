import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    required this.title,
    this.subtitle,
    this.showCloseButton = false,
  });

  final String title;
  final String? subtitle;
  final bool showCloseButton;

  void show({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (_) {
        return this;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            if (subtitle != null)
              Text(
                subtitle!,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.6)
                ),
              ),
            SizedBox(height: 24),
            if (showCloseButton)
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                height: 48,
                child: Text('Close'),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
