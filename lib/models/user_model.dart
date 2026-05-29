import 'prediction_model.dart';

class UserModel {
  final String id;
  final String name;
  Map<int, PredictionModel> predictions; // ساختار مپ برای دسترسی سریع: matchId -> Prediction
  int totalPoints; // مجموع امتیازات کسب شده کاربر

  UserModel({
    required this.id,
    required this.name,
    Map<int, PredictionModel>? predictions,
    this.totalPoints = 0,
  }) : this.predictions = predictions ?? {};
}

// لیست ثابت کاربران رقابت (محدود به ۱۰ نفر ظرفیت اتاق)
List<UserModel> localUsersList = [
  UserModel(id: '1', name: 'امیر (شما)'),
  UserModel(id: '2', name: 'رضا'),
  UserModel(id: '3', name: 'سارا'),
  UserModel(id: '4', name: 'مهدی'),
  UserModel(id: '5', name: 'آرمان'),
  UserModel(id: '6', name: 'مریم'),
  UserModel(id: '7', name: 'حسین'),
  UserModel(id: '8', name: 'نیما'),
  UserModel(id: '9', name: 'الناز'),
  UserModel(id: '10', name: 'پوریا'),
];