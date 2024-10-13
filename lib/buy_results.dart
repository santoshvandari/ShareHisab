import 'package:flutter/material.dart';
import 'package:sharehisab/buy_global_variables.dart';

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
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
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
                buildResultRow(
                    "Total Buy Amount", buyTotalvalue.toStringAsFixed(2)),
                buildResultRow("Dp Charge", "25"),
                buildResultRow("Sebon Fee", buySebonFee.toStringAsFixed(2)),
                buildResultRow("Broker Commission",
                    buyBrokerCommission.toStringAsFixed(2)),
                const Divider(),
                buildResultRow(
                    "Total Payable Amount", buyTotalPayable.toStringAsFixed(2),
                    isTotal: true),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildResultRow(String label, String value, {isTotal = false}) {
    return Row(
      children: isTotal
          ? [
              Text(
                "$label : $value",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[700]),
              ),
            ]
          : [
              Text(
                "$label : ",
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[700]),
              ),
            ],
    );
  }
}
