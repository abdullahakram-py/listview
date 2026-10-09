import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WheelScreen(),
    );
  }
}

class WheelScreen extends StatefulWidget {
  const WheelScreen({super.key});

  @override
  State<WheelScreen> createState() => _WheelScreenState();
}

class _WheelScreenState extends State<WheelScreen> {
  final List<String> items = List.generate(30, (i) => 'Item ${i + 1}');
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListWheelScrollView')),
      body: Column(
        children: [
          const SizedBox(height: 24),
          Text(
            'Selected: ${items[selectedIndex]}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListWheelScrollView.useDelegate(
              itemExtent: 60,
              diameterRatio: 2.0,
              perspective: 0.004,
              magnification: 1.2,
              useMagnifier: true,
              physics: const FixedExtentScrollPhysics(),
              onSelectedItemChanged: (index) {
                setState(() => selectedIndex = index);
              },
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: items.length,
                builder: (context, index) {
                  final isSelected = index == selectedIndex;
                  return Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.indigo
                          : Colors.indigo.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      items[index],
                      style: TextStyle(
                        fontSize: 18,
                        color: isSelected ? Colors.white : Colors.black87,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}