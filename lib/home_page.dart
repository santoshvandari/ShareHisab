import 'package:flutter/material.dart';
import 'package:sharehisab/buy_options.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  child: DropdownButtonFormField<String>(
                    dropdownColor: Colors.white,
                    value: "Buy Calculation",
                    items: const [
                      DropdownMenuItem(
                        value: "Buy Calculation",
                        child: Text("Buy Calculation"),
                      ),
                      DropdownMenuItem(
                        value: "Sell Calculation",
                        child: Text("Sell Calculation"),
                      ),
                    ],
                    onChanged: (value) {},
                  ),
                ),
                const BuyOptions(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
