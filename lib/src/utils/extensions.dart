extension StringExtension on String {
  String get capitalizeFirst =>
      length == 0 ? this : "${this[0].toUpperCase()}${substring(1)}";
}
