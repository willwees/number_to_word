class NumberToWordHelper {
  static final List<String> _numberWordList = <String>[
    '',
    'one',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
    'eight',
    'nine',
    'ten',
    'eleven',
    'twelve',
    'thirteen',
    'fourteen',
    'fifteen',
    'sixteen',
    'seventeen',
    'eighteen',
    'nineteen',
  ];

  static final List<String> _tensWordList = <String>[
    '',
    '',
    'twenty',
    'thirty',
    'forty',
    'fifty',
    'sixty',
    'seventy',
    'eighty',
    'ninety',
  ];

  static final List<String> _thousandsWordList = <String>[
    '',
    'thousand',
    'million',
    'billion',
    'trillion',
  ];

  static String convertNumberToWord(int number) {
    if (number == 0) {
      return 'zero';
    }

    String result = '';
    int testedNumber = number;
    int thousandsIndex = 0;

    while (testedNumber > 0) {
      final int remainder = testedNumber % 1000;

      if (remainder < 20) {
        result = '${_numberWordList[remainder]} ${_thousandsWordList[thousandsIndex]} $result';
      } else if (remainder < 100) {
        result =
            '${_tensWordList[remainder ~/ 10]}-${_numberWordList[remainder % 10]} ${_thousandsWordList[thousandsIndex]} $result';
      } else {
        String tensWord = '';

        // check if there is tens word
        if (remainder % 100 != 0) {
          tensWord = '${_tensWordList[remainder % 100 ~/ 10]}-${_numberWordList[remainder % 10]} ';
        }

        result = '${_numberWordList[remainder ~/ 100]} hundred $tensWord${_thousandsWordList[thousandsIndex]} $result';
      }

      testedNumber = testedNumber ~/ 1000;
      thousandsIndex++;
    }

    return result.trim();
  }
}
