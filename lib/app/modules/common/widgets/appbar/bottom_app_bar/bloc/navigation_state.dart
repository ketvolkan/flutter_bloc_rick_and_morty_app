import 'package:equatable/equatable.dart';
import '../../../../../../../core/variables/enums.dart';

class NavigationState extends Equatable {
  BottomBarRoutes selectedTab = BottomBarRoutes.charachter;

  NavigationState({this.selectedTab = BottomBarRoutes.charachter});

  @override
  List<Object?> get props => [selectedTab];

  NavigationState copyWith({BottomBarRoutes? selectedTab}) => NavigationState(selectedTab: selectedTab ?? this.selectedTab);
}
