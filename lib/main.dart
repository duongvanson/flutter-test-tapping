import 'package:fa_tapping_list/box_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(ChangeNotifierProvider(create: (_) => BoxProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tapping",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tapping"),
      ),
      body: Column(
        children: <Widget>[
          _listTapping(context),
          Divider(),
          context.watch<BoxProvider>().select != -1
              ? _detailTapping(context)
              : Container()
        ],
      ),
    );
  }

  Widget _listTapping(BuildContext context) {
    var providerData = context.watch<BoxProvider>().data;
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: providerData.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: SizedBox(
              width: 80,
              child: Card(
                color: providerData[index].color,
                child: Center(
                    child: Text(
                  "${providerData[index].value}",
                  style: TextStyle(fontSize: 26),
                )),
              ),
            ),
            onTap: () {
              context.read<BoxProvider>().setSelect(index);
            },
          );
        },
      ),
    );
  }

  Widget _detailTapping(BuildContext context) {
    var state = context.watch<BoxProvider>();
    return SizedBox(
      width: 100,
      height: 100,
      child: GestureDetector(
        child: Card(
            color: state.data[state.select].color,
            child: Center(
              child: Text("${state.data[state.select].value}",
                  style: TextStyle(fontSize: 26)),
            )),
        onTap: () {
          context.read<BoxProvider>().upValueBox(state.select);
        },
      ),
    );
  }
}
