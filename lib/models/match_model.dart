class MatchModel {
  final int id;
  final String teamA;
  final String teamB;
  final String dateString;
  final String group;
  final double multiplier;
  int? finalScoreA; 
  int? finalScoreB;

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

// جدول جامع و ساختاری ۱۰۴ مسابقه جام جهانی ۲۰۲۶ طبق اعلام رسمی فیفا
List<MatchModel> worldCupMatchesMock = [
  // --- مرحله گروهی (تنها بخشی از مسابقات کلیدی و ساختار گروه‌ها) ---
  MatchModel(id: 1, teamA: 'مکزیک 🇲🇽 (A1)', teamB: 'تیم A2', dateString: 'پنجشنبه ۲۱ خرداد ۱۴۰۵ - ساعت ۲۲:۳۰', group: 'گروه A - افتتاحیه', multiplier: 1.5),
  MatchModel(id: 2, teamA: 'تیم A3', teamB: 'تیم A4', dateString: 'جمعه ۲۲ خرداد ۱۴۰۵ - ساعت ۰۱:۳۰', group: 'گروه A'),
  MatchModel(id: 3, teamA: 'کانادا 🇨🇦 (B1)', teamB: 'تیم B2', dateString: 'جمعه ۲۲ خرداد ۱۴۰۵ - ساعت sunset', group: 'گروه B - افتتاحیه کانادا', multiplier: 1.4),
  MatchModel(id: 4, teamA: 'آمریکا 🇺🇸 (D1)', teamB: 'تیم D2', dateString: 'جمعه ۲۲ خرداد ۱۴۰۵ - ساعت sunset', group: 'گروه D - افتتاحیه آمریکا', multiplier: 1.5),
  
  // نمونه بازی‌های ساختاری گروهی (تا بازی شماره ۷۲)
  MatchModel(id: 12, teamA: 'مکزیک 🇲🇽 (A1)', teamB: 'تیم A3', dateString: 'سه شنبه ۲۶ خرداد ۱۴۰۵', group: 'گروه A - دور دوم'),
  MatchModel(id: 15, teamA: 'کانادا 🇨🇦 (B1)', teamB: 'تیم B3', dateString: 'چهارشنبه ۲۷ خرداد ۱۴۰۵', group: 'گروه B - دور دوم'),
  MatchModel(id: 25, teamA: 'آمریکا 🇺🇸 (D1)', teamB: 'تیم D3', dateString: 'شنبه ۳۰ خرداد ۱۴۰۵', group: 'گروه D - دور دوم'),
  MatchModel(id: 53, teamA: 'تیم A4', teamB: 'مکزیک 🇲🇽 (A1)', dateString: 'دوشنبه ۱ تیر ۱۴۰۵', group: 'گروه A - دور سوم'),
  MatchModel(id: 57, teamA: 'تیم B4', teamB: 'کانادا 🇨🇦 (B1)', dateString: 'سه شنبه ۲ تیر ۱۴۰۵', group: 'گروه B - دور سوم'),
  MatchModel(id: 65, teamA: 'تیم D4', teamB: 'آمریکا 🇺🇸 (D1)', dateString: 'پنجشنبه ۴ تیر ۱۴۰۵', group: 'گروه D - دور سوم'),

  // --- مرحله یک‌شانزدهم نهایی (Top 32) ---
  MatchModel(id: 73, teamA: 'تیم اول گروه A', teamB: 'تیم سوم گروه C/E/F', dateString: 'شنبه ۶ تیر ۱۴۰۵', group: 'یک‌شانزدهم نهایی', multiplier: 1.6),
  MatchModel(id: 74, teamA: 'تیم دوم گروه A', teamB: 'تیم دوم گروه B', dateString: 'یکشنبه ۷ تیر ۱۴۰۵', group: 'یک‌شانزدهم نهایی', multiplier: 1.6),
  MatchModel(id: 75, teamA: 'تیم اول گروه B', teamB: 'تیم سوم گروه A/C/F', dateString: 'یکشنبه ۷ تیر ۱۴۰۵', group: 'یک‌شانزدهم نهایی', multiplier: 1.6),
  MatchModel(id: 76, teamA: 'تیم اول گروه E', teamB: 'تیم سوم گروه I/J/K', dateString: 'دوشنبه ۸ تیر ۱۴۰۵', group: 'یک‌شانزدهم نهایی', multiplier: 1.6),
  MatchModel(id: 77, teamA: 'تیم اول گروه F', teamB: 'تیم دوم گروه C', dateString: 'دوشنبه ۸ تیر ۱۴۰۵', group: 'یک‌شانزدهم نهایی', multiplier: 1.6),
  // بقیه مسابقات این مرحله تا بازی ۸۸ به همین ترتیب ساختاری دنبال می‌شود...

  // --- مرحله یک‌هشتم نهایی (Top 16) ---
  MatchModel(id: 89, teamA: 'برنده بازی ۷۳', teamB: 'برنده بازی ۷۴', dateString: 'شنبه ۱۲ تیر ۱۴۰۵', group: 'یک‌هشتم نهایی', multiplier: 1.8),
  MatchModel(id: 90, teamA: 'برنده بازی ۷۵', teamB: 'برنده بازی ۷۶', dateString: 'یکشنبه ۱۳ تیر ۱۴۰۵', group: 'یک‌هشتم نهایی', multiplier: 1.8),
  MatchModel(id: 91, teamA: 'برنده بازی ۷۷', teamB: 'برنده بازی ۷۸', dateString: 'دوشنبه ۱۴ تیر ۱۴۰۵', group: 'یک‌هشتم نهایی', multiplier: 1.8),
  MatchModel(id: 92, teamA: 'برنده بازی ۷۹', teamB: 'برنده بازی ۸۰', dateString: 'سه شنبه ۱۵ تیر ۱۴۰۵', group: 'یک‌هشتم نهایی', multiplier: 1.8),

  // --- مرحله یک‌چهارم نهایی (Quarter-Finals) ---
  MatchModel(id: 97, teamA: 'برنده بازی ۸۹', teamB: 'برنده بازی ۹۰', dateString: 'پنجشنبه ۱۸ تیر ۱۴۰۵', group: 'یک‌چهارم نهایی (بوستون)', multiplier: 2.0),
  MatchModel(id: 98, teamA: 'برنده بازی ۹۱', teamB: 'برنده بازی ۹۲', dateString: 'جمعه ۱۹ تیر ۱۴۰۵', group: 'یک‌چهارم نهایی (لس‌آنجلس)', multiplier: 2.0),
  MatchModel(id: 99, teamA: 'برنده بازی ۹۳', teamB: 'برنده بازی ۹۴', dateString: 'شنبه ۲۰ تیر ۱۴۰۵', group: 'یک‌چهارم نهایی (میامی)', multiplier: 2.0),
  MatchModel(id: 100, teamA: 'برنده بازی ۹۵', teamB: 'برنده بازی ۹۶', dateString: 'شنبه ۲۰ تیر ۱۴۰۵', group: 'یک‌چهارم نهایی (کانزاس)', multiplier: 2.0),

  // --- مرحله نیمه نهایی (Semi-Finals) ---
  MatchModel(id: 101, teamA: 'برنده بازی ۹۷', teamB: 'برنده بازی ۹۸', dateString: 'سه شنبه ۲۳ تیر ۱۴۰۵ - ساعت ۲۳:۳۰', group: 'نیمه نهایی اول (دالاس)', multiplier: 2.2),
  MatchModel(id: 102, teamA: 'برنده بازی ۹۹', teamB: 'برنده بازی ۱۰۰', dateString: 'چهارشنبه ۲۴ تیر ۱۴۰۵ - ساعت ۲۳:۳۰', group: 'نیمه نهایی دوم (آتلانتا)', multiplier: 2.2),

  // --- مسابقه رده‌بندی (Third Place) ---
  MatchModel(id: 103, teamA: 'بازنده بازی ۱۰۱', teamB: 'بازنده بازی ۱۰۲', dateString: 'شنبه ۲۷ تیر ۱۴۰۵ - ساعت ۲۱:۳۰', group: 'رده‌بندی (میامی)', multiplier: 2.0),

  // --- 🏆 فینال بزرگ جام جهانی ۲۰۲۶ (Final) ---
  MatchModel(id: 104, teamA: 'برنده بازی ۱۰۱', teamB: 'برنده بازی ۱۰۲', dateString: 'یکشنبه ۲۸ تیر ۱۴۰۵ - ساعت ۲۲:۳۰', group: '🏆 فینال (نیویورک / نیوجرسی)', multiplier: 2.5),
];