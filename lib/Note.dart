import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper.dart';
import 'package:hive_flutter/adapters.dart';

class Note extends StatefulWidget {
  const Note({super.key});

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  final _controller = TextEditingController();
  bool _isloading = false;
  final _key = GlobalKey<FormState>();
 @override
  void didChangeDependencies()async {
    _isloading=true;
  await Helper.getnote();
  _isloading=false;
  setState(() {
    
  });
    super.didChangeDependencies();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Form(
                key: _key,
                child: AlertDialog(
                  title: Text("add note"),
                  content: TextFormField(
                    controller: _controller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "should enter text";
                      }
                    },
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      child: Text('add'),
                      onPressed: () {
                        _key.currentState!.validate();
                        if (_controller.text.isNotEmpty) {
                          Helper.addnote(_controller.text);
                          setState(() {
                            Navigator.of(context).pop();
                            _controller.text = "";
                          });
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          "Note app",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Helper.deleteall();
              setState(() {});
            },
            child: Text(
              "clear all",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ],
      ),

      body:_isloading 
      ?Center(child: CircularProgressIndicator())
       :ListView.builder(
        itemCount: Helper.items.length,

        itemBuilder: (context, index) => Stack(
          children: [
            InkWell(
              onTap: () {
                _controller.text = Helper.items[index];
                showDialog(
                  context: context,
                  builder: (context) {
                    return Form(
                      key: _key,
                      child: AlertDialog(
                        title: Text("update"),
                        content: TextFormField(
                          controller: _controller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "should enter text";
                            }
                          },
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            child: Text('update'),
                            onPressed: () {
                              _key.currentState!.validate();
                              if (_controller.text.isNotEmpty) {
                                Helper.update(index,_controller.text);
                                setState(() {
                                  Navigator.of(context).pop();
                                  _controller.text = "";
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                margin: EdgeInsets.all(14),
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: index == 0
                      ? const Color.fromARGB(255, 173, 113, 133).withOpacity(.5)
                      : index % 2 == 0
                      ? const Color.fromARGB(255, 149, 32, 71).withOpacity(.5)
                      : const Color.fromARGB(255,209,166,181,).withOpacity(.5),
                ),
                child: Center(
                  child: Text(
                    Helper.items[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Helper.deletenote(index);
                setState(() {});
              },
              icon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.delete),
              ),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
