import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/create_tasks_input_data/bloc.dart';
import '../../bloc/create_tasks_input_data/event.dart';

Widget CreateTaskPageBanner(BuildContext context) {
  final CreateTaskInputData textBloc = context.read<CreateTaskInputData>();
  return ClipPath(
    clipper: MyBgClipper(),
    child: Container(
      height: 300,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal :10),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple,
              Colors.purple
            ]
        ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: const InputDecoration(
              filled: true,
              fillColor: Color(0xFF6EB0EA),
              hintText: 'Enter task name',
              hintStyle: TextStyle(color: Colors.white54, fontWeight: FontWeight.w300),
            ),
            onChanged: (String value){
              textBloc.add(AddNameEvent(name: value));
            },
          ),
          const SizedBox(height: 20,),
          TextField(
            maxLines: 3,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Color(0xFF6EB0EA),
              hintStyle: TextStyle(color: Colors.white54, fontWeight: FontWeight.w300),
              border: OutlineInputBorder(),
              hintText: 'Enter task description',
            ),
            onChanged: (String value){
              textBloc.add(AddDescriptionEvent(description: value));
            },
          ),
        ],
      ),
    ),
  );
}

class MyBgClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 20);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
    Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}








// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../bloc/create_tasks_input_data/bloc.dart';
// import '../bloc/create_tasks_input_data/event.dart';
//
// Widget CreateTaskPageBanner(BuildContext context) {
//   final CreateTaskInputData textBloc = context.read<CreateTaskInputData>();
//   return Container(
//       height: 250,
//       child: Stack(
//         children: [
//           SizedBox.expand(child: CustomPaint(painter: BannerBgPainter())),
//           Container(
//             padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
//             child: Column(
//                 children: <Widget>[
//                   TextField(
//                     decoration: const InputDecoration(
//                       filled: true,
//                       fillColor: Color(0xFF6EB0EA),
//                       hintText: 'Enter task name',
//                       hintStyle: TextStyle(color: Colors.white54, fontWeight: FontWeight.w300),
//                     ),
//                     onChanged: (String value){
//                       textBloc.add(AddNameEvent(name: value));
//                     },
//                   ),
//                   const SizedBox(height: 20,),
//                   TextField(
//                     maxLines: 3,
//                     decoration: const InputDecoration(
//                       filled: true,
//                       fillColor: Color(0xFF6EB0EA),
//                       hintStyle: TextStyle(color: Colors.white54, fontWeight: FontWeight.w300),
//                       border: OutlineInputBorder(),
//                       hintText: 'Enter task description',
//                     ),
//                     onChanged: (String value){
//                       textBloc.add(AddDescriptionEvent(description: value));
//                     },
//                   ),
//                 ],
//               ),
//           ),
//         ],
//       ),
//   );
// }
//
// class BannerBgPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final sw = size.width;
//     final sh = size.height;
//     final paint = Paint();
//
//     Path bannerBg = Path();
//     paint.color = const Color.fromRGBO(5, 33, 100, 1.0);
//
//     bannerBg.addRect(Rect.fromLTRB(0, 0, sw, sh));
//     bannerBg.moveTo(sw, sh);
//     bannerBg.quadraticBezierTo(sh + 100, sh * 1.3, 0, sh);
//     canvas.drawPath(bannerBg, paint);
//   }
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }