import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_test_app/widgets/constant_widgets/screen_title_widget.dart';
// import '../widgets/customer_records.dart';

class CustomerRecordsScreen extends StatelessWidget {
  CustomerRecordsScreen({
    super.key,
    required this.customer,
    required this.index,
  });
  final Map<String, Object> customer;
  int index;
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
                title: customer["customer_name"] as String,
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
                            "Shoulder: ${(customer["customer_details"] as Map)["shoulder"].toString()}",
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          Text(
                            "Round Neck: ${(customer["customer_details"] as Map)["neck"].toString()}",
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          Text(
                            "Chest: ${(customer["customer_details"] as Map)["bust/chest"].toString()}",
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          Text(
                            "Top Length: ${(customer["customer_details"] as Map)["full_length"].toString()}",
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          Text(
                            (customer["customer_details"] as Map)["description"]
                                .toString(),
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          Text(
                            (customer["customer_details"] as Map)["description"]
                                .toString(),
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          Text(
                            (customer["customer_details"] as Map)["description"]
                                .toString(),
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          Text(
                            (customer["customer_details"] as Map)["description"]
                                .toString(),
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
