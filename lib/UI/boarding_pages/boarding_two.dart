import 'package:flutter/material.dart';

class BoardingTwo extends StatelessWidget {
  const BoardingTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Image.asset('assets/boarding_two.png'),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 24,right: 24 ,top: 24),
          child: RichText(
            text: const TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'Hundreds of jobs are waiting for you to ',
                    style: TextStyle(color: Colors.black , fontSize: 34),
                  ),
                  TextSpan(
                    text: 'join together ',
                    style: TextStyle(color: Color(0xFF3366FF) , fontSize: 34),
                  ) ,
                  
              ]
            ) ,)
          
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(right: 24,left: 24 , top: 10),
        child: Text(
          'Immediately join us and start applying for the job you are interested in.',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF6B7280)
          ),
          ),
      )
      ],
    );
  }
}
