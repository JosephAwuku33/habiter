import 'package:flutter/material.dart';
import 'package:habiter/widgets/activity_widgets.dart';
import 'package:habiter/widgets/gridview_widget.dart';
import 'package:provider/provider.dart';

import '../provider/habit_provider.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final _titleController = TextEditingController();

  final _detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final habitProvider = Provider.of<HabitProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //First container is for the upper section of the page
        Container(
          width: double.infinity,
          height: 300,
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
                const Text("Create New Habit", style: TextStyle(fontSize: 24)),
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Field cannot be empty";
                    }
                    return null;
                  },
                  controller: _titleController,
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
                    if (value!.isEmpty) {
                      return "Field cannot be empty";
                    }
                    return null;
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
          child: const Padding(
            padding: EdgeInsets.only(left: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Choose your Habit"),
                SizedBox(height: 20),
                ActivityWidgets(),
                SizedBox(height: 20),
                Text("Choose Time in a Day"),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        const MyGridView(),
        //const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
              child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  habitProvider.updateTitle(_titleController.toString());
                  habitProvider.updateDetails(_detailsController.toString());
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
    );
  }
}
