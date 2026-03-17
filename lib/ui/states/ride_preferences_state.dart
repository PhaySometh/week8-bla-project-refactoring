import 'package:flutter/foundation.dart';

import '../../data/repositories/ride_preference/ride_preference_repository.dart';
import '../../model/ride_pref/ride_pref.dart';

class RidePreferencesState extends ChangeNotifier {
  final RidePreferenceRepository _repository;

  RidePreference? _currentPreference;
  late List<RidePreference> _history;

  RidePreferencesState({required RidePreferenceRepository repository})
      : _repository = repository {
    _history = _repository.getPastPreferences();
  }

  RidePreference? get currentPreference => _currentPreference;

  List<RidePreference> get preferencesHistory => _history;

  void selectPreference(RidePreference preference) {
    if (preference != _currentPreference) {
      _currentPreference = preference;

      _repository.addPreference(preference);
      _history = _repository.getPastPreferences();

      notifyListeners();
    }
  }
}
