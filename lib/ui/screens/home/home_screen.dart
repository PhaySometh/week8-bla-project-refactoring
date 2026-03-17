import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../states/ride_preferences_state.dart';
import 'view_model/home_model.dart';
import 'widgets/home_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel(
      ridePreferencesState: context.read<RidePreferencesState>(),
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
    return HomeContent(viewModel: _viewModel);
  }
}
