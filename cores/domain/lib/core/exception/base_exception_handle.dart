import 'fast_ai_error.dart';

typedef BaseExceptionListener = void Function(Object e);

mixin BaseException {
  final List<BaseExceptionListener> _listeners = List.empty(growable: true);

  FastAIError handleError(Object e);

  Object ? errorMapperHandler(FastAIError error);

  void addListener(BaseExceptionListener listener){
    if(_listeners.contains(listener)) return;

    _listeners.add(listener);
  }

  void removeListener(BaseExceptionListener listener){
    if(!_listeners.contains(listener)) return;

    _listeners.remove(listener);
  }

  void clear(){
    _listeners.clear();
  }

  void observersError(Object e){
    for(final listener in _listeners){
      listener.call(e);
    }
  }
}