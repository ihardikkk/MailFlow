import 'package:flutter/material.dart';

class VipScreen extends StatefulWidget {
  const VipScreen({super.key});

  @override
  State<VipScreen> createState() => _VipScreenState();
}

class _VipScreenState extends State<VipScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("VIP"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: const Center(
        child: Text("VIP Screen"),
      ),
    );
  }
}