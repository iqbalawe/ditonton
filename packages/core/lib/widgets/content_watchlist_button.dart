import 'package:flutter/material.dart';
import 'package:core/core.dart';

class ContentWatchlistButton extends StatelessWidget {
  final bool isAdded;
  final VoidCallback onPressed;

  const ContentWatchlistButton({
    super.key,
    required this.isAdded,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: mikadoYellow,
        foregroundColor: richBlack,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          isAdded ? const Icon(Icons.check) : const Icon(Icons.add),
          const SizedBox(width: 4),
          const Text('Watchlist'),
        ],
      ),
    );
  }
}
