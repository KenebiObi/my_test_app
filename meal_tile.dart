// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// // Edit values such as height and width as you please, just be careful

// class MealTileWidget extends StatelessWidget {
//   const MealTileWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Adjust this to any way you can use to get user rating
//     int customerRating = 5;
//     return Column(
//       children: [
//         Row(
//           children: [
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                 child: Container(
//                   width: double.infinity,
//                   height: 80.0,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     borderRadius: BorderRadius.circular(15.0),
//                   ),
//                   // Row containing the image and texts in the food tile
//                   child: Row(
//                     children: [
//                       // Background food image
//                       Container(
//                         height: double.infinity,
//                         width: 95.0,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15.0),
//                           image: const DecorationImage(
//                             fit: BoxFit.fill,
//                             image: AssetImage(
//                               "assets/images/ham.jpeg",
//                             ),
//                           ),
//                         ),
//                         // Container with the star ratings
//                         child: Column(
//                           children: [
//                             const Spacer(),
//                             Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.grey[800]!.withOpacity(0.3),
//                                 borderRadius: const BorderRadius.only(
//                                   bottomLeft: Radius.circular(15.0),
//                                   bottomRight: Radius.circular(15.0),
//                                 ),
//                               ),
//                               // However you want to output the stars
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   for (var i = 0; i < customerRating; i++)
//                                     Icon(
//                                       CupertinoIcons.star_fill,
//                                       size: 17.0,
//                                       color: Colors.amber.withOpacity(0.8),
//                                     ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       // const SizedBox(width: 12.0),
//                       Padding(
//                         padding: const EdgeInsets.only(
//                           top: 10.0,
//                           bottom: 10.0,
//                           left: 15.0,
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                               width: 275.0,
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   const Text("Burger King"),
//                                   // Spacer(),
//                                   GestureDetector(
//                                     onTap: () {},
//                                     child: Container(
//                                       // height: 50.0,
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 25.0,
//                                         vertical: 2.0,
//                                       ),
//                                       decoration: BoxDecoration(
//                                         color: Colors.green[200],
//                                         borderRadius:
//                                             BorderRadius.circular(20.0),
//                                       ),
//                                       child: const Text(
//                                         "Open",
//                                         style: TextStyle(
//                                           color: Theme.of(context).colorScheme.background,
//                                           fontSize: 15.0,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(width: 15.0),
//                             const Text("Delivery Time: 6:00 am - 9:00 pm"),
//                             const SizedBox(width: 15.0),
//                             const Text(
//                               "333 O'Farrell St, San Francisco, CA 94102, United States",
//                               style: TextStyle(fontSize: 10.3),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//         const SizedBox(height: 15.0),
//       ],
//     );
//   }
// }
