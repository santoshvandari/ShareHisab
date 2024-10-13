import 'package:flutter/material.dart';
import 'package:sharehisab/global_variables/buy_global_variables.dart';
import 'package:sharehisab/options_ui/buy_options.dart';
import 'package:sharehisab/results_ui/buy_results.dart';
import 'package:sharehisab/global_variables/sell_gloabl_variables.dart';
import 'package:sharehisab/global_variables/sell_options.dart';
import 'package:sharehisab/results_ui/sell_results.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSell = true; // Track if it's a Sell or Buy calculation
  final ScrollController _scrollController =
      ScrollController(); // ScrollController to control scrolling

  // Whenever the button is pressed and results are calculated, we use setState
  void _onCalculate() {
    setState(() {
      // Trigger a rebuild of the UI to show results
    });

    // Scroll to results section
    Future.delayed(const Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent, // Scroll to the bottom
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

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
          controller: _scrollController, // Attach the ScrollController
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
                DropdownButtonFormField<String>(
                  dropdownColor: Colors.white,
                  value: isSell ? "Sell" : "Buy", // Display current selection
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: "Buy",
                      child: Text(
                        "Buy Calculation",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "Sell",
                      child: Text(
                        "Sell Calculation",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      isSell = value == "Sell";
                      isBuyCalculation = false;
                      isSellCalculation = false;
                    });
                  },
                ),
                const SizedBox(height: 20),
                isSell
                    ? SellOptions(onCalculate: _onCalculate)
                    : BuyOptions(onCalculate: _onCalculate),
                const SizedBox(height: 30),
                ((isSell && isSellCalculation)
                    ? const SellResults() // Display Sell Results
                    : isBuyCalculation
                        ? const BuyResults() // Display Buy Results if calculated
                        : const SizedBox()), // Empty if no calculation yet
              ],
            ),
          ),
        ),
      ),
    );
  }
}
