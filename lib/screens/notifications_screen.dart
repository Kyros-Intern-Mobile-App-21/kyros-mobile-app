import 'package:flutter/material.dart';
import 'package:kyros_app_mobile/models/NotificationScreenListTile.dart';
import 'package:kyros_app_mobile/util/style_constants.dart';
import 'package:kyros_app_mobile/widgets/search_bar_widget.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

// comment to test edit perms, remove later

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: new DefaultTabController(
        length: 2,
        child: new Scaffold(
          appBar: new PreferredSize(

            preferredSize: Size.fromHeight(130.0),
            child: new Container(

              color: StyleConstants.black,
              child: new SafeArea(

                child: Column(

                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new TabBar(

                      tabs: [
                        new Container(
                          height: 20.0,
                          child: new Tab(text: 'Message Notifications'),
                        ),
                        new Container(
                          height: 50.0,
                          child: new Tab(text: 'Assignment Notifications'),
                        ),
                      ],
                    ),
                    Expanded(
                        child: Container(

                          child: SizedBox(height: 10),
                        )
                    ),


                    Expanded(
                        child: Container(

                          child: SearchBar(),
                        )
                    ),

                    Expanded(
                        child: Container(

                          child: SizedBox(height: 10),
                        )
                    ),

                  ],
                ),
              ),
            ),
          ),

          body: new TabBarView(

            children: <Widget>[

              new Column(
                children: <Widget>[
                  Expanded(
                    child: Container(

                      child: getListView(),
                    ),
                  ),
                ],
              ),
              new Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: getListView(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Center(
//       // A column of Widgets that make up the app
//         child: Column(
//           children: [
//             // Two buttons "Message Notifications" "Assignment Notifications"
//             Container(
//               height: 60,
//               child: Row(
//                 children: [
//                   // Message notis button
//                   Expanded(
//                     child: TextButton(
//                         onPressed: () {print('msgnoti pressed');},
//
//                         child: Text('Message Notifications')),
//
//
//                   ),
//                   Container(
//                     color: Colors.grey,
//                     width: 2.0,
//                   ),
//                   // Assignment notis button
//                   Expanded(
//                     child: TextButton(
//                         onPressed: () {print('asnmtnoti pressed');},
//                         child: Text('Assignment Notifications')),
//                   )
//                 ],
//               ),
//             ),
//
//             Flexible(
//                 child: getListView()
//             ),
//
//           ],
//         )
//     ),
//   );
// }
}

// Creates a list of data for notifications
// in format [[title1, desc1], [title2, desc2], ...]
// TODO: this is a placeholder, replace with something that gets the actual info for notifications
List<List> getListElements() {
  var items = List<List>.generate(
      1000, (counter) => ["Notification $counter", "description $counter"]);
  return items;
}

// builds memory efficient list
// returns a built ListView
Widget getListView() {
  // create variable with list of data for notifications
  // needs format [[title1, desc1], [title2, desc2], ...]
  var listItems = getListElements();

  // build the thing
  var listView = ListView.builder(
      // padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
      itemBuilder: (context, index) {
        return NotificationScreenListTile(
          title: listItems[index][0],
          description: listItems[index][1],
        );
      });

  // return built ListView when this function is called
  return listView;
}
