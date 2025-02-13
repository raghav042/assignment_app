import 'package:assignment_app/core/constant/app_strings.dart';
import 'package:flutter/material.dart';
import '../../core/error_handling/app_error.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget(this.error, {super.key, required, this.onRetry});
  final AppError error;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: Colors.red.shade700),
          const SizedBox(width: 10),
          Expanded(child: Text(error.message)),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text(AppStrings.retry),
          ),
        ],
      ),
    );
  }
}
