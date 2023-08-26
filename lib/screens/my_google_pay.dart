import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class MyGooglePay extends StatefulWidget {
  final total;
  const MyGooglePay({super.key, required this.total});

  @override
  State<MyGooglePay> createState() => _MyGooglePayState();
}

class _MyGooglePayState extends State<MyGooglePay> {
  // var _paymentItems = [
  //   PaymentItem(
  //     label: 'Total',
  //     amount: widget.total,
  //     status: PaymentItemStatus.final_price,
  //   )
  // ];

  void onGooglePayResult(paymentResult) {
    print(paymentResult);
  }

  @override
  Widget build(BuildContext context) {
    return GooglePayButton(
      paymentConfigurationAsset: 'sample_payment_configuration.json',
      paymentItems: [
        PaymentItem(
          label: 'Total',
          amount: widget.total,
          status: PaymentItemStatus.final_price,
        ),
      ],
      type: GooglePayButtonType.pay,
      onPaymentResult: onGooglePayResult,
    );
  }
}
