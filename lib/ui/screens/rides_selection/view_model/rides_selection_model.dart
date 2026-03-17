import 'package:flutter/foundation.dart';

import '../../../../data/repositories/ride/ride_repository.dart';
import '../../../../model/ride/ride.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../states/ride_preferences_state.dart';

class RidesSelectionViewModel extends ChangeNotifier {
  final RidePreferencesState _ridePreferencesState;
  final RideRepository _rideRepository;

  RidesSelectionViewModel({
    required RidePreferencesState ridePreferencesState,
    required RideRepository rideRepository,
  })  : _ridePreferencesState = ridePreferencesState,
        _rideRepository = rideRepository {
    _ridePreferencesState.addListener(_onStateChanged);
  }

  void _onStateChanged() {
    notifyListeners();
  }

  RidePreference get currentPreference =>
      _ridePreferencesState.currentPreference!;

  List<RidePreference> get preferencesHistory =>
      _ridePreferencesState.preferencesHistory;

  List<Ride> get matchingRides =>
      _rideRepository.getRidesFor(currentPreference);

  void selectPreference(RidePreference preference) {
    _ridePreferencesState.selectPreference(preference);
  }

  @override
  void dispose() {
    _ridePreferencesState.removeListener(_onStateChanged);
    super.dispose();
  }
}
