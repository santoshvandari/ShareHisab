import 'package:flutter/material.dart';
import 'package:sharehisab/global_variables/buy_global_variables.dart';
import 'package:sharehisab/global_variables/sell_gloabl_variables.dart';
import 'package:sharehisab/buy_sell_calculation/sellbuy_calculation.dart';

class SellOptions extends StatefulWidget {
  final VoidCallback onCalculate;

  const SellOptions({super.key, required this.onCalculate});

  @override
  State<SellOptions> createState() => _SellOptionsState();
}

class _SellOptionsState extends State<SellOptions> {
  // Controllers for the text fields
  final TextEditingController sellingPriceController = TextEditingController();
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
                  "Sell Calculation",
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

              textFormFieldDesign("Selling Price", sellingPriceController),
              textFormFieldDesign("Buying Price", buyingPriceController),
              textFormFieldDesign("Quantity", quantityController),

              // Capital Gain Tax dropdown
              const SizedBox(height: 10),
              Text(
                "Capital Gain Tax *",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[700],
                ),
              ),
              const Text(
                "If your holding is more than 365, tax is 5% otherwise 7.5%",
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                dropdownColor: Colors.white,
                value: capitalGainTaxPercentage == 5.0 ? "5" : "7.5",
                items: const [
                  DropdownMenuItem(value: "5", child: Text("5%")),
                  DropdownMenuItem(value: "7.5", child: Text("7.5%")),
                ],
                onChanged: (value) {
                  setState(() {
                    capitalGainTaxPercentage = double.parse(value!);
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_validateInputs()) {
                      setState(() {
                        sellCalculation(); // Perform sell calculation
                        isBuyCalculation = false;
                        isSellCalculation = true;
                        widget.onCalculate(); // Notify parent widget

                        // Clear the text fields after calculation
                        sellingPriceController.clear();
                        buyingPriceController.clear();
                        quantityController.clear();
                      });
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
    if (sellingPriceController.text.isEmpty ||
        buyingPriceController.text.isEmpty ||
        quantityController.text.isEmpty) {
      setState(() {
        errorMessage = "All fields are required."; // Set error message
      });
      return false; // Return false for invalid inputs
    }

    // Parse values and set global variables
    try {
      sellPrice = double.parse(sellingPriceController.text);
      sellBuyPrice = double.parse(buyingPriceController.text);
      sellQuantity = double.parse(quantityController.text);
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
