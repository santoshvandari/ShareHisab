import 'package:flutter/material.dart';
import 'package:sharehisab/sell_gloabl_variables.dart';
import 'package:sharehisab/sellbuy_calculation.dart';

class SellOptions extends StatefulWidget {
  final VoidCallback onCalculate;

  const SellOptions({super.key, required this.onCalculate});

  @override
  State<SellOptions> createState() => _SellOptionsState();
}

class _SellOptionsState extends State<SellOptions> {
  final _formKey = GlobalKey<FormState>();
  String errorMessage = "";

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
          child: Form(
            key: _formKey, // Associate form key with this form
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      errorMessage,
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                const Center(
                  child: Text(
                    "Sell Calculation",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                textFormFieldDesign(
                  "Selling Price",
                  (value) {
                    setState(() {
                      sellPrice = double.tryParse(value) ?? 0.0;
                    });
                  },
                  "Selling Price is required",
                ),
                textFormFieldDesign(
                  "Buying Price",
                  (value) {
                    setState(() {
                      sellBuyPrice = double.tryParse(value) ?? 0.0;
                    });
                  },
                  "Buying Price is required",
                ),
                textFormFieldDesign(
                  "Quantity",
                  (value) {
                    setState(() {
                      sellQuantity = double.tryParse(value) ?? 0.0;
                    });
                  },
                  "Quantity is required",
                ),
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
                    DropdownMenuItem(
                      value: "5",
                      child: Text("5%"),
                    ),
                    DropdownMenuItem(
                      value: "7.5",
                      child: Text("7.5%"),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      capitalGainTaxPercentage =
                          double.tryParse(value ?? "7.5") ?? 7.5;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Capital Gain Tax is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Form validation passed, reset error message
                        setState(() {
                          errorMessage = "";
                        });

                        sellCalculation();
                        isSellCalculation = true;
                        widget.onCalculate(); // Call the onCalculate callback
                      } else {
                        // Validation failed, set error message
                        setState(() {
                          errorMessage = "All fields are required.";
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
        ),
      ],
    );
  }

  Widget textFormFieldDesign(
      String label, Function(String) onChanged, String validationMessage) {
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
          decoration: InputDecoration(
            hintText: "Enter $label",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          keyboardType: TextInputType.number,
          onChanged: onChanged,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return validationMessage;
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
