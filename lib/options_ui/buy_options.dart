import 'package:flutter/material.dart';
import 'package:sharehisab/global_variables/buy_global_variables.dart';
import 'package:sharehisab/global_variables/sell_gloabl_variables.dart';
import 'package:sharehisab/buy_sell_calculation/sellbuy_calculation.dart';

class BuyOptions extends StatefulWidget {
  final VoidCallback onCalculate;
  const BuyOptions({super.key, required this.onCalculate});

  @override
  State<BuyOptions> createState() => _BuyOptionsState();
}

class _BuyOptionsState extends State<BuyOptions> {
  // Controllers for the text fields
  final TextEditingController buyingPriceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  // Error message
  String? errorMessage;

  @override
  void dispose() {
    // Dispose controllers when the widget is removed from the tree
    buyingPriceController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Buy Calculation",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),

              // Display the error message if it exists
              if (errorMessage != null) ...[
                Text(
                  errorMessage!,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
                const SizedBox(height: 10),
              ],

              // Fields for buying price and quantity
              textFormFieldDesign("Buying Price", buyingPriceController),
              textFormFieldDesign("Quantity", quantityController),

              const SizedBox(height: 20),

              // Calculate button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_validateInputs()) {
                      // Perform calculations if inputs are valid
                      buyCalculation(); // Call your calculation function
                      isBuyCalculation = true;
                      isSellCalculation = false;
                      widget.onCalculate(); // Notify the parent widget
                      _resetFields(); // Reset fields after calculation
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 10,
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    "Calculate",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Method to reset the fields after the calculation is done
  void _resetFields() {
    setState(() {
      buyingPriceController.clear();
      quantityController.clear();
    });
  }

  // Method to validate inputs
  bool _validateInputs() {
    setState(() {
      errorMessage = null; // Reset error message
    });

    // Check if fields are empty
    if (buyingPriceController.text.isEmpty || quantityController.text.isEmpty) {
      setState(() {
        errorMessage = "All fields are required."; // Set error message
      });
      return false; // Return false for invalid inputs
    }

    // Parse values and set global variables
    try {
      buyPrice = double.parse(buyingPriceController.text);
      buyQuantity = double.parse(quantityController.text);
    } catch (e) {
      setState(() {
        errorMessage = "Please enter valid numbers."; // Handle parsing error
      });
      return false; // Return false for invalid numbers
    }

    return true; // Return true for valid inputs
  }

  // Updated textFormFieldDesign to accept controllers
  Widget textFormFieldDesign(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label *",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.teal[700],
          ),
        ),
        TextFormField(
          controller: controller, // Assign the controller
          decoration: InputDecoration(
            hintText: "Enter $label",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
