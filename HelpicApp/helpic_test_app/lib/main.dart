import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() => runApp(MobileApp());

class MobileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Helpic",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final Color accentColor = Color(0XFFFA2B0F);
  List<ItemModel> items = [
    ItemModel("Conheça a Ferramenta", "Bem-vindo ao Hepic!"),
    ItemModel("Primeiros Passos", "Veja este guia e domine o Helpic!")
  ];

  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  Widget _buildTitle() {
    return Text ("Inicio",
      style: TextStyle(
        color: Colors.white,
        fontSize: 40,
        fontWeight: FontWeight.bold
      ),
    );
  }

  IconButton _buildButton(IconData icon){
    return IconButton(
      onPressed: (){},
      icon: Icon(icon, color: Colors.white,),
    );
  }

  Widget _builderBottomCardChildren() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container (height: 32,),
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildButton(Icons.radio_button_unchecked),
          _buildButton(Icons.home),
          _buildButton(Icons.photo_camera),
         ],
        )
      ],
    );
  }

  Widget _buildBottomCard(double width, double height){
    return Container(
      width: width,
      height: height/3,
      padding: EdgeInsets.fromLTRB(16, 0, 12, 16),
        decoration: BoxDecoration(
            color: Color(0XFFf26954),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(45),
              topLeft: Radius.circular(45),
            )
        ),
        child: _builderBottomCardChildren(),
    );
  }

  Widget _buildItemCardChild (ItemModel item){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(item.title, style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
                ),
              ),
            Text (item.desc.toString(), style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
            )
          ],
        )
      ],
    );
  }

  Widget _buildCardItem(ItemModel item){
    return Container (
      width: 70,
      height: 100,
      padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
      margin: EdgeInsets.only(left: 32, right: 32, top: 4, bottom: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5
          )
        ]
      ),
      child: _buildItemCardChild ( item)
    );
  }

  Widget _buildCardsList(){
    return ListView.builder(
      itemCount: items.length,
        itemBuilder: (context, index){
        var item = items.elementAt(index);
          return _buildCardItem(item);
          },
    );
  }


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black54,
        title: _buildTitle(),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications,
              color: Colors.blueGrey,),
            onPressed: () {},
          )
        ],
      ),
      body: Stack (
          children: <Widget>[
            Align (
              alignment: Alignment.bottomCenter,
                child: _buildBottomCard(width, height)
            ),
            _buildCardsList(),
          ],
      ),
    );
  }
}

class ItemModel{
  final String title;
  final String desc;

  ItemModel(this.title, this.desc);

}