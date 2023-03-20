import 'package:flutter/material.dart';

import 'login_w.dart';
import 'sign_up_w.dart';

class ChangeSize extends StatefulWidget {
  const ChangeSize({super.key});

  @override
  State<ChangeSize> createState() => _ChangeSizeState();
}

class _ChangeSizeState extends State<ChangeSize> {
  bool _isExpanded1 = true;
  bool _isExpanded2 = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                if (index == 0) {
                  _isExpanded1 = !isExpanded;
                } else if (index == 1) {
                  _isExpanded2 = !isExpanded;
                }
              });
            },
            children: [
              ExpansionPanel(
                canTapOnHeader: true,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return const ListTile(
                    leading: Icon(Icons.ac_unit),
                    title: Text("Sign Up"),
                  );
                },
                body: const SignupWid(),
                // Container(
                //   padding: const EdgeInsets.all(16.0),
                //   child: const Text('Content for Panel 1 goes here.'),
                // ),
                isExpanded: _isExpanded1,
              ),
              ExpansionPanel(
                canTapOnHeader: true,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return const ListTile(
                    leading: Icon(Icons.access_alarm),
                    title: Text('Login Page'),
                  );
                },
                body: const LoginWid(),
                //  Container(
                //   padding: EdgeInsets.all(16.0),
                //   child: Text('Content for Panel 2 goes here.'),
                // ),
                isExpanded: _isExpanded2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
