// import 'package:flutter/material.dart';

// class SavedPlacesTile extends StatefulWidget {
//   const SavedPlacesTile({super.key});

//   @override
//   State<SavedPlacesTile> createState() => _SavedPlacesTileState();
// }

// class _SavedPlacesTileState extends State<SavedPlacesTile> {
//   @override
//   Widget build(BuildContext context) {
//     return return ListTile(
//       leading: CircleAvatar(
//         child: CachedNetworkImage(
//             imageBuilder: ((context, imageProvider) {
//               return CircleAvatar(
//                 backgroundImage: imageProvider,
//                 radius: 25.0,
//               );
//             }),
//             imageUrl: user.profilePic,
//             placeholder: (context, url) {
//               return Container(
//                 decoration: BoxDecoration(
//                   color: Colors.grey,
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//               );
//             }),
//         radius: 25.0,
//       ),
//       title: Text(
//        "Nnamdi Azikiwe Mausoleum",
//       ),
//       subtitle: Text(
//         user.location,
//         style: TextStyle(fontSize: 12.0.w),
//       ),
//       trailing: Container(
//         height: 40,
//         width: 100,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20.0),
//             border: Border.all(width: 2.0.w, color: Color(0xFF757575))),
//         child: GestureDetector(
//           onTap: () {
//             //launchURL(user.url);
//           },
//           child:
//               Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//             Text(
//               'View in Map',
//               style: TextStyle(
//                   fontSize: 12.0,
//                   color: Color(0xFFBDBDBD),
//                   fontWeight: FontWeight.w400),
//             ),
            
//           ],),
//         ),
//       ),
//     );
//   }
// }