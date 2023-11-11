import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

showLoading(BuildContext context) => showDialog(
      context: context,
      builder: (x) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
