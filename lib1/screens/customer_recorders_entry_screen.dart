import 'package:flutter/material.dart';
import '../../lib1/sources/customer_model.dart';
import '../../lib1/widgets/constant_widgets/screen_title_widget.dart';

class CustomerRecordsEntryScreen extends StatefulWidget {
  const CustomerRecordsEntryScreen({
    required this.onAddCustomerRecord,
    super.key,
  });
  final void Function(CustomerModel customer) onAddCustomerRecord;

  @override
  State<CustomerRecordsEntryScreen> createState() =>
      _CustomerRecordsEntryScreenState();
}

class _CustomerRecordsEntryScreenState
    extends State<CustomerRecordsEntryScreen> {
  final TextEditingController customerNameCtontroller = TextEditingController();

  final TextEditingController shoulderTextController = TextEditingController();

  final TextEditingController neckTextController = TextEditingController();

  final TextEditingController chestTextController = TextEditingController();

  final TextEditingController sleeveTextController = TextEditingController();

  final TextEditingController waistTextController = TextEditingController();

  final TextEditingController hipthighTextController = TextEditingController();

  final TextEditingController lengthTextController = TextEditingController();

  final TextEditingController descriptionTextController =
      TextEditingController();

  save() {
    setState(() {
      print("saved");
    });
  }

  void submitCustomerRecords() {
    setState(
      () {
        widget.onAddCustomerRecord(
          CustomerModel(
            roundNeck: int.parse(neckTextController.text),
            shoulder: int.parse(shoulderTextController.text),
            bust_chest: int.parse(chestTextController.text),
            sleeve: int.parse(sleeveTextController.text),
            waist: int.parse(waistTextController.text),
            hip_thigh: int.parse(hipthighTextController.text),
            length: int.parse(lengthTextController.text),
            description: descriptionTextController.text,
            customerName: customerNameCtontroller.text,
          ),
        );
        print(customerNameCtontroller.text.runtimeType);
        Navigator.pop(context);
      },
    );
  }

  void showFillInEmptyDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        // backgroundColor: Colors.red.withOpacity(0.9),,
        title: const Text("Invalid Input"),
        content: const Text(
          "Please fill in the blank spaces ",
          style: TextStyle(fontSize: 15.0),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Ok"),
          )
        ],
      ),
    );
  }

  void showWarningDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Invalid Input"),
        content: const Text(
          "Please fill in the blank spaces appropriatly",
          style: TextStyle(fontSize: 15.0),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Ok"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 242, 251),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50.0),
            const ScreenTitleWidget(title: "Customer Record"),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                bottom: 15.0,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      customerRecordInput(neckTextController, "Neck"),
                      const SizedBox(width: 15.0),
                      customerRecordInput(shoulderTextController, "Shoulder"),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    children: [
                      customerRecordInput(chestTextController, "Chest"),
                      const SizedBox(width: 15.0),
                      customerRecordInput(sleeveTextController, "Sleeve")
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    children: [
                      customerRecordInput(waistTextController, "Waist"),
                      const SizedBox(width: 15.0),
                      customerRecordInput(hipthighTextController, "Hip/Thigh")
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    children: [
                      customerRecordInput(lengthTextController, "Length")
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      autocorrect: true,
                      controller: customerNameCtontroller,
                      decoration: const InputDecoration(
                        labelText: "Name",
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      autocorrect: true,
                      maxLines: 5,
                      controller: descriptionTextController,
                      decoration: const InputDecoration(
                        labelText: "Description",
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  TextButton(
                    onPressed: () {
                      if (customerNameCtontroller.text.isEmpty ||
                          shoulderTextController.text.isEmpty ||
                          neckTextController.text.isEmpty ||
                          chestTextController.text.isEmpty ||
                          sleeveTextController.text.isEmpty ||
                          waistTextController.text.isEmpty ||
                          hipthighTextController.text.isEmpty ||
                          lengthTextController.text.isEmpty ||
                          descriptionTextController.text.isEmpty) {
                        showFillInEmptyDialog();
                        // } else {
                        //   if (shoulderTextController.text.runtimeType != int ||
                        //       neckTextController.text.runtimeType != int ||
                        //       chestTextController.text.runtimeType != int ||
                        //       sleeveTextController.text.runtimeType != int ||
                        //       waistTextController.text.runtimeType != int ||
                        //       hipthighTextController.text.runtimeType != int ||
                        //       lengthTextController.text.runtimeType != int ||
                        //       customerNameCtontroller.text.runtimeType !=
                        //           String ||
                        //       descriptionTextController.text.runtimeType !=
                        //           String) {
                        //     showWarningDialog();
                        //   } else {
                        // submitCustomerRecords();
                        // }
                      } else {
                        submitCustomerRecords();
                      }
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.indigo[100],
                        minimumSize: Size(deviceWidth, 50.0)),
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget customerRecordInput(TextEditingController controller, String labelText) {
  return Flexible(
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
      ),
    ),
  );

  ///new note
}
