import 'package:flutter/material.dart';


enum Type { female, male }

class Calc extends StatefulWidget {
  const Calc({super.key});

  @override
  State<Calc> createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  Type type=Type.female;
  double height=50;
  int r=0;
  int a=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  
                  child: InkWell(
                    onTap: () {
                      type=Type.female;
                      setState(() {
                        
                      });
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          "female",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      height: 150,
                      decoration: BoxDecoration(
                        color: type==Type.female?
                       Colors.blueGrey
                        : const Color.fromARGB(255, 12, 80, 135),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      type=Type.male;
                      setState(() {
                        
                      });
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          "male",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      height: 150,
                      decoration: BoxDecoration(
                        color:type==Type.male?
                            Colors.blueGrey
                        : const Color.fromARGB(255, 12, 80, 135),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
        SizedBox(height: 30,),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 11, 70, 119)
            ),
            child: Column(
              
              children: [
                Text("Height",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                
                Padding(
                  padding: const EdgeInsets.only(left: 125.0),
                  child: Row(
                    children: [
                      Text(height.toInt().toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),),
                          Text("cm"),
                    ],
                  ),
                ),
                
                Slider(
                  min: 30,
                  max: 220,
                  value: height, 
                onChanged: (Value){
                  height=Value;
                  setState(() {

                  });
                },),
               
              ],
            
            ),
          )
         , SizedBox(height: 20,),
          Row(
            children: [
            Expanded(
              child: Container(
                  height: 200,
                 
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),color:const Color.fromARGB(255, 3, 85, 136),
                    
                  ),
                
                    child:  Column(
                        children: [
                          Text("Weight",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        
                      
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0),
                        child: Row(
                           children: [
                             Text(r.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),),
                             Text("kg"),
                             
                           ],
                         ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          
                          FloatingActionButton(onPressed: (){
                          ++r;
                          setState(() {
                            
                          });
                                  },
                                
                                  backgroundColor: const Color.fromARGB(55, 162, 168, 214),
                               shape: CircleBorder(),
                                  child: Icon(Icons.add
                                  ,color: Colors.white,),
                                  ),
                           Spacer(),  
                           FloatingActionButton(onPressed: (){
                          --r;
                          setState(() {
                            
                          });
                                  },
                                
                                  backgroundColor: const Color.fromARGB(55, 162, 168, 214),
                               shape: CircleBorder(),
                                  child: Icon(Icons.remove
                                  ,color: Colors.white,),
                                  ),
                           
                        ],
                      ),
                    )
                      
              ],
                    
                  ),
              ),
            ),
            SizedBox(width: 20 ,),
            Expanded(
              child: Container(
                  height: 200,
               
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),color:const Color.fromARGB(255, 4, 77, 134),
                    
                  ),
                
                    child:  Column(
                        children: [
                          Text("Age",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        
                      
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0),
                        child: Row(
                           children: [
                             Text(a.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),),
                             Text("kg"),
                             
                           ],
                         ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          
                          FloatingActionButton(onPressed: (){
                          ++a;
                          setState(() {
                            
                          });
                                  },
                                
                                  backgroundColor: const Color.fromARGB(55, 162, 168, 214),
                               shape: CircleBorder(),
                                  child: Icon(Icons.add
                                  ,color: Colors.white,),
                                  ),
                           Spacer(),  
                           FloatingActionButton(onPressed: (){
                          --a;
                          setState(() {
                            
                          });
                                  },
                                
                                  backgroundColor: const Color.fromARGB(55, 162, 168, 214),
                               shape: CircleBorder(),
                                  child: Icon(Icons.remove
                                  ,color: Colors.white,),
                                  ),
                           
                        ],
                      ),
                    )
                      
              ],
                    
                  ),
              ),
            ),
            ],
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: (){
               var result = "";
        double bmi = (r) / (height * height / 10000);

        if (bmi < 18.5) {
          result = "Underweight";
        } else if (bmi < 24.9) {
          result = "Healthy weight";
        } else if (bmi < 29.9) {
          result = "Overweight";
        } else {
          result = "Obese";
        }

          AlertDialog alert = AlertDialog(
    title: Text("your BMI"),
    content: Text("your BMI is ${bmi.toInt()} you are $result"),
  
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12)
                ,color: const Color.fromARGB(255, 4, 66, 117),
              ),
                    
                    width: double.infinity,
                    height: 35,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: Text("CALCULATE BMI",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                      
                    ),
                  ),
          )
          ],
       
        ),
      ),
    );
  }
}
