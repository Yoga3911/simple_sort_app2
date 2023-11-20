import 'package:couting_sort/counting_sort.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> numbers = [];
  TextEditingController arrayC = TextEditingController();
  TextEditingController beforeC = TextEditingController();
  TextEditingController afterC = TextEditingController();

  @override
  void dispose() {
    arrayC.dispose();
    beforeC.dispose();
    afterC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counting Sort'),
        backgroundColor: const Color(0xFFf44236),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: arrayC,
                decoration: InputDecoration(
                  hintText: "Array Data",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9,]')),
                ],
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  beforeC.text = arrayC.text;
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFf44236),
                ),
                child: const Text(
                  "Submit",
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: beforeC,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "Data before sort",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                maxLines: 5,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  for (String i in arrayC.text.split(",")) {
                    numbers.add(int.parse(i));
                  }
                  countingSort(numbers);
                  afterC.text = numbers
                      .toString()
                      .replaceAll("]", "")
                      .replaceAll("[", "");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFf44236),
                ),
                child: const Text(
                  "Sort",
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: afterC,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "Data after sort",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                maxLines: 5,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  _clearInput();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFf44236),
                ),
                child: const Text(
                  "Reset",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _clearInput() {
    arrayC.clear();
    afterC.clear();
    beforeC.clear();
    numbers = [];
  }
}
