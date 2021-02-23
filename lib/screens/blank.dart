import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_bloc_grahpql/bloc/auth/auth_bloc.dart';
import 'package:flutter_demo_bloc_grahpql/bloc/auth/auth_state.dart';
import 'package:flutter_demo_bloc_grahpql/models/auth_request.dart';
import 'package:flutter_demo_bloc_grahpql/screens/atm_locations_screen.dart';

class BlankScreen extends StatefulWidget {
  @override
  _BlankScreenState createState() => _BlankScreenState();
}

class _BlankScreenState extends State<BlankScreen> {
  AuthBloc _authBloc;

  @override
  void initState() {
    // TODO: implement initState
    _authBloc = AuthBloc();
    super.initState();
  }

  @override
  void dispose() {
    _authBloc.close();
    super.dispose();
  }

  void create() {
    print("Calling login");
    _authBloc.authenticateUser(
      AuthRequest(
          bankConf: "12",
          imei: "123",
          simCardSerial: "202020",
          appId: "123",
          pin: "123"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: BlocBuilder(
              bloc: _authBloc,
              builder: (BuildContext context, AuthState state) {
                return IconButton(
                    icon: Icon(Icons.add), onPressed: () =>
                {
                  create(),
                  Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext con) => AtmLocationsScreen()))
                }
                    );
              }),
        ),
      ),
    );
  }
}
