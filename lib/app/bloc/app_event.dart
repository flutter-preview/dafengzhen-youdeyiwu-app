/// AppEvent
abstract class AppEvent {
  const AppEvent();
}

/// TriggerAppEvent
class TriggerAppEvent extends AppEvent {
  final int index;
  final int currentIndex;

  const TriggerAppEvent(this.index, this.currentIndex) : super();
}
