import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../firebase/QazaModel.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productList = Provider.of<List<UserData>>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
            ),
            onPressed: () {

            },
          ),
        ],
      ),
      body: productList != null
          ? ListView.builder(
        itemCount: productList.length,
        itemBuilder: (ctx, i) => ListTile(
          title: Text(productList[i].prayer_type),
          trailing: Text(productList[i].times.toString()),

        ),
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}