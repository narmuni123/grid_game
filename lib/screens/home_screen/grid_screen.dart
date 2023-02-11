import 'package:flutter/material.dart';
import 'package:grid_game/constant/methods.dart';
import 'package:grid_game/constant/size_constant.dart';

class GridScreen extends StatefulWidget {
  const GridScreen({Key? key}) : super(key: key);

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => killApp(context),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "Grid",
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width(context) * 0.02,
              vertical: height(context) * 0.02,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: searchController,
                    maxLength: value.length,
                    onChanged: (search) {
                      for (int i = 0; i < value.length; i++) {
                        if (value[i] == null || value[i].isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text("Please fill all the values in grid."),
                            ),
                          );
                        }
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: "Search",
                    ),
                  ),
                  heightBox(
                    height(context) * 0.01,
                  ),
                  (row == null || column == null)
                      ? const Center(
                          child: Text(
                            "Add rows and columns",
                          ),
                        )
                      : GridView.builder(
                          itemCount: value.length,
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: column!,
                            mainAxisSpacing: height(context) * 0.05,
                            crossAxisSpacing: width(context) * 0.1,
                          ),
                          itemBuilder: (_, int index) {
                            return Container(
                              decoration: BoxDecoration(
                                color: (searchController.text
                                        .toLowerCase()
                                        .contains(value[index]
                                            .toString()
                                            .toLowerCase()))
                                    ? Colors.green.withOpacity(0.4)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.black,
                                ),
                              ),
                              child: TextFormField(
                                maxLines: 1,
                                maxLength: 1,
                                textAlign: TextAlign.center,
                                onChanged: (input) {
                                  value[index] = input;
                                },
                              ),
                            );
                          },
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
