part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int? inputNumber;
  final String convertResult;

  const HomeState({
    this.inputNumber,
    this.convertResult = '',
  });

  HomeState copyWith({
    int? inputNumber,
    String? convertResult,
  }) {
    return HomeState(
      inputNumber: inputNumber ?? this.inputNumber,
      convertResult: convertResult ?? this.convertResult,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        inputNumber,
        convertResult,
      ];

  @override
  String toString() {
    return 'HomeState: { '
        'inputNumber: $inputNumber, '
        'convertResult: $convertResult, '
        '}';
  }
}
