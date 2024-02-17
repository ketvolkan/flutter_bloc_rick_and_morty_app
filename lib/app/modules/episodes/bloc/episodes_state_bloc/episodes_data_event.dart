abstract class EpisodesDataEvent {}

class EpisodesSendEvent extends EpisodesDataEvent {}

class EpisodesErrorEvent extends EpisodesDataEvent {
  dynamic err;
  EpisodesErrorEvent(this.err);
}

class EpisodesLoadedEvent extends EpisodesDataEvent {
  dynamic data;
  EpisodesLoadedEvent(this.data);
}
