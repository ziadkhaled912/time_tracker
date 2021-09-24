import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker_app/app/counter/cubit/cubit.dart';
import 'package:time_tracker_app/app/counter/cubit/states.dart';

class CounterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state) {},
        builder: (context, state){
          return Scaffold(
              appBar: AppBar(
                title: Text('Counter app'),
                centerTitle: true,
              ),
              body: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(
                        onPressed: (){
                          CounterCubit.get(context).minus();
                          },
                        child: Text(
                          '-',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0),
                      child: Text(
                        '${CounterCubit.get(context).counter}',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    FloatingActionButton(
                        onPressed: (){
                          CounterCubit.get(context).plus();
                        },
                        child: Icon(
                          Icons.add,
                        )
                    ),
                  ],
                ),
              )
          );
        },
      ),
    );
  }
}
