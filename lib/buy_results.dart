import 'package:flutter/material.dart';

class BuyResults extends StatelessWidget {
  const BuyResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(244, 245, 255, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const Text(
            "Calculated Results",
            style: TextStyle(
              fontSize: 22,
            ),
            // textAlign: TextAlign.center,
          ),
          const Divider(),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text("Total Buy Amount : "),
              buildResultRow("Total Buy Amount", 10000),
              buildResultRow("Dp Charge", 10),
              buildResultRow("Sebon Fee", 10),
              buildResultRow("Broker Commission", 10),
              const Divider(),
              buildResultRow("Total Payable Amount", 10, isTotal: true),
            ],
          )
        ],
      ),
    );
  }

  Widget buildResultRow(String label, double value, {isTotal = false}) {
    return Row(
      children: isTotal
          ? [
              Text(
                "$label : ${value.toStringAsFixed(2)}",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[700]),
              ),
            ]
          : [
              Text(
                "$label : ",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                value.toStringAsFixed(2),
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[700]),
              ),
            ],
    );
  }
}
