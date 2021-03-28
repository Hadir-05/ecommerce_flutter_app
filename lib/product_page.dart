import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Product.dart';

class ProductsPage extends StatefulWidget {
  ProductsPage({
    Key key,
  }) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<Products> products = [];

  final String baseUrl = "http://10.0.2.2:8080";

  void _fetchDataFromTheServer() async {
    final Dio dio = new Dio();

    try {
      var response = await dio.get("$baseUrl/TP1/myrest/produits/products");
      print(response.statusCode);
      print(response.data);
      var responseData = response.data as List;

      setState(() {
        products = responseData.map((e) => Products.fromJson(e)).toList();
      });
    } on DioError catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ...products.map(
            (products) => ListTile(
              leading: Container(
                height: 50,
                width: 50,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("${products.libelle} ${products.description}"),
                  Text(
                    "${products.prix}",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 7,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchDataFromTheServer,
        tooltip: 'Fetch Data',
        child: Icon(Icons.cloud_download),
      ),
    );
  }
}
