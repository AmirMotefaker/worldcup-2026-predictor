import 'package:flutter/material.dart';
import 'models/match_model.dart';
import 'models/user_model.dart';
import 'screens/matches_screen.dart';
import 'screens/leaderboard_screen.dart';

void main() {
  runApp(const WorldCupApp());
}

class WorldCupApp extends StatelessWidget {
  const WorldCupApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'پیش‌بینی جام جهانی ۲۰۲۶',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      ),
      home: const MainHomeScreen(),
    );
  }
}

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _currentIndex = 0;

  // فرمول محاسبه امتیازات بر اساس منطق ضرایب سایت‌های شرط‌بندی
  void _calculatePoints() {
    for (var user in localUsersList) {
      int score = 0;
      user.predictions.forEach((matchId, pred) {
        var match = worldCupMatchesMock.firstWhere((m) => m.id == matchId);
        
        // اگر بازی انجام شده بود و نتیجه واقعی ثبت شده بود محاسبه کن
        if (match.finalScoreA != null && match.finalScoreB != null) {
          int actA = match.finalScoreA!;
          int actB = match.finalScoreB!;
          int predA = pred.predictedScoreA;
          int predB = pred.predictedScoreB;

          if (actA == predA && actB == predB) {
            // ۱. پیش‌بینی دقیق نتیجه
            score += (5 * match.multiplier).round();
          } else if ((actA - actB) == (predA - predB)) {
            // ۲. پیش‌بینی درست تفاضل گل‌ها
            score += (3 * match.multiplier).round();
          } else if ((actA > actB && predA > predB) || (actA < actB && predA < predB) || (actA == actB && predA == predB)) {
            // ۳. پیش‌بینی فقط تیم برنده یا مساوی
            score += (1 * match.multiplier).round();
          }
        }
      });
      user.totalPoints = score;
    }

    // مرتب‌سازی لیست کاربران بر اساس بالاترین امتیاز
    setState(() {
      localUsersList.sort((a, b) => b.totalPoints.compareTo(a.totalPoints));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          foregroundColor: Colors.white,
          title: const Text('پیش‌بینی جام جهانی ۲۰۲۶', style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: [
            MatchesScreen(
              matches: worldCupMatchesMock,
              currentUser: localUsersList[0], // کاربر پیش‌فرض (امیر)
              onPredictionUpdated: _calculatePoints,
            ),
            LeaderboardScreen(users: localUsersList),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.indigo[900],
          unselectedItemColor: Colors.grey,
          onTap: (index) => setState(() => _currentIndex = index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.sports_soccer), label: 'مسابقات'),
            BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'رده‌بندی دوستان'),
          ],
        ),
      ),
    );
  }
}