import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summary, {super.key});
  final List<Map<String, Object>> summary;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map((data) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(217, 16, 4, 104),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        fixedSize: const Size.square(8),
                        shape: const CircleBorder(),
                        backgroundColor: data['correct_ans'] == data['user_ans']
                            ? const Color.fromARGB(255, 3, 107, 6)
                            : const Color.fromARGB(255, 168, 18, 7),
                      ),
                      child: Text(
                        (((data['q_idx']) as int) + 1).toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['ques'].toString(),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Correct Answer: ${data['correct_ans'].toString()}',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 15,
                          ),
                        ),
                        if (data['correct_ans'] != data['user_ans'])
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Your Answer: ${data['user_ans'].toString()}',
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 300,
//       child: SingleChildScrollView(
//         child: Column(
//             children: summary.map((data) {
//           return Row(
//             children: [
//               Text(
//                 (((data['q_idx']) as int) + 1).toString(),
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 15,
//                   //fontFamily: GoogleFonts.lato
//                 ),
//               ),
//               // const SizedBox(
//               //   width: 10,
//               // ),
//               Expanded(
//                 child: Column(children: [
//                   Text(
//                     data['ques'].toString(),
//                     textAlign: TextAlign.left,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 15,

//                       //fontFamily: GoogleFonts.lato
//                     ),
//                   ),
//                   // const SizedBox(
//                   //   height: 10,
//                   // ),
//                   Text(
//                     data['correct_ans'].toString(),
//                     textAlign: TextAlign.left,
//                     style: const TextStyle(
//                       color: Colors.green,
//                       fontSize: 15,
//                       //fontFamily: GoogleFonts.lato
//                     ),
//                   ),
//                   // const SizedBox(
//                   //   height: 10,
//                   // ),
//                   if (data['correct_ans'] != data['user_ans'])
//                     Text(
//                       data['user_ans'].toString(),
//                       textAlign: TextAlign.left,
//                       style: const TextStyle(
//                         color: Colors.red,
//                         fontSize: 15,
//                         //fontFamily: GoogleFonts.lato
//                       ),
//                     ),
//                 ]),
//               )
//             ],
//           );
//         }).toList()),
//       ),
//     );
//   }
// }
