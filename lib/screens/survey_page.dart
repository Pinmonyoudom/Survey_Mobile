import 'package:flutter/material.dart';
import 'package:login/screens/survey_finish.dart';

class SurveyPage extends StatefulWidget {
  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  List<Animal> animals;
  Animal selectedAnimal;
  List<Fruit> fruits;
  Fruit selectedFruit;
  int selectedRadio;
  int selectedRadioTile;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    selectedRadioTile = 0;
    animals = Animal.getUsers();
    fruits = Fruit.getFruits();
  }

  setSelectedAnimal(Animal animal) {
    setState(() {
      selectedAnimal = animal;
    });
  }
  List<Widget> createRadioListAnimals() {
    List<Widget> widgets = [];
    for (Animal animal in animals) {
      widgets.add(
        RadioListTile(
          value: animal,
          groupValue: selectedAnimal,
          title: Text(animal.animal),
          onChanged: (currentAnimal) {
            setSelectedAnimal(currentAnimal);
          },
          selected: selectedAnimal == animal,
          activeColor: Colors.green,
        ),
      );
    }
    return widgets;
  }

  setSelectedFruit(Fruit fruit) {
    setState(() {
      selectedFruit = fruit;
    });
  }
  List<Widget> createRadioListFruits() {
    List<Widget> widgets = [];
    for (Fruit fruit in fruits) {
      widgets.add(
        RadioListTile(
          value: fruit,
          groupValue: selectedFruit,
          title: Text(fruit.fruit),
          onChanged: (currentFruit) {
            setSelectedFruit(currentFruit);
          },
          selected: selectedFruit == fruit,
          activeColor: Colors.green,
        ),
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Test Survey 1'),
        ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text("Which one of these is an animal?"),
            ),
            Column(
              children: createRadioListAnimals(),
            ),
            Divider(
              height: 20,
              color: Colors.green,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text("Which one of these is a fruit?"),
            ),
            Column(
              children: createRadioListFruits(),
            ),
            Divider(
              height: 20,
              color: Colors.green,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FlatButton(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 8, bottom: 8, left: 10, right: 10),
                  child: Text('Submit',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                color: Color(0xff01A0C7),
                disabledColor: Colors.grey,
                shape: new RoundedRectangleBorder(
                  borderRadius:
                  new BorderRadius.circular(32.0)),
                onPressed: () {
                  Navigator.push(context, new MaterialPageRoute(
                  builder: (context) => FinishSurvey()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Animal {
  int animalId;
  String animal;
 
  Animal({this.animalId, this.animal});
 
  static List<Animal> getUsers() {
    return <Animal>[
      Animal(animalId: 1, animal: "Car"),
      Animal(animalId: 2, animal: "Toy"),
      Animal(animalId: 3, animal: "House"),
      Animal(animalId: 4, animal: "Dog"),
      Animal(animalId: 5, animal: "Rock"),
    ];
  }
}
class Fruit {
  int fruitId;
  String fruit;
 
  Fruit({this.fruitId, this.fruit});
 
  static List<Fruit> getFruits() {
    return <Fruit>[
      Fruit(fruitId: 1, fruit: "banana"),
      Fruit(fruitId: 2, fruit: "broccoli"),
      Fruit(fruitId: 3, fruit: "broccoflower"),
      Fruit(fruitId: 4, fruit: "brussels sprouts"),
      Fruit(fruitId: 5, fruit: "cabbage"),
    ];
  }
}