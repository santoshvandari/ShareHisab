import 'package:sharehisab/global_variables/buy_global_variables.dart';
import 'package:sharehisab/global_variables/sell_gloabl_variables.dart';

const double sebonFeePercentage = 0.015;
double calculateBrokerCommission(double amount) {
  double commission = 10;
  if (amount <= 50000) {
    commission =
        ((0.4 * amount) / 100) < 10 ? commission : ((0.4 * amount) / 100);
  } else if (amount > 50000 && amount <= 500000) {
    commission = (0.33 * amount) / 100;
  } else if (amount > 500000 && amount <= 2000000) {
    commission = (0.31 * amount) / 100;
  } else if (amount > 2000000 && amount <= 10000000) {
    commission = (0.27 * amount) / 100;
  } else if (amount > 10000000) {
    commission = (0.24 * amount) / 100;
  }
  return commission;
}

double calculateSebonFee(double amount) {
  return (amount * sebonFeePercentage) / 100;
}

double calculateTotalAmount(price, quantity) {
  double totalValue = price * quantity;
  double sebonFee = calculateSebonFee(totalValue);
  double brokerCommission = calculateBrokerCommission(totalValue);
  double dpCharge = 25;

  return (totalValue + brokerCommission + dpCharge + sebonFee);
}

void buyCalculation() {
  buyTotalvalue = buyPrice * buyQuantity;
  buySebonFee = calculateSebonFee(buyTotalvalue);
  buyBrokerCommission = calculateBrokerCommission(buyTotalvalue);
  buyTotalPayable = calculateTotalAmount(buyPrice, buyQuantity);
}

void sellCalculation() {
  sellTotalvalue = sellPrice * sellQuantity;
  double totalSellBuyPrice = calculateTotalAmount(sellBuyPrice, sellQuantity);
  sellSebonFee = calculateSebonFee(sellTotalvalue);
  sellBrokerCommission = calculateBrokerCommission(sellTotalvalue);
  double tempSellTotalReceivable =
      sellTotalvalue - 25 - sellSebonFee - sellBrokerCommission;
  double tempProfitOrLosss = tempSellTotalReceivable - totalSellBuyPrice;
  sellCapitalGainTax = tempProfitOrLosss > 0
      ? tempProfitOrLosss * capitalGainTaxPercentage / 100
      : 0;
  profitOrLoss = tempProfitOrLosss - sellCapitalGainTax;
  returnOnInvestment = (profitOrLoss / totalSellBuyPrice) * 100;
  sellTotalReceivable = tempSellTotalReceivable - sellCapitalGainTax;
}
