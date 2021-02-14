import 'package:flutter/material.dart';
import 'package:revenda_gas/app/detail/detail_page.dart';
import 'package:revenda_gas/app/home/components/tag_best_price.dart';
import 'package:revenda_gas/app/model/resale_model.dart';
import 'package:revenda_gas/app/repositories/resale_repository.dart';
import 'package:revenda_gas/utils/formated_price.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = [
    'Melhor Avaliação',
    'Mais Rápido',
    'Mais Barato'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Escolha uma Revenda',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          PopupMenuButton(
              icon: Icon(
                Icons.swap_vert,
                size: 30,
              ),
              itemBuilder: (_) {
                return filters.map((f) {
                  return PopupMenuItem(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(f),
                        Checkbox(value: false, onChanged: (bool value) {}),
                      ],
                    ),
                  );
                }).toList();
              }),
          PopupMenuButton(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
              itemBuilder: (_) {
                return [
                  PopupMenuItem(
                    child: Text(
                      'Suporte',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  PopupMenuItem(
                    child: Text(
                      'Termos de serviço',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ];
              }),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Botijões de 13kg em:',
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                      Text(
                        'Av Paulista, 1001',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Paulista, São Paulo, SP',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Colors.blue,
                      size: 30,
                    ),
                    Text(
                      'Mudar',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: FutureBuilder<List<ResaleModel>>(
              future: ResaleRepository().serachAllResale(),
              builder: (_, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Container();
                    break;
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                    break;
                  case ConnectionState.active:
                  case ConnectionState.done:
                    var data = snapshot.data;
                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (_, index) {
                        return _buildRevenda(data[index]);
                      },
                    );
                    break;
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRevenda(ResaleModel resale) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context, 
        DetailPage.routerName, 
        arguments: resale
      ),
      child: Container(
        margin: EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: Row(
          children: <Widget>[
            Container(
              width: 40,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color(int.parse('FF${resale.color}', radix: 16)),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
              ),
              child: RotatedBox(
                child: Center(
                  child: Text(
                    resale.type,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                quarterTurns: -1,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 10, left: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5)),
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Text(resale.name)),
                          Visibility(
                            visible: resale.bestPrice,
                            child: TagBestPrice()
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Nota',
                                style:
                                    TextStyle(fontSize: 13, color: Colors.grey),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    resale.note.toString(),
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                'Tempo Médio',
                                style:
                                    TextStyle(fontSize: 13, color: Colors.grey),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              RichText(
                                text: TextSpan(
                                    style: TextStyle(color: Colors.black),
                                    children: [
                                      TextSpan(
                                        text: resale.averageTime,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text: 'min',
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.grey),
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Preço',
                                style:
                                    TextStyle(fontSize: 13, color: Colors.grey),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'R\$ ${formatedPrice(resale.price)}',
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
