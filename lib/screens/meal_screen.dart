import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MealPlannerScreen extends StatefulWidget {
  @override
  _MealPlannerScreenState createState() => _MealPlannerScreenState();
}

class _MealPlannerScreenState extends State<MealPlannerScreen> {
  Map<String, dynamic>? mealPlanData;

  @override
  void initState() {
    super.initState();
    fetchMealPlanData();
  }

  Future<void> fetchMealPlanData() async {
    final response = await http.get(
        Uri.parse('https://api.spoonacular.com/mealplanner/generate?apiKey=8ae60dc93b344e6bbd8f862e4b6bff41'));

    if (response.statusCode == 200) {
      setState(() {
        mealPlanData = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load meal plan data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Planner'),
      ),
      body: mealPlanData == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: mealPlanData!['week'].length,
              itemBuilder: (context, index) {
                String day = [
                  'monday',
                  'tuesday',
                  'wednesday',
                  'thursday',
                  'friday',
                  'saturday',
                  'sunday'
                ][index];
                List meals = mealPlanData!['week'][day]['meals'];
                return ListTile(
                  title: Text(day.capitalize()),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Meals:'),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: meals
                            .map<Widget>((meal) => Text('- ${meal['title']}'))
                            .toList(),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}