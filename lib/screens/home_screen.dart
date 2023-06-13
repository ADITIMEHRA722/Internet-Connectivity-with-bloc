import 'package:block_wifi_connectivity/blocs/internet_bloc/internet_bloc.dart';
import 'package:block_wifi_connectivity/blocs/internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state) {
          if(state is InternetGainedState){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Connected"), 
              backgroundColor: Colors.green,)
            );
          }
          else if(state is InternetLostState){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(" Not Connected"), 
              backgroundColor: Colors.red,)
            );
          }else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(" loading..."), 
              backgroundColor: Colors.black,)
            );
          }
          },
          builder: (context, state) {
                if(state is InternetGainedState ){
              return Text("Connected");
            }else if(state is InternetLostState){
              return Text(" Not Coneected");
            }else{
              return Text("Loading.....");
            }
          
          },
        ),

        // it is used for UI
        // child: BlocBuilder<InternetBloc, InternetState>(
        //   builder: (context, state) {
        //     // == to check value
        //     // "is" to check data type
        //     if(state is InternetGainedState ){
        //       return Text("Connected");
        //     }else if(state is InternetLostState){
        //       return Text(" Not Coneected");
        //     }else{
        //       return Text("Loading.....");
        //     }
        //   },
        // ),
      )),
    );
  }
}
