import 'package:emi/Calcuation.dart';
import 'package:flutter/material.dart';

class EMI extends StatefulWidget {
  const EMI({Key? key}) : super(key: key);

  @override
  State<EMI> createState() => _EMIState();
}

class _EMIState extends State<EMI> {
  double amount = 0;
  double rate = 0;
  double time = 0;
  double total = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // price
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                "$amount",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Slider(
              value: amount,
              max: 1000000,
              divisions: 100,
              activeColor: Colors.purple,
              inactiveColor: Colors.purple.shade900,
              onChanged: (value) {
                setState(() {
                  amount = value;
                });
              },
            ),
            // rate
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                "$rate",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Slider(
              value: rate,
              max: 10,
              divisions: 10,
              activeColor: Colors.purple,
              inactiveColor: Colors.purple.shade900,
              onChanged: (value) {
                setState(() {
                  rate = value;
                });
              },
            ),
            // time
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                "$time",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Slider(
              value: time,
              max: 25,
              divisions: 25,
              activeColor: Colors.purple,
              inactiveColor: Colors.purple.shade900,
              onChanged: (value) {
                setState(() {
                  time = value;
                });
              },
            ),
            SizedBox(height: 100,),
            Center(
              child: InkWell(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => Cal(amount),));
                  setState(() {
                    total = amount * rate * ((1 + rate) * time) / ((1 + rate) * time - 1);
                  });
                },
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade200,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.purple.shade900, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.shade100,
                        offset: Offset(2, 2),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Calcuate",
                    style: TextStyle(
                      color: Colors.purple.shade900,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.orange,
              child: Text("$total"),
            )
          ],
        ),
      ),
    );
  }
}