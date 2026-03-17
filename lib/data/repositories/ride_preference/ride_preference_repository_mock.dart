import '../../../model/ride_pref/ride_pref.dart';
import '../../dummy_data.dart';
import 'ride_preference_repository.dart';

class RidePreferenceRepositoryMock implements RidePreferenceRepository {
  final List<RidePreference> _preferences = List.from(fakeRidePrefs);

  @override
  List<RidePreference> getPastPreferences() {
    return _preferences;
  }

  @override
  void addPreference(RidePreference preference) {
    _preferences.add(preference);
  }
}
