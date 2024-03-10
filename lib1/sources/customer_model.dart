import "package:flutter/material.dart";

class CustomerModel {
  final String customerName;
  final int roundNeck;
  final int shoulder;
  final int bust_chest;
  final int sleeve;
  final int waist;
  final int hip_thigh;
  final int length;
  String description = "";
  CustomerModel(
      {required this.customerName,
      required this.roundNeck,
      required this.shoulder,
      required this.bust_chest,
      required this.sleeve,
      required this.waist,
      required this.hip_thigh,
      required this.description,
      required this.length});
}
