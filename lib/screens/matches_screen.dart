import 'package:flutter/material.dart';
import '../models/match_model.dart';
import '../models/user_model.dart';
import '../models/prediction_model.dart';

class MatchesScreen extends StatefulWidget {
  final List<MatchModel> matches;
  final UserModel currentUser;
  final VoidCallback onPredictionUpdated;

  const MatchesScreen({
    Key? key,
    required this.matches,
    required this.currentUser,
    required this.onPredictionUpdated,
  }) : super(key: key);

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: widget.matches.length,
      itemBuilder: (context, index) {
        final match = widget.matches[index];
        final pred = widget.currentUser.predictions[match.id];

        return Card(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // بخش گروه و ضریب بازی
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.indigo[50],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        match.group,
                        style: TextStyle(color: Colors.indigo[900], fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'ضریب بازی: ×${match.multiplier}',
                      style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // بخش نمایش تیم‌ها و نتیجه
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Text(
                        match.teamA,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        match.finalScoreA != null ? '${match.finalScoreA} - ${match.finalScoreB}' : 'VS',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        match.teamB,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // تاریخ بازی
                Text(
                  match.dateString,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                const Divider(height: 24),
                // بخش وضعیت پیش‌بینی کاربر
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      pred != null 
                          ? 'پیش‌بینی شما: ${pred.predictedScoreA} - ${pred.predictedScoreB}' 
                          : 'هنوز پیش‌بینی نکرده‌اید',
                      style: TextStyle(
                        color: pred != null ? Colors.green[700] : Colors.red[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo[900],
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      icon: const Icon(Icons.edit_calendar, size: 16),
                      label: const Text('ثبت نتیجه'),
                      onPressed: () => _openPredictionDialog(context, match),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  // پاپ‌آپ زیبا برای وارد کردن گل‌ها
  void _openPredictionDialog(BuildContext context, MatchModel match) {
    final TextEditingController controllerA = TextEditingController();
    final TextEditingController controllerB = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text('پیش‌بینی بازی ${match.teamA} - ${match.teamB}', style: const TextStyle(fontSize: 16), textAlign: TextAlign.center),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 60,
                child: TextField(
                  controller: controllerA,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'گل A'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text('—', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                width: 60,
                child: TextField(
                  controller: controllerB,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'گل B'),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('لغو', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo[900], foregroundColor: Colors.white),
              onPressed: () {
                int scoreA = int.tryParse(controllerA.text) ?? 0;
                int scoreB = int.tryParse(controllerB.text) ?? 0;
                
                widget.currentUser.predictions[match.id] = PredictionModel(
                  matchId: match.id,
                  predictedScoreA: scoreA,
                  predictedScoreB: scoreB,
                );
                
                widget.onPredictionUpdated();
                Navigator.pop(context);
              },
              child: const Text('ذخیره پیش‌بینی'),
            )
          ],
        ),
      ),
    );
  }
}