import '../../../../../../../core/variables/enums.dart';

abstract class NavigationEvent {
  BottomBarRoutes get route;
}

class CharacterEvent extends NavigationEvent {
  @override
  BottomBarRoutes get route => BottomBarRoutes.charachter;
}

class LocationEvent extends NavigationEvent {
  @override
  BottomBarRoutes get route => BottomBarRoutes.location;
}

class EpisodesEvent extends NavigationEvent {
  @override
  BottomBarRoutes get route => BottomBarRoutes.episodes;
}

class SettingsEvent extends NavigationEvent {
  @override
  BottomBarRoutes get route => BottomBarRoutes.settings;
}
