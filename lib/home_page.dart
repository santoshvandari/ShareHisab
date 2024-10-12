import 'package:flutter/material.dart';
import 'package:sharehisab/buy_options.dart';
import 'package:sharehisab/buy_results.dart';
import 'package:sharehisab/sell_options.dart';
import 'package:sharehisab/sell_results.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSell = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Share Hisab",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Text(
                  "CALCULATION",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                // Dropdown Button with white background and border
                DropdownButtonFormField<String>(
                  dropdownColor: Colors.white,
                  value: "Buy",
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white), // White border
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.white), // White border when focused
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: "Buy",
                      child: Text("Buy Calculation",
                          style: TextStyle(
                              color: Colors.black)), // Text color in dropdown
                    ),
                    DropdownMenuItem(
                      value: "Sell",
                      child: Text("Sell Calculation",
                          style: TextStyle(
                              color: Colors.black)), // Text color in dropdown
                    ),
                  ],
                  onChanged: (value) {
                    debugPrint(value);
                    setState(() {
                      value == "Buy" ? isSell = false : isSell = true;
                    });
                  },
                ),
                const SizedBox(height: 20),
                isSell ? const SellOptions() : const BuyOptions(),
                const SizedBox(height: 30),
                // const BuyResults(),
                // const SellResults(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
