

import 'package:flutter/material.dart';
import 'package:meal_app_project/models/meal.dart';
import 'package:meal_app_project/screens/meal_details_Screen.dart';
import 'package:meal_app_project/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {

  const MealsScreen({
    super.key,
     this.title,
    required this.meals,
    required this.onToggelFavorite
  });

  final String? title;
  final List<Meal> meals;
  final void Function (Meal meal) onToggelFavorite;

  void selectMeal(BuildContext context,Meal meal){
    Navigator.of(context).push
    (MaterialPageRoute(builder:(ctx)=>
        MealDetailScreen(
          meal: meal,
          onToggleFavorite: onToggelFavorite,
        ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh Oh...nothing Here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Try Selecting a different category!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );

if(meals.isNotEmpty){
  content=ListView.builder(itemCount: meals.length,
  itemBuilder:(context, index) => MealItem(meal: meals[index],
      onSelectMeal:(context, meal) {
    selectMeal(context,meal);

      },
  ),

  );
}

if(title==null){
  return content;
}

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
//     ListView.builder(itemBuilder: (context, index) => Text(
//     itemBuider:(ctx,index)=>Text(
// meals[index].title,

//           Center(
//       child:Column(
//       mainAxisSize:MainAxisSize.min,
// children:[
//       Text(
// 'Uh Oh...nothing Here!',
// style:Theme.of(context).textTheme.headlineLarge!,copyWith(
// color:Theme.of(context).colorScheme.onBackground,
// ),
// )
// const SizedBox(height:16),
// Text(
// 'Try Selecting a different category!',
// style:Theme.of(context).textTheme.headdlineLarge!,copyWith(
// color:Theme.of(context).colorScheme.onBackground,
// ),
// ),
