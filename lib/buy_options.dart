import 'package:flutter/material.dart';
import 'package:sharehisab/buy_global_variables.dart';
import 'package:sharehisab/sellbuy_calculation.dart';

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

              textFormFieldDesign("Buying Price", buyingPriceController),
              textFormFieldDesign("Quantity", quantityController),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Validate input fields
                    if (_validateInputs()) {
                      // Perform calculations if inputs are valid
                      buyCalculation(); // Call your calculation function
                      debugPrint("Buy Calculation");
                      isBuyCalculation = true;
                      widget.onCalculate(); // Notify the parent widget
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
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
