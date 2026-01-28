import 'package:flutter/material.dart';
import 'package:hw_day8/service/api.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        backgroundColor: const Color.fromARGB(255, 157, 131, 201),
        leading: Icon(Icons.shopping_cart),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child:FutureBuilder(
          future: Api().getProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: LoadingAnimationWidget.progressiveDots(color: const Color.fromARGB(255, 40, 24, 86), size: 150)
              );
            }
            return GridView.builder(
              itemCount: snapshot.data?.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                return Container(
                  color: const Color.fromARGB(255, 191, 133, 185),
                  child: Column(
                    children: [
                      Image.network(snapshot.data![index].thumbnail ?? ""),
                      Text(snapshot.data![index].title!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}