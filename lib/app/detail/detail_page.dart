import 'package:flutter/material.dart';
import 'package:revenda_gas/app/components/bullet.dart';
import 'package:revenda_gas/globals.dart';

class DetailPage extends StatefulWidget {
  static String routerName = '/detail';

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var appBar = AppBar(
    title: Text('Selecionar Produtos'),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          '?',
          style: TextStyle(fontSize: 30),
        ),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.grey[200],
      body: Container(
        width: mediaQuery.size.width,
        height: mediaQuery.size.height -
            appBar.preferredSize.height -
            mediaQuery.padding.top,
        child: Column(
          children: <Widget>[
            _buildTitle(),
            _buildSubTitle(),
            _buildContent(),
            Expanded(
              child: SizedBox(),
            ),
            _buildButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      padding: EdgeInsets.all(30),
      margin: EdgeInsets.only(bottom: 2),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300],
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Bullet(label: 'Comprar', enabled: true),
          Expanded(
            child: Column(
              children: [
                Divider(color: Colors.grey),
                SizedBox(height: 25),
              ],
            ),
          ),
          const Bullet(label: 'Pagamento', enabled: false),
          Expanded(
            child: Column(
              children: [
                Divider(color: Colors.grey),
                SizedBox(height: 25),
              ],
            ),
          ),
          const Bullet(label: 'Confirmação', enabled: false),
        ],
      ),
    );
  }

  Widget _buildSubTitle() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(child: Text('1')),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('Supergasbras - Botijão de 13Kg'),
            ),
          ),
          RichText(
            text: TextSpan(style: TextStyle(color: Colors.black), children: [
              TextSpan(
                text: 'R\$',
                style: TextStyle(fontSize: 10),
              ),
              TextSpan(
                text: '73,99',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.home,
                  size: 40,
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Chama Gás'),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('5,0'),
                          SizedBox(width: 5),
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 10,
                          ),
                          Expanded(
                            child: Text(
                              '15-30 min', 
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      color: Colors.orange,
                      child: Text('Supergasbras'),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'aberto até às 17:40',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text('Botijão de 13Kg'),
                      SizedBox(height: 5),
                      Text('Supergasbras'),
                      SizedBox(height: 5),
                      RichText(
                        text: TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: 'R\$',
                                style: TextStyle(fontSize: 10),
                              ),
                              TextSpan(
                                text: '73,99',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.grey,
                        ),
                        child: Center(
                          child: Icon(Icons.remove),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(iconURI),
                          ),
                        ),
                        child: Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 12),
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.orange,
                            ),
                            child: Text('1'),
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.grey,
                        ),
                        child: Center(
                          child: Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 50),
      child: RaisedButton(
        onPressed: () {},
        textColor: Colors.white,
        padding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Container(
          width: 250,
          height: 80,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue[300], Colors.blue[700]],
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              'IR PARA O PAGAMENTO',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
        ),
      ),
    );
  }
}
