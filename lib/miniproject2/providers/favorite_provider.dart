import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteNotifier extends Notifier<Set<String>> {
  @override
  Set<String> build() => {};

  void toggle(String productTitle) {
    if (state.contains(productTitle)) {
      state = Set.from(state)..remove(productTitle);
    } else {
      state = {...state, productTitle};
    }
  }
}

final favoriteProvider = NotifierProvider<FavoriteNotifier, Set<String>>(
  FavoriteNotifier.new,
);
