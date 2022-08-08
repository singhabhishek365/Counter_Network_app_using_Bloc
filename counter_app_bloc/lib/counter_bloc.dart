import 'dart:async';

enum CounterAction { increment, decrement, reset }

class CounterBloc {
  int counter = 0;
  //Private so that only accessible inside class. This is controlling Stream
  final _stateStreamController = StreamController<int>();
  // For Input Sink
  StreamSink<int> get counterSink => _stateStreamController.sink;

  // For Output Stream
  Stream<int> get counterStream {
    return _stateStreamController.stream;
  }

  final _eventStreamController = StreamController<CounterAction>();
  // For Input Sink
  StreamSink<CounterAction> get eventSink {
    return _eventStreamController.sink;
  }

  // For Output Stream
  Stream<CounterAction> get eventStream {
    return _eventStreamController.stream;
  }

  // Here We will Listen change in screen through Event
  CounterBloc() {
    eventStream.listen((event) {
      if (event == CounterAction.increment) {
        counter++;
      }
      // Adds Event data to sink
      counterSink.add(counter);
    });
  }
}
