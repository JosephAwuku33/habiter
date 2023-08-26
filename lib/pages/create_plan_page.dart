import 'package:flutter/material.dart';
import 'package:habiter/models/hive_data/habit_model.dart';
import 'package:habiter/widgets/activity_widgets.dart';
import 'package:habiter/widgets/gridview_widget.dart';
import 'package:habiter/models/habit.dart';
import 'package:habiter/provider/habit_provider.dart';
import 'package:provider/provider.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _detailsController = TextEditingController();

  String _habitTitle = '';
  String _habitDetails = '';
  String _selectedActivity = '';
  String _selectedTimePeriod = '';

  final successSnackBar = const SnackBar(
    content: Text('Operation performed succesfully'),
  );

  final errorSnackBar = const SnackBar(content: Text('Error creating habit'));

  @override
  void dispose() {
    _titleController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  void _onSubmit(HabitProvider habitProvider) {
    try {
      if (_formKey.currentState!.validate()) {
        /*
        final newHabit = Habit(
            title: _habitTitle,
            details: _habitDetails,
            activity: _selectedActivity,
            period: _selectedTimePeriod);
        habitProvider.addHabit(newHabit);
*/
        final newHabit = Habiter(
            habitName: _habitTitle,
            habitDetails: _habitDetails,
            habitPeriod: _selectedTimePeriod,
            habitActivity: _selectedActivity,
            dateTaken: DateTime.now());
        habitProvider.addHabit(newHabit);
        ScaffoldMessenger.of(context).showSnackBar(successSnackBar);
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
      debugPrint(error.toString());
    } finally {}
  }

  @override
  Widget build(BuildContext context) {
    _titleController.text = _habitTitle; // Set initial value
    _detailsController.text = _habitDetails; // Set initial value

    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //First container is for the upper section of the page
          Container(
            width: double.infinity,
            height: 330,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.cancel_sharp, size: 24)),
                  const SizedBox(height: 20),
                  const Text("Create New Habit",
                      style: TextStyle(fontSize: 24)),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _titleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field cannot be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _habitTitle = value; // Update the habit title
                    },
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Habit Title",
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _detailsController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field cannot be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _habitDetails = value; // Update the habit details
                    },
                    style: const TextStyle(fontSize: 15),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Add your habit details",
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.only(left: 12),
            child: Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Choose your Habit"),
                  const SizedBox(height: 20),
                  //
                  ActivityWidgets(
                      onSelectedActivity: (String value) {
                        setState(() {
                          _selectedActivity = value;
                        });
                      },
                      selectedActivity: _selectedActivity),

                  //
                  const SizedBox(height: 20),
                  const Text("Choose Time in a Day"),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          MyGridView(
            onTimePeriodSelected: (timePeriod) {
              setState(() {
                _selectedTimePeriod = timePeriod;
              });
            },
            selectedTimePeriod: _selectedTimePeriod,
          ),
          //const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
                child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    final habitProvider =
                        Provider.of<HabitProvider>(context, listen: false);
                    _onSubmit(habitProvider);
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.orange[500],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    "Add to my Plan",
                    style: TextStyle(color: Colors.white),
                  )),
            )),
          )
        ])),
      ),
    );
  }
}
