import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:hydrated_bloc_example/bloc/counter_event.dart';
import 'package:hydrated_bloc_example/bloc/counter_state.dart';
import 'package:hydrated_bloc_example/model/counter_model.dart';

class CounterBloc extends HydratedBloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<CounterStarted>(_onStarted);
    on<CounterIncrementPressed>(_onIncrementPressed);
    on<CounterDecrementPressed>(_onDecrementPressed);
  }

  void _onStarted(CounterStarted event, Emitter<CounterState> emit) {
    if (state.status == CounterStatus.success) return;
    Counter counter = const Counter();
    emit(CounterState(
      counter: counter,
      status: CounterStatus.success,
    ));
  }

  void _onIncrementPressed(
      CounterIncrementPressed event, Emitter<CounterState> emit) {
    int value = state.counter.value + 1;
    Counter counter = state.counter.copyWith(value: value);
    emit(CounterState(
      counter: counter,
      status: CounterStatus.success,
    ));
  }

  void _onDecrementPressed(
      CounterDecrementPressed event, Emitter<CounterState> emit) {
    int value = state.counter.value - 1;
    Counter counter = state.counter.copyWith(value: value);
    emit(CounterState(
      counter: counter,
      status: CounterStatus.success,
    ));
  }

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return state.toJson();
  }
}
