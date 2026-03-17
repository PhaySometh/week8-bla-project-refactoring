import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/ride/ride_repository.dart';
import '../../states/ride_preferences_state.dart';
import 'view_model/rides_selection_model.dart';
import 'widgets/rides_selection_content.dart';

class RidesSelectionScreen extends StatefulWidget {
  const RidesSelectionScreen({super.key});

  @override
  State<RidesSelectionScreen> createState() => _RidesSelectionScreenState();
}

class _RidesSelectionScreenState extends State<RidesSelectionScreen> {
  late final RidesSelectionViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = RidesSelectionViewModel(
      ridePreferencesState: context.read<RidePreferencesState>(),
      rideRepository: context.read<RideRepository>(),
    );
    _viewModel.addListener(_onViewModelChanged);
  }

  void _onViewModelChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _viewModel.removeListener(_onViewModelChanged);
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RidesSelectionContent(viewModel: _viewModel);
  }
}
