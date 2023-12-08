import 'package:flutter/material.dart';

class BoardingThree extends StatelessWidget {
  const BoardingThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Image.asset('assets/boarding_three.png'),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 24,right: 24 , top: 24),
          child: RichText(
            text: const TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'Find a job, and ',
                    style: TextStyle(color: Colors.black , fontSize: 34),
                  ),
                  TextSpan(
                    text: 'start building ',
                    style: TextStyle(color: Color(0xFF3366FF) , fontSize: 34),
                  ) ,
                  TextSpan(
                    text: 'your career from now on' ,
                    style: TextStyle(color: Colors.black , fontSize: 34),
          
                  )
              ]
            ) ,)
          
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(right: 24,left: 24 , top: 10),
        child: Text(
          'Explore over 25,924 available job roles and upgrade your operator now.',
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
