import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('showModalBottomSheet'),
        onPressed: () {
          showModalBottomSheet<void>(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  toolbarHeight: 100,
                  title: const Text("Appbar"),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                body: const Center(
                  child: Text("Hi"),
                ),
              );
              //   GridView.count(
              //   crossAxisCount: 2,
              //   children: [
              //     Container(
              //       padding: const EdgeInsets.all(8),
              //       color: Colors.teal[100],
              //       child: const Text("He'd have"),
              //     ),
              //     Container(
              //       padding: const EdgeInsets.all(8),
              //       color: Colors.teal[200],
              //       child: const Text('Heed not '),
              //     ),
              //     Container(
              //       padding: const EdgeInsets.all(8),
              //       color: Colors.teal[300],
              //       child: const Text('Sound of'),
              //     ),
              //     Container(
              //       padding: const EdgeInsets.all(8),
              //       color: Colors.teal[100],
              //       child: const Text("He'd have"),
              //     ),
              //     Container(
              //       padding: const EdgeInsets.all(8),
              //       color: Colors.teal[200],
              //       child: const Text('Heed not '),
              //     ),
              //     Container(
              //       padding: const EdgeInsets.all(8),
              //       color: Colors.teal[300],
              //       child: const Text('Sound of'),
              //     ),
              //     ElevatedButton(
              //       child: const Text('Close'),
              //       onPressed: () => Navigator.pop(context),
              //     ),
              //   ],
              // );

              // return Column(
              //   // mainAxisAlignment: MainAxisAlignment.center,
              //   // mainAxisSize: MainAxisSize.min,
              //   children: <Widget>[
              //     GridView.count(
              //       primary: false,
              //       padding: const EdgeInsets.all(8),
              //       crossAxisSpacing: 2,
              //       mainAxisSpacing: 2,
              //       crossAxisCount: 2,
              //       children: <Widget>[
              //         Container(
              //           padding: const EdgeInsets.all(8),
              //           color: Colors.teal[100],
              //           child: const Text("He'd have you all unravel at the"),
              //         ),
              //         Container(
              //           padding: const EdgeInsets.all(8),
              //           color: Colors.teal[200],
              //           child: const Text('Heed not the rabble'),
              //         ),
              //         Container(
              //           padding: const EdgeInsets.all(8),
              //           color: Colors.teal[300],
              //           child: const Text('Sound of screams but the'),
              //         ),
              //         ElevatedButton(
              //           child: const Text('Close BottomSheet'),
              //           onPressed: () => Navigator.pop(context),
              //         ),
              //         // Container(
              //         //   padding: const EdgeInsets.all(8),
              //         //   color: Colors.teal[400],
              //         //   child: const Text('Who scream'),
              //         // ),
              //         // Container(
              //         //   padding: const EdgeInsets.all(8),
              //         //   color: Colors.teal[500],
              //         //   child: const Text('Revolution is coming...'),
              //         // ),
              //         // Container(
              //         //   padding: const EdgeInsets.all(8),
              //         //   color: Colors.teal[600],
              //         //   child: const Text('Revolution, they...'),
              //         // ),
              //       ],
              //     ),
              //   ],
              // );
            },
          );
        },
      ),
    );
  }
}
