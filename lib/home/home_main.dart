import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicksonapp/authentication_bloc/authentication_bloc.dart';
import 'package:kicksonapp/authentication_bloc/bloc.dart';

class HomeMain extends StatelessWidget {
  HomeMain({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KICKSON'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(
                LoggedOut(),
              );
            },
          )
        ],
      ),
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(100, (index) {
          return Center(
              child: Container(
                child: Image(
                    image: AssetImage('assets/images/dump/1@3x.png'), width: 150,height: 150),
//                child: Text('Item $index',
//                    style: Theme.of(context).textTheme.headline5, textAlign: TextAlign.center) ,
              ));
        }),
      ),
    );
  }
}
