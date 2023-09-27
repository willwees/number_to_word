import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeUpdateInputNumberEvent>(_updateInputNumber);
    on<HomeConvertNumberEvent>(_convertNumber);
  }

  void _updateInputNumber(HomeUpdateInputNumberEvent event, Emitter<HomeState> emit) {
    final int? inputNumber = int.tryParse(event.value);

    emit(
      state.copyWith(
        inputNumber: inputNumber,
      ),
    );
  }

  void _convertNumber(HomeConvertNumberEvent event, Emitter<HomeState> emit) {
    // TODO: implement event handler
  }
}
