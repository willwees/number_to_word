part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => <Object?>[];
}

class HomeUpdateInputNumberEvent extends HomeEvent {
  final String value;

  const HomeUpdateInputNumberEvent({required this.value});

  @override
  List<Object?> get props => <Object?>[value];
}

class HomeConvertNumberEvent extends HomeEvent {}
