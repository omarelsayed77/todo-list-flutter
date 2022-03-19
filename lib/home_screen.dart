// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, list_remove_unrelated_type

import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dataprovider.dart';

class homescreen extends StatefulWidget {
  String? errortext;
  bool ischange = false;
  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  FocusNode focusNode = FocusNode();
  TextEditingController morytextcon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[100],
      appBar: AppBar(
        title: Text(
          'ToDo List',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.all(20),
              // color: Colors.blue[200],
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              width: MediaQuery.of(context).size.width,
              child: Consumer<dataprovider>(
                builder: (context, value, child) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'My Tasks',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            context
                                .read<dataprovider>()
                                .addtosharedpreference(morytextcon.text);
                            morytextcon.clear();
                            FocusScope.of(context).unfocus();
                            // if (morytextcon.text.length < 3) {
                            //   widget.errortext = 'errrrrrrrrrrror';
                            // } else {
                            //   widget.errortext = null;
                            // }
                          },
                          child: Text('Add'),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      focusNode: focusNode,
                      maxLength: 27,
                      maxLines: 3,
                      controller: morytextcon,
                      decoration: InputDecoration(
                          errorText: widget.errortext,
                          hintText: "write a new task...",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    Container(
                      child: Column(
                        children: [
                          for (int i = 0; i < value.mydata.length; i++)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      // color: Colors.blue[200],
                                      borderRadius: BorderRadius.circular(20)),
                                  margin: EdgeInsets.all(20),
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    '${value.mydata[i]}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          context
                                              .read<dataprovider>()
                                              .delllllllll(i);
                                        },
                                        icon: Icon(Icons.delete)),
                                    Checkbox(
                                        value:
                                            (value.checkBoxsValues.length > 0)
                                                ? value.checkBoxsValues[i]
                                                : false,
                                        onChanged: (val) {
                                          value.changeCheckBoxValue(i);
                                        })
                                  ],
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
