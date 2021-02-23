import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_bloc_grahpql/bloc/card/bank_card_bloc.dart';

class BankCardScreen extends StatefulWidget{
  @override
  _BankCardScreenState createState() => _BankCardScreenState();

}

class _BankCardScreenState extends State<BankCardScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Bank Cards"),),
      body: BlocBuilder<BankCardBloc,BankCardState>(

        builder: (context,state){
          if(state is BankCardLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          if(state is LoadBankCard){
            print(state.bankCards.toString());
            return ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: state.bankCards.length,
                itemBuilder: (context,index){
                  return ListTile(
                    title: Text(state.bankCards[index].accountNumber,style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text(state.bankCards[index].availableBalance??""),
                  );
                });
          }
        },
      ),
    );
  }
}