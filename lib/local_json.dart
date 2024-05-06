import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_json_http/model/araba_model.dart';

class LocalJsonKullanimi  extends StatefulWidget {
  const LocalJsonKullanimi  ({super.key});

  @override
  State<LocalJsonKullanimi > createState() => _LocalJsonState();
}

class _LocalJsonState extends State<LocalJsonKullanimi > {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Json Islemleri'),
        backgroundColor: Colors.green,
      ),

      body: FutureBuilder<List<Araba>>(
        future: arabalarJsonOku(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            List<Araba> arabaListesi= snapshot.data!;

            return ListView.builder(itemCount: arabaListesi.length,
              itemBuilder: (context, index){
              Araba oankiAraba=arabaListesi[index];
              return ListTile(
                title: Text(oankiAraba.arabaAdi,
                style: const TextStyle(
                  fontWeight: FontWeight.w400
                ),
                ),
                subtitle: Text(oankiAraba.ulke,style: const TextStyle(
                  fontSize: 12,
                ),
                ),
                leading: CircleAvatar(
                  child: Text(oankiAraba.model[0].fiyat.toString(),
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.brown
                  ),
                  ),
                ),
              );
            });
          } else if (snapshot.hasError){
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

Future<List<Araba>> arabalarJsonOku() async{
 try{
   String okunanString = await DefaultAssetBundle.of(context).loadString('assets/data/arabalar.json');

   var jsonObject = jsonDecode(okunanString);
   List<Araba> tumArabalar=(jsonObject as List).map((arabaMap) => Araba.fromMap(arabaMap)).toList();

   return tumArabalar;
 }catch (e){
   return Future.error(e.toString());
 }
 }
}
