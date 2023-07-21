import "package:flutter/material.dart";

class CustomerModel {
  final int neck;
  final int shoulder;
  final int bust_chest;
  final int sleeve;
  final int waist;
  final int hip_thigh;
  String description = "";
  CustomerModel({
    required this.neck,
    required this.shoulder,
    required this.bust_chest,
    required this.sleeve,
    required this.waist,
    required this.hip_thigh,
    required this.description,
  });
}
