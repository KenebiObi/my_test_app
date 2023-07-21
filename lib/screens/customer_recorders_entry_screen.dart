import 'package:flutter/material.dart';
import 'package:my_test_app/customer_records.dart';
import 'package:my_test_app/widgets/constant_widgets/screen_title_widget.dart';

class CustomerRecordsEntryScreen extends StatefulWidget {
  CustomerRecordsEntryScreen({super.key});

  @override
  State<CustomerRecordsEntryScreen> createState() =>
      _CustomerRecordsEntryScreenState();
}

class _CustomerRecordsEntryScreenState
    extends State<CustomerRecordsEntryScreen> {
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

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 242, 251),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50.0),
            ScreenTitleWidget(title: "Customer Record"),
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
                      customerRecordInput(sleeveTextController, "Length")
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    children: [
                      customerRecordInput(waistTextController, "Chest"),
                      const SizedBox(width: 15.0),
                      customerRecordInput(hipthighTextController, "Length")
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    children: [
                      customerRecordInput(lengthTextController, "Length")
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Badge(),
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
                    onPressed: () => save(),
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
                  )
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
        // onSubmitted: (value) => {},
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        // onChanged: (value) {
        //   txtFieldChanged;
        // },
      ),
    ),
  );
}
