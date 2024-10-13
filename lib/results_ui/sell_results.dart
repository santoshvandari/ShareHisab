import 'package:flutter/material.dart';
import 'package:sharehisab/global_variables/sell_gloabl_variables.dart';

class SellResults extends StatelessWidget {
  const SellResults({super.key});

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
            ),
            const Divider(),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text("Total Buy Amount : "),
                buildResultRow(
                    "Total Sell Amount", sellTotalvalue.toStringAsFixed(2)),
                buildResultRow("Dp Charge", "25"),
                buildResultRow("Sebon Fee", sellSebonFee.toStringAsFixed(2)),
                buildResultRow("Broker Commission",
                    sellBrokerCommission.toStringAsFixed(2)),
                buildResultRow(
                    "Capital Gain Tax", sellCapitalGainTax.toStringAsFixed(2)),
                buildResultRow("Profit/Loss", profitOrLoss.toStringAsFixed(2)),
                buildResultRow("Return on Investment",
                    "${returnOnInvestment.toStringAsFixed(2)}%"),
                const Divider(),
                buildResultRow("Total Receivable Amount",
                    sellTotalReceivable.toStringAsFixed(2),
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
