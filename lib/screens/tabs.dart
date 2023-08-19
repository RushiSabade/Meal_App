
import 'package:flutter/material.dart';
import 'package:meal_app_project/data/dummy.dart';
import 'package:meal_app_project/screens/categories.dart';
import 'package:meal_app_project/screens/filters.dart';
import 'package:meal_app_project/screens/meals.dart';

import '../models/meal.dart';
import '../widgets/main_drawer.dart';


 const kIntialFilters=
 {

   Filter.glutenFree:false,
   Filter.lactoseFree:false,
   Filter.vegetarianFree:false,
   Filter.veganFree:false,

 };

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return TabsScreenState();
  }
}

class TabsScreenState extends State<TabsScreen> {
  int selectedPageIndex = 0;

  final List<Meal> favoriteMeals = [];

  Map<Filter,bool> selectedFilters= kIntialFilters;

  void toggelMealFavoriteStatus(Meal meal) {
    final isExisting = favoriteMeals.contains(meal);

    if (isExisting) {
      setState(() {
        favoriteMeals.remove(meal);
      });
    } else {
      setState(() {
        favoriteMeals.add(meal);
      });
    }}
  void selectPage(int index) {
      setState(() {
        selectedPageIndex = index;
      });
    }
    void setScreen(String identifier) async {
      Navigator.of(context).pop();
      if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter,bool>>(
            MaterialPageRoute(
              builder: (context) => FiltersScreen(currentFilters: selectedFilters,),
            ),
      );
      setState(() {
        selectedFilters=result ?? kIntialFilters;
      });
      }
      }

      @override
      Widget build(BuildContext context) {

        final availableMeals =dummyMeals.where((meal) {
      if(selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
      }
      if(selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if(selectedFilters[Filter.vegetarianFree]! && !meal.isVegetarian) {
        return false;
      }
      if(selectedFilters[Filter.veganFree]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

        Widget activePage = CategoriesScreen(
          onToggelFavorite: toggelMealFavoriteStatus,
          availableMeals: availableMeals,
        );

        var activePageTitle = 'Categories';

        if (selectedPageIndex == 1) {
          activePage = MealsScreen(
            meals: favoriteMeals,
            onToggelFavorite: toggelMealFavoriteStatus,
          );
          activePageTitle = 'Your Favorites';
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(activePageTitle),
          ),
          drawer: MainDrawer(
            onSelectScreen: setScreen,
          ),
          body: activePage,
          bottomNavigationBar: BottomNavigationBar(
            onTap: selectPage,
            currentIndex: selectedPageIndex, //for highlighr touch icon
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.set_meal), label: 'Categories'),
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: 'Favorites',
              ),
            ],
          ),
        );
      }
    }


