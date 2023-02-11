import 'package:flutter/material.dart';
import 'package:grid_game/constant/size_constant.dart';

class AddGridScreen extends StatefulWidget {
  const AddGridScreen({Key? key}) : super(key: key);

  @override
  State<AddGridScreen> createState() => _AddGridScreenState();
}

class _AddGridScreenState extends State<AddGridScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Add grid",
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width(context) * 0.1),
          child: Column(
            children: [
              TextFormField(),
              heightBox(height(context) * 0.02),
              TextFormField(),
            ],
          ),
        ),
      ),
    );
  }
}
