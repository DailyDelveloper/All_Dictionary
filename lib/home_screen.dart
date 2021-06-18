import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  List<String> entries = ['A', 'B', 'C'];
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text('All Dictionary'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            ListView.builder(
              padding: EdgeInsets.all(10.0),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: entries.length,
              itemBuilder: (context, int index) {
                return Container(
                  height: 40,
                  padding: EdgeInsets.all(5.0),
                  child: Center(
                    child: Text(entries[index]),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
