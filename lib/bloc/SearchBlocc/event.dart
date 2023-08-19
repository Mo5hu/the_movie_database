// Events
abstract class SearchEvent {}

class LoadDataEvent extends SearchEvent {
  final String query;
  LoadDataEvent(this.query);
}
