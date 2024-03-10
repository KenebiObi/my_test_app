import 'package:flutter/material.dart';
import '../../lib1/sources/customer_model.dart';
import '../../lib1/widgets/constant_widgets/screen_title_widget.dart';
// import '../widgets/customer÷_records.dart';

class CustomerRecordsScreen extends StatelessWidget {
  CustomerRecordsScreen({
    super.key,
    required this.customer,
  });
  final CustomerModel customer;
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    // final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 242, 251),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15.0, top: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScreenTitleWidget(
                title: customer.customerName,
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                  bottom: 15.0,
                ),
                child: Column(
                  children: [
                    Container(
                      width: deviceWidth,
                      height: null,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 15.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Shoulder: ${customer.shoulder}",
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          Text(
                            "Round Neck: ${customer.roundNeck}",
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          Text(
                            "Chest: ${customer.bust_chest}",
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          Text(
                            "Top Length: ${customer.length}",
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          Text(
                            customer.shoulder.toString(),
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          Text(
                            customer.shoulder.toString(),
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          Text(
                            customer.shoulder.toString(),
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          Text(
                            customer.shoulder.toString(),
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 15.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
