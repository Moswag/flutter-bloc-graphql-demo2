import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_bloc_grahpql/bloc/atm/atm_location_bloc.dart';
import 'package:flutter_demo_bloc_grahpql/screens/bank_card_screen.dart';

class AtmLocationsScreen extends StatefulWidget {
  @override
  _AtmLocationsScreenState createState() => _AtmLocationsScreenState();
}

class _AtmLocationsScreenState extends State<AtmLocationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jobs"),
        leading: IconButton(
          icon: Icon(Icons.add),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext con) => BankCardScreen())),
        ),
      ),
      body: BlocBuilder<AtmLocationBloc, AtmLocationState>(
        builder: (context, state) {
          if (state is AtmLocationLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LoadAtmLocations) {
            print(state.atmLocations.toString());
            return ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: state.atmLocations.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      state.atmLocations[index].name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(state.atmLocations[index].city ?? ""),
                  );
                });
          }
        },
      ),
    );
  }
}
