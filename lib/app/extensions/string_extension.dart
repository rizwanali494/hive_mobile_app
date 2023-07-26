extension StringExtension on String {
  Uri get parsedUri {
    return Uri.parse(this);
  }
}
