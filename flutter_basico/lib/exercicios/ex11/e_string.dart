extension ValidEmail on String {
  bool isValidEmail() => this.contains('@') && this.contains('.');
}

extension NullOrEmpty on String? {
  bool isEmptyOrNull() => this == null || this!.trim().isEmpty;
}
