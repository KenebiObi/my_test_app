import "package:flutter/material.dart";
import "../widgets/title_bar_widget.dart";
import '../widgets/costumer_card_widget.dart';
import '../widgets/customer_records.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const SizedBox(height: 50.0),
              const TitleBar(),
              const SizedBox(height: 50.0),
              SizedBox(
                height: deviceHeight - 150.0,
                child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: ((context, index) => CustomerCard(
                        description: ((customer_records as List)[index]
                            ["customer_details"]["descriptionÍ"]) as String,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
