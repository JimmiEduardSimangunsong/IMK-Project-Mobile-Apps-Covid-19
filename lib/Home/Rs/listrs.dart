import 'package:appscovid/Services/listrs.dart';
import 'package:flutter/material.dart';

class ListRs extends StatefulWidget {
  @override
  _ListRsState createState() => _ListRsState();
}

class _ListRsState extends State<ListRs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(71, 63, 151, 1),
        toolbarHeight: 60,
        title: const Text('Rumah Sakit Rujukan Covid-19'),
        actions: [IconButton(icon: Icon(Icons.sync), onPressed: () {})],
      ),
      body: FutureBuilder<dynamic>(
          future: ListRS.connectToAPI(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("LOADING DATA"),
                    ],
                  ),
                ],
              ));
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return Card(
                      shadowColor: Colors.black,
                      color: Colors.green[300],
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(8),
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            snapshot.data[i].name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        subtitle: Text(snapshot.data[i].region,
                            style: const TextStyle(fontSize: 12)),
                        trailing: Text(
                          snapshot.data[i].province,
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 15),
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
