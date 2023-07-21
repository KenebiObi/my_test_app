import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:my_test_app/screens/customer_recorders_entry_screen.dart';
import 'package:my_test_app/widgets/alert_dialog_widget.dart';
import '../widgets/costumer_card_widget.dart';
import '../customer_records.dart';

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

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
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
              SizedBox(
                height: deviceHeight - 150.0,
                child: ListView.builder(
                  itemCount: customer_records.length,
                  itemBuilder: ((context, index) => CustomerCard(
                        customer_record: customer_records[
                            index], // to shorten the method for calling objects from the map
                        index: index,
                        customer_name:
                            customer_records[index]["customer_name"] as String,
                        customer_description: (
                            // "Peplun top and skirt with ankara material"
                            (customer_records[index]["customer_details"]
                                as Map)["description"] as String),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomerRecordsEntryScreen(),
          ),
        ),
        backgroundColor: Colors.indigo[100],
        child: const Icon(CupertinoIcons.add),
      ),
    );
  }
}
