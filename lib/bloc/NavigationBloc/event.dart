// Events
abstract class NavigationEvent {}

class LoadDataEvent extends NavigationEvent {}

class NavigateToHomeEvent extends NavigationEvent {}

class NavigateToSearchEvent extends NavigationEvent {}

class NavigateToSavedEvent extends NavigationEvent {}
