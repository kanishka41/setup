import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:into_page/preganent/food/model/meal_plan_model.dart';
import 'package:into_page/preganent/food/model/recipe_model.dart';

class ApiService {
  // Singleton pattern
  static final ApiService _singleton = ApiService._internal();

  // Private constructor
  ApiService._internal();

  // Factory constructor to return the singleton instance
  factory ApiService.instance() => _singleton;

  final String _baseURL = "https://api.spoonacular.com";
  static const String API_KEY = "f6e45c65a1a648e697f63531d1951929";

  Future<MealPlan> generateMealPlan(
      {required int targetCalories, required String diet}) async {
    if (diet == 'None') diet = '';
    Map<String, String> parameters = {
      'timeFrame': 'day',
      'targetCalories': targetCalories.toString(),
      'diet': diet,
      'apiKey': API_KEY,
    };

    Uri uri = Uri.https(
      _baseURL,
      '/recipes/mealPlans/generate',
      parameters,
    );

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);
      Map<String, dynamic> data = json.decode(response.body);
      MealPlan mealPlan = MealPlan.fromMap(data);
      return mealPlan;
    } catch (err) {
      throw err.toString();
    }
  }

  Future<Recipe> fetchRecipe(String id) async {
    Map<String, String> parameters = {
      'includeNutrition': 'false',
      'apiKey': API_KEY,
    };

    Uri uri = Uri.https(
      _baseURL,
      '/recipes/$id/information',
      parameters,
    );

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);
      Map<String, dynamic> data = json.decode(response.body);
      Recipe recipe = Recipe.fromMap(data);
      return recipe;
    } catch (err) {
      throw err.toString();
    }
  }
}

Future<void> fetchMealPlanData() async {
  Map<String, dynamic>? mealPlanData;
  final response = await http.get(Uri.parse(
      'https://api.spoonacular.com/mealplanner/generate?apiKey=8ae60dc93b344e6bbd8f862e4b6bff41'));

  if (response.statusCode == 200) {
    mealPlanData = json.decode(response.body);
  } else {
    throw Exception('Failed to load meal plan data');
  }
}
