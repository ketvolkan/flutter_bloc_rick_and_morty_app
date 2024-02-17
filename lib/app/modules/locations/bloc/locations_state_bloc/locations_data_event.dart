abstract class LocationsDataEvent {}

class LocationsSendEvent extends LocationsDataEvent {}

class LocationsErrorEvent extends LocationsDataEvent {
  dynamic err;
  LocationsErrorEvent(this.err);
}

class LocationsLoadedEvent extends LocationsDataEvent {
  dynamic data;
  LocationsLoadedEvent(this.data);
}
