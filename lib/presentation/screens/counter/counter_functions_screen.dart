import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {

  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter Functions'),
          actions: [
            IconButton(onPressed: (){
              setState(() {
                clickCounter = 0;
              });
            }, 
            icon: Icon(Icons.refresh_rounded)),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$clickCounter', style: const TextStyle(fontSize: 160, fontWeight: FontWeight.w100)),
              if(clickCounter != 1)
                Text('Clicks', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w100))
              else 
                Text('Click', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w100)),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              icon: Icons.refresh_rounded,
              onPressed: (){
                setState(() {
                  clickCounter = 0;
                });
              }
            ),
            const SizedBox(height: 10),
            CustomButton(
              icon: Icons.exposure_minus_1_outlined,
              onPressed: (){
                setState(() {
                  if(clickCounter == 0) return;
                  clickCounter--;
                });
              }),
            const SizedBox(height: 10),
            CustomButton(icon: Icons.plus_one,
              onPressed: () {
                setState(() {
                  clickCounter++;
                });
              }), 
          ],
        )
      );
  }
}

class CustomButton extends StatelessWidget {

  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key, required this.icon, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(icon)
    );
  }
}