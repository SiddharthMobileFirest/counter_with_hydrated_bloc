import 'package:equatable/equatable.dart';

class Counter extends Equatable {
  final int value;

  const Counter({this.value = 0});

  Counter copyWith({int? value}) => Counter(value: value ?? this.value);

  Map<String, dynamic> toJson() => {'value': value};

  factory Counter.fromJson(Map<String, dynamic> json) =>
      Counter(value: json['value']);

  @override
  List<Object?> get props => [value];
}
