import 'package:auto_route/auto_route.dart';
import 'package:beautyapp/layout/taps_name.dart';

import 'trainer_details_screen.dart';
import 'trainers_list_screen.dart';

const trainersTab = AutoRoute(
  path: 'trainers',
  page: EmptyRouterPage,
  name: 'TrainersTab',
  children: [
    AutoRoute(
      path: '',
      page: TrainersListScreen,
      name: trainers,
    ),
    AutoRoute(
      path: ':trainer',
      page: TrainerDetailsScreen,
      meta: {'hideBottomNav': true},
    ),
  ],
);
