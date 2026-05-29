class PredictionModel {
  final int matchId; // شناسه مسابقه‌ای که پیش‌بینی شده
  final int predictedScoreA; // گل پیش‌بینی شده برای تیم اول
  final int predictedScoreB; // گل پیش‌بینی شده برای تیم دوم

  PredictionModel({
    required this.matchId,
    required this.predictedScoreA,
    required this.predictedScoreB,
  });
}