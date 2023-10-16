import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/app_provider.dart';
class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppProvider>();
    final theme = Theme.of(context); 
    final style = theme.textTheme.headlineSmall!.copyWith(
      fontWeight: FontWeight.w700,
    );
    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('Нет избранного.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'У вас ${appState.favorites.length} избранных:',
            style: style,
          ),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
}
