/// AppEvent
abstract class AppEvent {
  const AppEvent();
}

/// TriggerAppEvent
class TriggerAppEvent extends AppEvent {
  final int index;

  const TriggerAppEvent(this.index) : super();
}
