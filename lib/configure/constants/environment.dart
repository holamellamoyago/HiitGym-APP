import 'package:flutter_dotenv/flutter_dotenv.dart';


class Environment {
  static String firebaseKey1 = dotenv.env['FIREBASE_KEY1'] ?? 'no api key';
  static String firebaseKey2 = dotenv.env['FIREBASE_KEY2'] ?? 'no api key';
  
}
