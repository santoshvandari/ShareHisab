import 'package:flutter/material.dart';

class SellOptions extends StatelessWidget {
  const SellOptions({super.key});

  @override
  Widget build(BuildContext context) {
    double temp = 0.0;
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
                ),
              ),
              textFormFieldDesign("Selling Price", temp),
              textFormFieldDesign("Buying Price", temp),
              textFormFieldDesign("Quantity", temp),
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
                value: "7.5",
                items: const [
                  DropdownMenuItem(
                    child: Text("5%"),
                    value: "5",
                  ),
                  DropdownMenuItem(
                    child: Text("7.5%"),
                    value: "7.5",
                  ),
                ],
                onChanged: (value) {
                  debugPrint(value);
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
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
