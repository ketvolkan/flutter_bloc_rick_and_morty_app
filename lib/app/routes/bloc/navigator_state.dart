import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_rick_and_morty_app/core/variables/enums.dart';

class NavigatorState extends Equatable {
  bool showDashboard = false;
  BuildContext? context;
  NavigatorState({this.showDashboard = false, this.context});

  @override
  List<Object?> get props => [showDashboard, context];

  NavigatorState copyWith({bool? showDashboard, BuildContext? context}) => NavigatorState(
        showDashboard: showDashboard ?? this.showDashboard,
        context: context ?? this.context,
      );
}
