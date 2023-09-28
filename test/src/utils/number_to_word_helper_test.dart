import 'package:flutter_test/flutter_test.dart';
import 'package:number_to_word/src/utils/number_to_word_helper.dart';

void main() {
  group('convertNumberToWord', () {
    test('Test converting 0', () {
      final String word = NumberToWordHelper.convertNumberToWord(0);
      expect(word, 'zero');
    });

    test('Test converting 1', () {
      final String word = NumberToWordHelper.convertNumberToWord(1);
      expect(word, 'one');
    });

    test('Test converting 21', () {
      final String word = NumberToWordHelper.convertNumberToWord(21);
      expect(word, 'twenty-one');
    });

    test('Test converting 77', () {
      final String word = NumberToWordHelper.convertNumberToWord(77);
      expect(word, 'seventy-seven');
    });

    test('Test converting 177', () {
      final String word = NumberToWordHelper.convertNumberToWord(177);
      expect(word, 'one hundred seventy-seven');
    });

    test('Test converting 200', () {
      final String word = NumberToWordHelper.convertNumberToWord(200);
      expect(word, 'two hundred');
    });

    test('Test converting 2023', () {
      final String word = NumberToWordHelper.convertNumberToWord(2023);
      expect(word, 'two thousand twenty-three');
    });

    test('Test converting 17766555', () {
      final String word = NumberToWordHelper.convertNumberToWord(17766555);
      expect(word, 'seventeen million seven hundred sixty-six thousand five hundred fifty-five');
    });

    test('Test converting 999999999999999', () {
      final String word = NumberToWordHelper.convertNumberToWord(999999999999999);
      expect(
        word,
        'nine hundred ninety-nine trillion nine hundred ninety-nine billion nine hundred ninety-nine million nine hundred ninety-nine thousand nine hundred ninety-nine',
      );
    });
  });
}
