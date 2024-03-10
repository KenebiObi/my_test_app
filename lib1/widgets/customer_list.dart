import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../lib1/sources/customer_model.dart';
import '../../lib1/widgets/costumer_card_widget.dart';

class CustomerList extends StatelessWidget {
  const CustomerList({
    super.key,
    required this.customerRecords,
    required this.onDeleteCustomerRecord,
  });
  final List<CustomerModel> customerRecords;
  final void Function(CustomerModel customerRecord) onDeleteCustomerRecord;

  // void confirmationDialog(context, int index) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       // shape: RoundedRectangleBorder(
  //       //   borderRadius: BorderRadius.circular(10.0),
  //       // ),

  //       title: Text(
  //         "Are you sure you want to delete this item?",
  //         textAlign: TextAlign.center,
  //         style: TextStyle(color: Colors.grey.shade800),
  //       ),
  //       actions: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Expanded(
  //               child: ElevatedButton(
  //                 style: ElevatedButton.styleFrom(
  //                   minimumSize: const Size(double.infinity, 50.0),
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(10.0),
  //                   ),
  //                 ),
  //                 onPressed: () {
  //                   onDeleteCustomerRecord(customerRecords[index]);
  //                   Navigator.pop(context);
  //                 },
  //                 child: const Text(
  //                   "Ok",
  //                   style: TextStyle(color: Colors.red),
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(width: 20.0),
  //             Expanded(
  //               child: ElevatedButton(
  //                 style: ElevatedButton.styleFrom(
  //                   minimumSize: const Size(double.infinity, 50.0),
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(10.0),
  //                   ),
  //                 ),
  //                 onPressed: () => Navigator.pop(context),
  //                 child: Text(
  //                   "Cancel",
  //                   style: TextStyle(color: Colors.grey.shade700),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: deviceHeight,
      child: ListView.builder(
        itemBuilder: ((context, index) => Column(
              children: [
                Dismissible(
                  background: Container(
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.error.withOpacity(
                            0.9,
                          ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  key: ValueKey(customerRecords[index]),
                  onDismissed: (direction) => onDeleteCustomerRecord(
                    customerRecords[index],
                  ),
                  child: CustomerCard(
                    customer: customerRecords[index],
                  ),
                ),
                // GestureDetector(
                //   // onLongPress: () => confirmationDialog(context, index),
                //   child: CustomerCard(
                //     customer: customerRecords[index],
                //   ),
                // ),
                const SizedBox(height: 15.0)
              ],
            )),
        itemCount: customerRecords.length,
      ),
    );
  }
}
