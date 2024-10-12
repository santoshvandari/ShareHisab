import 'package:flutter/material.dart';

class BuyOptions extends StatelessWidget {
  const BuyOptions({super.key});

  @override
  Widget build(BuildContext context) {
    double dataStorage = 0;
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
              textFormFieldDesign("Buying Price", dataStorage),
              textFormFieldDesign("Quantity", dataStorage),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
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

  Widget textFormFieldDesign(String label, double dataStorage) {
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
          ),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            debugPrint(value);
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
