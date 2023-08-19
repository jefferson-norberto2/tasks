

abstract class ICounterState {}

class SucessCounterState implements ICounterState {
  final int value;

  SucessCounterState(this.value);
}

class EmptyCounterState extends ICounterState{
}

class ErrorCounterState extends ICounterState{
  final String message;

  ErrorCounterState(this.message);
}

class LoadingCounterState extends ICounterState{}