import 'package:flutter/material.dart';
import 'package:into_page/screens/meal_screen.dart';
// Assuming MealPlannerScreen is in a file named search_screen.dart

class SecondPage1 extends StatefulWidget {
  const SecondPage1({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage1> {
  final List<String> _diets = [
    'None',
    'Gluten Free',
    'Ketogenic',
    'Lacto-Vegetarian',
    'Ovo-Vegetarian',
    'Vegan',
    'Pescetarian',
    'Paleo',
    'Primal',
    'Whole30',
  ];

  double _targetCalories = 2250;
  String _selectedDiet = 'None';

  Future<void> _searchMealPlanHandler(BuildContext context) async {
    try {
      // ApiService _apiService = ApiService.instance();
      // MealPlan mealPlan = await _apiService.generateMealPlan(
      //   targetCalories: _targetCalories.toInt(),
      //   diet: _selectedDiet,
      // );
      // print("UIN SEARCH");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => MealPlannerScreen()),
      );
    } catch (e) {
      // Handle error (e.g., display an error message)
      print('Error fetching meal plan: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=353&q=80'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            padding: const EdgeInsets.symmetric(horizontal: 30),
            height: MediaQuery.of(context).size.height * 0.55,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'My Daily Meal Planner',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontSize: 25), // Add null check
                    children: [
                      TextSpan(
                        text: _targetCalories.truncate().toString(),
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(
                        text: ' cal',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Slider(
                  min: 0,
                  max: 4500,
                  value: _targetCalories,
                  onChanged: (value) {
                    setState(() {
                      _targetCalories = value.round().toDouble();
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: DropdownButtonFormField<String>(
                    items: _diets.map((String diet) {
                      return DropdownMenuItem<String>(
                        value: diet,
                        child: Text(
                          diet,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      labelText: 'Diet',
                      labelStyle: TextStyle(fontSize: 18),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _selectedDiet = value ?? '';
                      });
                    },
                    value: _selectedDiet,
                  ),
                ),
                const SizedBox(height: 30),
                TextButton(
                  style: TextButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 60, vertical: 8),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () => _searchMealPlanHandler(context),
                  child: const Text(
                    'Search',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
