import 'package:calculator_app/buttons.dart';
import 'package:calculator_app/functions.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text( Functions.input ,style: TextStyle(fontSize: 45,
                            fontWeight: FontWeight.bold,),),
            SizedBox(height: 20,),
            Wrap(
              children: Buttons.all
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                         fixedSize: e == "0" 
                              ? Size(MediaQuery.of(context).size.width * 0.44, 70)
                              : Size(MediaQuery.of(context).size.width * 0.22, 70),
                          backgroundColor: Buttons.equals.contains(e)? Colors.green 
                          : Colors.grey[500]
                        ),
                        onPressed: () {
                          Functions.append(e, setState);
                        },
                        child: Text(
                          e,
                          style: TextStyle(
                            color: Buttons.rightColumnButtons.contains(e)? Colors.green:Buttons.topRowButtons.contains(e)? Colors.green: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
