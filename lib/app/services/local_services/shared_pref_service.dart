import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  final sharedPref = GetIt.instance.get<SharedPreferences>();
}
