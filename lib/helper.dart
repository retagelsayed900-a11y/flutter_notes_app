
import 'package:hive_flutter/adapters.dart';

class Helper{
  static const notebox="Note_Box";
  static const notekey="Note_Key";
  static List<String>items=[];

static  Future<void> getnote() async{
  Future.delayed(Duration(seconds: 1));
  items= await Hive.box(notebox).get(notekey)??[];
}

static void addnote(String note)async
{
          items.add(note);
await Hive.box("Note_Box").put(notekey, items);
}


  static void deletenote(int index)async
{
    items.removeAt(index);     
await Hive.box("Note_Box").put(notekey, items);
}
  static void update(int index,String text)async
{
      Helper.items[index] = text;    
await Hive.box("Note_Box").put(notekey, items);
}
static void deleteall()async
{
     Helper.items = [];   
await Hive.box("Note_Box").put(notekey, items);
}
}
