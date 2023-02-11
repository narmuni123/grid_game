import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grid_game/constant/methods.dart';
import 'package:grid_game/constant/size_constant.dart';
import 'package:grid_game/constant/text_constant.dart';

class AddGridScreen extends StatefulWidget {
  const AddGridScreen({Key? key}) : super(key: key);

  @override
  State<AddGridScreen> createState() => _AddGridScreenState();
}

class _AddGridScreenState extends State<AddGridScreen> {
  TextEditingController rowController = TextEditingController();
  TextEditingController columnController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    rowController.dispose();
    columnController.dispose();
    super.dispose();
  }

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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heightBox(height(context) * 0.02),
                const Text(
                  "Rows",
                ),
                TextFormField(
                  controller: rowController,
                  validator: rowValidator(),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                ),
                heightBox(height(context) * 0.02),
                const Text(
                  "Columns",
                ),
                TextFormField(
                  controller: columnController,
                  validator: columnValidator(),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
                ),
                heightBox(height(context) * 0.02),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      row = int.parse(rowController.text);
                      column = int.parse(columnController.text);
                      Navigator.pushNamed(context, TextConstants.GRID_SCREEN);
                    }
                  },
                  child: const Center(
                    child: Text(
                      "Add Grid",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
