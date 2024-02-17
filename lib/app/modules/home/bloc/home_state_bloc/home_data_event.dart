abstract class HomeDataEvent {}

class HomeSendEvent extends HomeDataEvent {}

class HomeErrorEvent extends HomeDataEvent {
  dynamic err;
  HomeErrorEvent(this.err);
}

class HomeLoadedEvent extends HomeDataEvent {
  dynamic data;
  HomeLoadedEvent(this.data);
}
