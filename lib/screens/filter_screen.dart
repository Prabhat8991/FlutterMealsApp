import 'package:flutter/material.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var activeFilters = ref.watch(filterNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Filters")),
      body: Column(
        children: [
          SwitchListTile(
            onChanged: (isChanged) {
              ref
                  .read(filterNotifierProvider.notifier)
                  .setFilter(Filters.glutenFree, isChanged);
            },
            value: activeFilters[Filters.glutenFree]!,
            title: Text(
              "Gluten-free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "Filer gluten free meal",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 16, right: 16),
          ),
          SwitchListTile(
            onChanged: (isChanged) {
              ref
                  .read(filterNotifierProvider.notifier)
                  .setFilter(Filters.lactoseFree, isChanged);
            },
            value: activeFilters[Filters.lactoseFree]!,
            title: Text(
              "lactose-free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "Lactose free meal",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 16, right: 16),
          ),
          SwitchListTile(
            onChanged: (isChanged) {
              ref
                  .read(filterNotifierProvider.notifier)
                  .setFilter(Filters.vegetarian, isChanged);
            },
            value: activeFilters[Filters.vegetarian]!,
            title: Text(
              "Vegetarian",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "Vegetarian meal",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 16, right: 16),
          ),
          SwitchListTile(
            onChanged: (isChanged) {
              ref
                  .read(filterNotifierProvider.notifier)
                  .setFilter(Filters.vegan, isChanged);
            },
            value: activeFilters[Filters.vegan]!,
            title: Text(
              "vegan",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "Vegan meal",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 16, right: 16),
          ),
        ],
      ),
    );
  }
}
