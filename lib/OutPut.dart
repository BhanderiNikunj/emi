import 'package:emi/EmiCalcuator.dart';
import 'package:flutter/material.dart';

class Total extends StatefulWidget {
  List amount = [];
  List rate = [];
  List time = [];

  Total(this.amount, this.rate, this.time);

  @override
  State<Total> createState() => _TotalState();
}

class _TotalState extends State<Total> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.orange,
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.amount
                        .asMap()
                        .entries
                        .map((e) => Text("${widget.amount[e.key]}"))
                        .toList(),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.rate
                        .asMap()
                        .entries
                        .map((e) => Text("${widget.rate[e.key]}"))
                        .toList(),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.time
                        .asMap()
                        .entries
                        .map((e) => Text("${widget.time[e.key]}"))
                        .toList(),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
              child: Container(
                height: 50,
                width: 50,
                color: Colors.orange,
              ),
            )
          ],
        ),
      ),
    );
  }
}
