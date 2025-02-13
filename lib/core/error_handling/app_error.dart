class AppError {
  const AppError(this.message, {this.details});

  final String message;
  final String? details;

  @override
  String toString() {
    return 'AppError {message: $message, details: $details}';
  }
}
