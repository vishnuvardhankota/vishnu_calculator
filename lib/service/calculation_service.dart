import 'package:shared_preferences/shared_preferences.dart';

class CalculationService {
  
  // To store calculation in mobile
  Future<void> storeCalculation(List<String> calculations) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList("calculations", calculations);
  }

  // To get calculation history from mobile
  Future<List<String>> getCalculations() async {
    final prefs = await SharedPreferences.getInstance();
    final calculations = prefs.getStringList("calculations") ?? [];
    return calculations;
  }
}
