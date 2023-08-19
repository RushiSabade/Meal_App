import 'package:flutter/material.dart';
import 'package:meal_app_project/widgets/main_drawer.dart';
import 'package:meal_app_project/screens/tabs.dart';

enum Filter { glutenFree, lactoseFree, vegetarianFree, veganFree }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter,bool> currentFilters;
  @override
  State<StatefulWidget> createState() {
    return FiltersScreenState();
  }
}

class FiltersScreenState extends State<FiltersScreen> {
  var glutenFreeFilterSet = false;
  var lactoseFreeFilterSet = false;
  var vegetarianFreeFilterSet = false;
  var veganFreeFilterSet = false;

@override
  void initState() {
    super.initState();
    glutenFreeFilterSet=widget.currentFilters[Filter.glutenFree]!;
    lactoseFreeFilterSet=widget.currentFilters[Filter.lactoseFree]!;
    vegetarianFreeFilterSet=widget.currentFilters[Filter.vegetarianFree]!;
    veganFreeFilterSet=widget.currentFilters[Filter.veganFree]!;

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == 'meals') {
      //     Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(
      //         builder: (context) => const TabsScreen(),
      //       ),
      //     );
      //   }
      // }
      // ),
      body: WillPopScope(
        onWillPop: () async{
          Navigator.of(context).pop({
            Filter.glutenFree: glutenFreeFilterSet,
            Filter.lactoseFree: lactoseFreeFilterSet,
            Filter.vegetarianFree: vegetarianFreeFilterSet,
            Filter.veganFree: veganFreeFilterSet,
          });
          return false;
        },
        child: Column(children: [
          SwitchListTile(
            value: glutenFreeFilterSet,
            onChanged: (isChecked) {
              setState(() {
                glutenFreeFilterSet = isChecked;
              });
            },
            title: Text(
              'GUlen-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include gluen free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: lactoseFreeFilterSet,
            onChanged: (isChecked) {
              setState(() {
                lactoseFreeFilterSet = isChecked;
              });
            },
            title: Text(
              'Lactose-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include lactose free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: vegetarianFreeFilterSet,
            onChanged: (isChecked) {
              setState(() {
                vegetarianFreeFilterSet = isChecked;
              });
            },
            title: Text(
              'Vegetarian-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include vegetarian free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: veganFreeFilterSet,
            onChanged: (isChecked) {
              setState(() {
                veganFreeFilterSet = isChecked;
              });
            },
            title: Text(
              'Vegan-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include vegan free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ]),
      ),
    );
  }
}
