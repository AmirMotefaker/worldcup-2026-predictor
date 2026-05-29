import 'package:flutter/material.dart';
import '../models/user_model.dart';

class LeaderboardScreen extends StatelessWidget {
  final List<UserModel> users;

  const LeaderboardScreen({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.emoji_events, color: Colors.amber, size: 28),
                SizedBox(width: 8),
                Text(
                  'جدول رده‌بندی دوستان (۱۰ کاربر)',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  // سه نفر اول مدال می‌گیرند
                  Widget leadingWidget;
                  if (index == 0) {
                    leadingWidget = const Text('🥇', style: TextStyle(fontSize: 24));
                  } else if (index == 1) {
                    leadingWidget = const Text('🥈', style: TextStyle(fontSize: 24));
                  } else if (index == 2) {
                    leadingWidget = const Text('🥉', style: TextStyle(fontSize: 24));
                  } else {
                    leadingWidget = CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: Text('${index + 1}', style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
                    );
                  }

                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: leadingWidget,
                      title: Text(
                        user.name,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.indigo[50],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '${user.totalPoints} امتیاز',
                          style: TextStyle(color: Colors.indigo[900], fontWeight: FontWeight.bold, fontSize: 14),
                        ),
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