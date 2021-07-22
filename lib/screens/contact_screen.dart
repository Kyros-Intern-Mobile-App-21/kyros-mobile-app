import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyros_app_mobile/models/contact_model.dart';
import 'package:kyros_app_mobile/models/contacts.dart';
import 'package:kyros_app_mobile/widgets/search_bar_widget.dart';

import 'add_contact_screen.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  String searchInput = '';
  List display_contacts = contacts;
  bool showDescription = false;
  int selectedContact = 0;

  void search() {
    setState(() {
      if (searchInput == '') {
        display_contacts = contacts;
      } else {
        display_contacts = [];
        for (Contact contact in contacts) {
          if (contact.name.length >= searchInput.length) {
            if (contact.name.toLowerCase().contains(searchInput.toLowerCase())) {
              display_contacts.add(contact);
            }
          }
        }
      }
    });
  }

  void viewDescription(int index) {
    if (showDescription == true) {
      setState(() {
        showDescription = false;
      });
    } else {
      setState(() {
        showDescription = true;
        selectedContact = index;
      });
    }
  }
  void onGoBack(dynamic value) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                height: 35,
                width: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.only(top: 8, left: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  onChanged: (input) {
                    searchInput = input;
                    search();
                  },
                  decoration: InputDecoration.collapsed(
                    hintText: 'Search',
                  ),
                ),
              ),
        Container(
            height: 35,
            width: 35,
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: FlatButton(
              onPressed: () {
                Route route = MaterialPageRoute(builder: (context) => AddContactScreen());
                Navigator.push(context, route).then(onGoBack);
              },
              child: Icon(Icons.add),
              color: Colors.white,
              shape: CircleBorder(),
            ))
      ])),
      body: Center(
          child: Column(children: [
        Expanded(
          child: ListView.builder(
              itemCount: display_contacts.length,
              itemBuilder: (BuildContext context, int index) {
                final contact = display_contacts[index];
                return Container(
                  height: 60,
                  padding:
                      EdgeInsets.only(top: 20, bottom: 0, left: 0, right: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 60,
                        padding: EdgeInsets.only(
                            left: 75, right: 0, bottom: 0, top: 0),
                        child: FlatButton(
                          onPressed: () {
                            viewDescription(index);
                          },
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage:
                            AssetImage(contact.Image_URL),
                          ),
                          color: Colors.white,
                          shape: CircleBorder(),
                        ),
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 50, left: 30),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 60,
                                  child: Column(children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [Text(contact.name)]),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [Text(contact.role)])
                                  ]),
                                ),
                                Container(
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.only(left: 125),
                                    child: Row(children: [
                                      FlatButton(
                                        onPressed: () {
                                          ;
                                        },
                                        child: Icon(Icons.chat),
                                        color: Colors.white,
                                        shape: CircleBorder(),
                                      ),
                                    ])),
                              ]),
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(
                              color: Colors.green,
                              width: 3.0,
                            ),
                          ))),
                    ],
                  ),
                );
              }),
        ),
        Visibility(
            maintainSize: false,
            maintainAnimation: true,
            maintainState: true,
            visible: showDescription,
            child: Container(
                height: 200,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.red,
                    ),
                    color: Colors.black12),
                child: Center(
                    child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: FlatButton(
                            onPressed: () {
                              ;
                            },
                            child: Icon(Icons.chat),
                            color: Colors.white,
                            shape: CircleBorder(),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            child: Row(
                          children: [
                            Container(
                              height: 50,
                              margin: EdgeInsets.only(left: 15, right: 10),
                              child: FlatButton(
                                onPressed: () {
                                  ;
                                },
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundImage:
                                  AssetImage(display_contacts[selectedContact].Image_URL),
                                ),
                                color: Colors.white,
                                shape: CircleBorder(),
                              ),
                            ),
                            Text(display_contacts[selectedContact].name,
                                style: TextStyle(
                                  fontSize: 20.0,
                                ))
                          ],
                        ))
                      ],
                    ),
                    Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: 15, right: 15, top: 25, bottom: 5),
                        padding: const EdgeInsets.only(
                          top: 30,
                          bottom: 30,
                          right: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Text(
                            (display_contacts[selectedContact].description)))
                  ],
                )))),
      ])),
      backgroundColor: Colors.grey[400],
    );
  }
}
