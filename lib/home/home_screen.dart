import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kicksonapp/authentication_bloc/authentication_bloc.dart';
import 'package:kicksonapp/authentication_bloc/bloc.dart';
import 'package:kicksonapp/signin/signin_screen.dart';

import 'bloc/home_bloc.dart';
import 'home_main.dart';

class HomeScreen extends StatefulWidget {
  final int _index;

  HomeScreen({Key key, int index})
      : _index = index,
        super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int get _index => widget._index;
  int _selectedIndex = 0;
  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    super.initState();
    _selectedIndex = _index != null && _index > 0 ? _index : 0;
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
  }

  void _onItemTapped(int index) {
    debugPrint("]-----] index [-----[ $index");

    setState(() {
      _selectedIndex = index;

      if (_selectedIndex == 2) {
        _showDialog();
      }
    });
  }
  void _showDialog() {
    // flutter defined function
    if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SigninScreen()),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      HomeMain(),
      HomeMain(),
      HomeMain(),
      HomeMain(),

//      MessageScreen(),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)),
        child: _children[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,

//        elevation: 25,
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.home,
              size: 25.0,
            ),
            activeIcon: FaIcon(
              FontAwesomeIcons.home,
              size: 25.0,
            ),
            title: Padding(padding: EdgeInsets.all(0)),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.instagram,
              size: 30.0,
            ),
            activeIcon: FaIcon(
              FontAwesomeIcons.instagram,
              size: 30.0,
            ),
            title: Padding(padding: EdgeInsets.all(0)),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.idCard,
              size: 25.0,
            ),
            activeIcon: FaIcon(
              FontAwesomeIcons.idCard,
              size: 25.0,
            ),
            title: Padding(padding: EdgeInsets.all(0)),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.bell,
              size: 25.0,
            ),
            activeIcon: FaIcon(
              FontAwesomeIcons.bell,
              size: 25.0,
            ),
            title: Padding(padding: EdgeInsets.all(0)),
          ),
        ],
        currentIndex: _selectedIndex,

        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Color.fromRGBO(155, 155, 155, 1),
        onTap: _onItemTapped,
        unselectedFontSize: 13,
        selectedFontSize: 13,
        selectedLabelStyle:
            TextStyle(fontFamily: "NotoSansCJKkr-Medium", fontSize: 13),
      ),
    );
  }
}
