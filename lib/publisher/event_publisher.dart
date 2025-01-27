import 'dart:async';

class EventPublisher {
  StreamController? _streamController;
  String? test;

  EventPublisher._internal();
  static EventPublisher? _instance;
  static EventPublisher getInstance() {
    if (_instance == null) {
      _instance = EventPublisher();
      return _instance!;
    } else {
      return _instance!;
    }
  }

  StreamController? get streamController => _streamController;

  EventPublisher({bool sync = false})
      : _streamController = StreamController.broadcast(sync: sync) {
    test = "test shod";
  }

  EventPublisher.customController(StreamController controller)
      : _streamController = controller;

  Stream<T>? on<T>() {
    if (T == dynamic) {
      return streamController?.stream as Stream<T>?;
    } else {
      return streamController?.stream.where((event) => event is T).cast<T>();
    }
  }

  void fire(event) {
    streamController?.add(event);
  }

  void destroy() {
    _streamController?.close();
  }
}
