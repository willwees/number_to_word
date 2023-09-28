extension StringExtension on String {
  String get capitalizeFirstLetter => length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
}
