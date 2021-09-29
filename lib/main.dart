import 'package:flutter/material.dart';
import 'package:mdapp/body-widget.dart';
import 'package:mdapp/create.widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  child: Text('P'),
                ),
                accountEmail: Text('panjos@gmail.com'),
                accountName: Text('Panjos'),
              ), //DrawerHeader()
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Perfil'),
              ),
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text('Notificações'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Configurações'),
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Sair'),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   onPressed: () {},
          // ),
          title: Center(
            child: Text('Panjos'),
          ),
          actions: <Widget>[
            // current snackbar in context the scaffold
            Builder(
              builder: (BuildContext context) {
                return IconButton(
                    icon: Icon(Icons.notification_important),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Scaffold snackbar'),
                        ),
                      );
                    });
              },
            ),
            // IconButton(
            //   icon: Icon(Icons.notification_important),
            //   onPressed: () {
            //     //old snack bar
            //     final snackbar =
            //         SnackBar(content: Text('Test Snackbar notification'));
            //     _scaffoldKey.currentState.showSnackBar(snackbar);
            //   },
            // ),
            IconButton(icon: Icon(Icons.settings), onPressed: () {}),
          ],
        ),
        body: BodyWidget(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Add',
              icon: Icon(
                Icons.add,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
