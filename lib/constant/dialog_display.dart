import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grid_game/constant/text_constant.dart';

class DialogDisplay {
  static Future exitApp(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        titlePadding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        contentPadding: const EdgeInsets.only(left: 16, right: 16, top: 0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              TextConstants.EXIT_APP,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: Colors.red,
                  ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.close),
            ),
          ],
        ),
        content: Text(
          TextConstants.EXIT_APP_CHECK,
          style: Theme.of(context).textTheme.headline1!.copyWith(
                color: Colors.grey,
              ),
        ),
        actions: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 96,
                    height: 38,
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 0),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: const BorderSide(color: Colors.grey),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      child: Text(
                        TextConstants.NO,
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 96,
                    height: 38,
                    child: ElevatedButton(
                      onPressed: () {
                        if (Platform.isIOS) {
                          exit(0);
                        } else {
                          SystemNavigator.pop();
                        }
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 0),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: const BorderSide(color: Colors.blueAccent),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueAccent),
                      ),
                      child: Text(
                        TextConstants.YES,
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
