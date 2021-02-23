import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_bloc_grahpql/bloc/atm/atm_location_bloc.dart';
import 'package:flutter_demo_bloc_grahpql/bloc/atm/atm_location_repository.dart';
import 'package:flutter_demo_bloc_grahpql/bloc/auth/auth_bloc.dart';
import 'package:flutter_demo_bloc_grahpql/bloc/card/bank_card_bloc.dart';
import 'package:flutter_demo_bloc_grahpql/screens/blank.dart';
import 'bloc/card/bank_card_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  AtmLocationRepository atmLocationRepository = new AtmLocationRepository();
  BankCardRepository bankCardRepository = new BankCardRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
        BlocProvider<AtmLocationBloc>(
          create: (context) =>
              AtmLocationBloc(repository: atmLocationRepository)
                ..add(AtmLocationFetched()),
        ),
        BlocProvider<BankCardBloc>(
          create: (context) => BankCardBloc(repository: bankCardRepository)
            ..add(BankCardFetched()),
        ),
      ],
      child: MaterialApp(
          title: 'ZB Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: BlankScreen()),
    );
  }
}
