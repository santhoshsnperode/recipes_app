import 'package:flutter/material.dart';

import 'models/category.dart';
import 'models/meal.dart';

const DUMMY_CATEGORIES = const [
  Category(
    'c1',
    'Italian',
    Colors.purple,
  ),
  Category(
    'c2',
    'Quick & Easy',
     Colors.red,
  ),
  Category(
    'c3',
    'Hamburgers',
   Colors.orange,
  ),
  Category(
  'c4',
    'German',
    Colors.amber,
  ),
  Category(
  'c5',
     'Light & Lovely',
     Colors.blue,
  ),
  Category(
     'c6',
     'Exotic',
    Colors.green,
  ),
  Category(
    'c7',
     'Breakfast',
     Colors.lightBlue,
  ),
  Category(
    'c8',
     'Asian',
     Colors.lightGreen,
  ),
  Category(
     'c9',
     'French',
     Colors.pink,
  ),
  Category(
     'c10',
     'Summer',
     Colors.teal,
  ),
];
const DUMMY_MEALS = const[
  Meal('m1', ['c1','c2'], 'Beetroot Spaghati', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg', ['4 Tomatoes',
    '1 Tablespoon of Olive Oil',
    '1 Onion',
    '250g Spaghetti',
    'Spices',
    'Cheese (optional)'], ['Cut the tomatoes and the onion into small pieces.',
    'Boil some water - add salt to it once it boils.',
    'Put the spaghetti into the boiling water - they should be done in about 10 to 12 minutes.',
    'In the meantime, heaten up some olive oil and add the cut onion.',
    'After 2 minutes, add the tomato pieces, salt, pepper and your other spices.',
    'The sauce will be done once the spaghetti are.',
    'Feel free to add some cheese on top of the finished dish.'], 60, Complexity.Simple, Affordability.Low, true, true, true, true),

  Meal('m2', ['c3','c4'], 'Lasagne', 'https://realfood.tesco.com/media/images/LASAGNE-2-CLEAN-1400x919-mini-84433cf0-e601-4352-be89-de12013e52d0-0-1400x919.jpg',
      ['1 Slice White Bread',
        '1 Slice Ham',
        '1 Slice Pineapple',
        '1 Slices of Cheese',
        'Butter'],[
'Butter one side of the white bread',
'Layer ham, the pineapple and cheese on the white bread',
'Bake'], 20, Complexity.Medium, Affordability.High, false, true, true, true),
];