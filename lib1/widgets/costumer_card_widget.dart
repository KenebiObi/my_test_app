import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../lib1/sources/customer_model.dart';
import '../screens/customer_records_screen.dart';

class CustomerCard extends StatelessWidget {
  CustomerCard({super.key, required this.customer});
  final CustomerModel customer;

  @override
  Widget build(BuildContext context) {
    // final deviceWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          // width: deviceWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.only(left: 15.0, top: 15.0, bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.indigo[100],
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Text(
                          // To select all the initials of the main customer name and display it
                          (customer.customerName.length > 4)
                              ? (customer.customerName[0] == "S" ||
                                      customer.customerName[1] == "i" ||
                                      customer.customerName[2] == "s")
                                  ? customer.customerName[4]
                                  : customer.customerName[0]
                              : customer.customerName[0],
                          style: const TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    Flexible(
                      // Use Flexible widget to prevent overflow
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            customer.customerName,
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 20.0,
                            ),
                          ),
                          // const SizedBox(height: 5.0),
                          Text(
                            customer.description,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CustomerRecordsScreen(customer: customer),
                    ),
                  );
                },
                icon: Icon(
                  CupertinoIcons.right_chevron,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
