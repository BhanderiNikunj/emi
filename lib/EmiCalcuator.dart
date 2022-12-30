import 'package:emi/OutPut.dart';
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
  List amou=[];
  List rat=[];
  List tim=[];

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
                "Amount  :  ${amount.toInt()}",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Slider(
              value: amount,
              max: 1000000,
              divisions: 100,
              activeColor: Colors.orange.shade900,
              inactiveColor: Colors.orange.shade300,
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
                "Rate  :  ${rate.toInt()}",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Slider(
              value: rate,
              max: 10,
              divisions: 10,
              activeColor: Colors.orange.shade900,
              inactiveColor: Colors.orange.shade300,
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
                "Time  :  ${time.toInt()}",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Slider(
              value: time,
              max: 25,
              divisions: 25,
              activeColor: Colors.orange.shade900,
              inactiveColor: Colors.orange.shade300,
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
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => Total(amount , rate , time),));
                  setState(() {
                    amou.add(amount);
                    rat.add(rate);
                    tim.add(time);
                    total = amount * rate * ((1 + rate) * time) / ((1 + rate) * time - 1);
                  });
                },
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.purple.shade900, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.shade300,
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
            SizedBox(height: 50,),
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.orange,
              alignment: Alignment.center,
              child: Text("${total.toInt()}"),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => Output(double aamount , double rate , double time),));\]\
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Total(amou, rat, tim),));
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Expanded(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade500,
                        borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.wallet,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}