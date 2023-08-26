import 'package:flutter/material.dart';
import 'package:upi_india/upi_india.dart';

class UpiPayment extends StatefulWidget {
  const UpiPayment({super.key});

  @override
  State<UpiPayment> createState() => _UpiPaymentState();
}

class _UpiPaymentState extends State<UpiPayment> {
  Future<UpiResponse>? _transaction;
  final UpiIndia _upiIndia = UpiIndia();
  List<UpiApp>? apps;

  @override
  void initState() {
    _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
      setState(() {
        apps = value;
      });
    }).catchError((e) {
      print(e);
      apps = [];
    });
    super.initState();
  }

  Future<UpiResponse> initiateTransaction(UpiApp app) async {
    return _upiIndia.startTransaction(
      app: app,
      receiverUpiId: "",
      receiverName: "Gagandeep Kaur",
      transactionRefId: 'Testing Upi India Plugin',
      transactionNote: 'Upi Payment',
      amount: 1,
    );
  }

  Widget displayUpiApps() {
    if (apps == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (apps!.isEmpty) {
      return const Center(
        child: Text("No apps found to handle transaction"),
      );
    } else {
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Wrap(
            children: apps!.map<Widget>((UpiApp app) {
              return GestureDetector(
                onTap: () {
                  _transaction = initiateTransaction(app);
                  setState(() {});
                },
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.memory(
                        app.icon,
                        height: 60,
                        width: 60,
                      ),
                      Text(app.name),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
    }
  }

  Widget displayTransaction(title, body) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title"),
          Flexible(child: Text(body)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: displayUpiApps(),
          ),
          Expanded(
            child: FutureBuilder(
                future: _transaction,
                builder: (BuildContext context,
                    AsyncSnapshot<UpiResponse> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('Something went wrong'),
                        // child: Text(_upiErrorHandler(snapshot.error.runtimeType),
                      );
                    }
                    UpiResponse _upiResponse = snapshot.data!;

                    String txnId = _upiResponse.transactionId ?? 'N/A';
                    String resCode = _upiResponse.responseCode ?? 'N/A';
                    String txnRef = _upiResponse.transactionRefId ?? 'N/A';
                    String status = _upiResponse.status ?? 'N/A';
                    String approvalRef = _upiResponse.approvalRefNo ?? 'N/A';

                    // _checkTxnStaus(status);

                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          displayTransaction('Transaction Id', txnId),
                          displayTransaction('Response Code ', resCode),
                          displayTransaction('Reference Id', txnRef),
                          displayTransaction('Status', status.toUpperCase()),
                          displayTransaction('Approval No', approvalRef),
                        ],
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text(""),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
