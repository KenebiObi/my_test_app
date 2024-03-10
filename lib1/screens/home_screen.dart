import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import '../../lib1/screens/customer_recorders_entry_screen.dart';
import '../../lib1/sources/customer_model.dart';
import '../../lib1/widgets/customer_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // void alertDialog() {q
  //   showDialog(
  //     context: context,
  //     builder: ((context) {
  //       return AlertDialogWidget();`
  //     }),
  //   );
  // }

  final List<CustomerModel> _registeredCustomerRecords = [
    CustomerModel(
      customerName: "Sis Aka",
      roundNeck: 20,
      shoulder: 18,
      bust_chest: 42,
      sleeve: 14,
      waist: 32,
      hip_thigh: 35,
      length: 40,
      description: "wgvyxkquwyfduakxgdvjqsfwxavdsvuaxytduvgu",
    )
  ];

  void _addCustomerRecord(CustomerModel customerRecord) {
    setState(() {
      _registeredCustomerRecords.add(customerRecord);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).primaryColor,
        duration: const Duration(seconds: 4),
        content: const Text("New item added"),
        dismissDirection: DismissDirection.horizontal,
      ),
    );
  }

  void _deleteCustomerRecord(CustomerModel customerRecord) {
    final expenseIndex = _registeredCustomerRecords.indexOf(customerRecord);
    setState(() {
      _registeredCustomerRecords.remove(customerRecord);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        content: const Text(
          "Expenses deleted",
        ),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(
              () {
                _registeredCustomerRecords.insert(expenseIndex, customerRecord);
              },
            );
          },
        ),
        dismissDirection: DismissDirection.horizontal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    // final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 242, 251),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 50.0),
          child: Column(
            children: [
              SizedBox(
                width: deviceWidth - 40.0,
                child: Row(
                  children: [
                    const Text(
                      "Naomi Ezeugo",
                      style: TextStyle(
                        fontSize: 27.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.indigo[100],
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: const Image(
                        width: 50.0,
                        height: 50.0,
                        image: AssetImage("assets/images/profile_pic.jpg"),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50.0),
              CustomerList(
                customerRecords: _registeredCustomerRecords,
                onDeleteCustomerRecord: _deleteCustomerRecord,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomerRecordsEntryScreen(
              onAddCustomerRecord: _addCustomerRecord,
            ),
          ),
        ),
        backgroundColor: Colors.indigo[100],
        child: const Icon(CupertinoIcons.add),
      ),
    );
  }
}
