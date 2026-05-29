class MatchModel {
  final int id;
  final String teamA;
  final String teamB;
  final String dateString; // تاریخ و ساعت دقیق به وقت ایران
  final String group;
  final double multiplier; // ضریب اهمیت بازی (سایت‌های شرط‌بندی)
  int? finalScoreA; // گل‌های واقعی تیم اول (بعد از اتمام بازی)
  int? finalScoreB; // گل‌های واقعی تیم دوم (بعد از اتمام بازی)

  MatchModel({
    required this.id,
    required this.teamA,
    required this.teamB,
    required this.dateString,
    required this.group,
    this.multiplier = 1.0,
    this.finalScoreA,
    this.finalScoreB,
  });
}

// جدول مسابقات اولیه و حساس جام جهانی 2026 (افتتاحیه و مراحل گروهی)
List<MatchModel> worldCupMatchesMock = [
  MatchModel(
    id: 1, 
    teamA: 'مکزیک 🇲🇽', 
    teamB: 'آمریکا 🇺🇸', 
    dateString: 'پنجشنبه ۲۱ خرداد ۱۴۰۵ - ساعت ۲۲:۳۰', 
    group: 'افتتاحیه (گروه A)', 
    multiplier: 1.5
  ),
  MatchModel(
    id: 2, 
    teamA: 'ایران 🇮🇷', 
    teamB: 'آلمان 🇩🇪', 
    dateString: 'جمعه ۲۲ خرداد ۱۴۰۵ - ساعت ۱۸:۰۰', 
    group: 'گروه A', 
    multiplier: 1.8
  ),
  MatchModel(
    id: 3, 
    teamA: 'آرژانتین 🇦🇷', 
    teamB: 'مراکش 🇲🇦', 
    dateString: 'جمعه ۲۲ خرداد ۱۴۰۵ - ساعت ۲۱:۳۰', 
    group: 'گروه B', 
    multiplier: 1.3
  ),
  MatchModel(
    id: 4, 
    teamA: 'برزیل 🇧🇷', 
    teamB: 'ژاپن 🇯🇵', 
    dateString: 'شنبه ۲۳ خرداد ۱۴۰۵ - ساعت ۱۵:۰۰', 
    group: 'گروه C', 
    multiplier: 1.2
  ),
  MatchModel(
    id: 5, 
    teamA: 'فرانسه 🇫🇷', 
    teamB: 'کامرون 🇨🇲', 
    dateString: 'شنبه ۲۳ خرداد ۱۴۰۵ - ساعت ۱۹:۳۰', 
    group: 'گروه D', 
    multiplier: 1.1
  ),
];