import 'package:flutter/material.dart';
import 'package:inter_app/view.dart';


main() =>runApp(new MaterialApp(
  home: new AppList(),
));

class AppList extends StatefulWidget {
  @override
  //_AppListState createState() => _AppListState();
  State<AppList> createState(){
    return new AppListState ();
  }
}

class AppListState extends State<AppList> {
  List<String> Names = [
    'Recipeiente 1', 'Recipeiente 12', 'Recipeiente 123',
  ];

  @override
  Widget build(BuildContext context) {
    // static int CurrItem = 0;

    // static Scaffold getContent(BuildContext context, content) {


    return new Scaffold(
        appBar: AppBar(
            title: Text("Lista de Recipientes"),
            actions: _getActions(context)

          //<Widget>[
          //Padding(padding: EdgeInsets.only(right: 20),)
          //],
        ),
        body:
        new Center(
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width/1.2,
          margin: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            color: Colors.teal,

            borderRadius: BorderRadius.all(
              Radius.circular(10),

            ),
          ),
          child: Center(
            child: RaisedButton(


              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyPersonal()),
                );
              },
              color: Colors.transparent,
              focusColor: Colors.transparent,
              elevation: 0,




              child: Text(
                "Recipiente 1",
                style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),

        )


/*
        new Center(
            child: new Container(
                decoration: BoxDecoration(
                  color: Colors.white70,),
                child: new ListView.builder(
                  // reverse: true,
                  //itemBuilder: (_, int index) => EachList(this.List[index]),
                  //itemCount: this.Names.length,
                )
            )
        )*/
    );
  }

  static List<Widget> _getActions(context) {
    List<Widget> items = List<Widget>();

    //return items;
    TextEditingController _c = TextEditingController();


    items.add(
      GestureDetector(
        onTap: () {
          showDialog(context: context,
              //barrierDismissible: false,
              builder: (BuildContext outrocontexto) {
                final input = TextFormField(
                  controller: _c,
                  decoration: InputDecoration(
                      hintText: 'Nome',
                      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                  ),

                );

                return AlertDialog(
                  title: Text(' Adicione um Recipiente'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text('Nome do Recipiente: '),
                        input
                        //TextFormField()
                      ],
                    ),),
                  actions: <Widget>[
                    RaisedButton(
                      child: Text(
                        'Cancelar', style: TextStyle(color: Colors.white),),
                      onPressed: () {
                        Navigator.of(outrocontexto).pop();
                      },
                    ),
                    RaisedButton(
                      child: Text(
                        'Criar ', style: TextStyle(color: Colors.white),),
                      onPressed: () {
                        print(_c.text);
                        Navigator.of(outrocontexto).pop();
                      },
                    )
                  ],

                );
              }

          );
        },
        child: Icon(Icons.add),
      ),
    );
    items.add(Padding(padding: EdgeInsets.only(right: 20)));

    return items;
  }
}

class EachList extends StatelessWidget{
  final String name = 'ListPage';
  EachList();
  @override
  Widget build(BuildContext context) {
    final content = ListView(
      shrinkWrap: true,
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.pages),
          title: Text('First One'),
          subtitle: Text(('Exemplo')),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }
}
