import 'package:flutter/material.dart';

class CartesianChart extends StatefulWidget {
  const CartesianChart({super.key});

  @override
  State<CartesianChart> createState() => _CartesianChartState();
}

class _CartesianChartState extends State<CartesianChart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cartesian Charts"),
      ),
    );
  }
}
