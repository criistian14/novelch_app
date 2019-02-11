import 'package:flutter/material.dart';


// Widgets
import 'package:light_novel/widgets/ListItems.dart';


// Services
import 'package:light_novel/services/HttpHandler.dart';


// Models
import 'package:light_novel/models/LightNovel.dart';



class Home extends StatefulWidget 
{
	final String tag = '/home';

	@override
	_HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> 
{
	List<LightNovel> lightNovels;


	getLightNovels() async
	{
		lightNovels = new List();

		var response = await HttpHandler().getJson('/light-novel');

		var datos = (response['data'] as List).map((e) => e).toList();

		for (var i = 0; i < datos.length; i++) {

			LightNovel lightTemp = LightNovel(
				name: datos[i]['name'],
				author: datos[i]['author'],
				description: datos[i]['description'],
				thumbnail: datos[i]['thumbnail'],
				views: datos[i]['views'],
				volumes: datos[i]['volumes'],
				id: datos[i]['_id'],
			);

			lightNovels.add(lightTemp);
		}

		return true;
	}


	SizedBox _progress()
	{
		return SizedBox(
			height: 500,
			child: Center(
				child: CircularProgressIndicator(
					valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)
				)
			),
		);
	}



	@override
	Widget build(BuildContext context) 
	{
		return Scaffold(
			body: CustomScrollView(
				slivers: <Widget>[
					// SliverAppBar(
					// 	floating: true,
					// 	title: Text('Browse', style: TextStyle(
					// 		color: Theme.of(context).accentColor,
					// 		fontSize: 25,
					// 		fontWeight: FontWeight.bold
					// 	),),
					// ),

					SliverList(
						delegate: SliverChildListDelegate([

							
							Padding(
								padding: EdgeInsets.only(top: 35, left: 25),
								child: SizedBox(
									height: 33,
									child: Row(
										crossAxisAlignment: CrossAxisAlignment.end,
										children: <Widget>[

											Text('Browse', style: TextStyle(
													fontSize: 32,
													fontWeight: FontWeight.bold
											)),

											SizedBox(width: 25),

											Text('Recommended', style: TextStyle(
													fontSize: 15,
													color: Colors.blueGrey[300],
													// fontWeight: FontWeight.bold
											)),
										],
									),
								)
							),
							

							FutureBuilder(
								future: getLightNovels(),
								builder: (context, snapshot)
								{
          							if (snapshot.hasError) print(snapshot.error);

									return (snapshot.hasData)
										? ListItems(list: lightNovels)
										: _progress();


								},
							)
						]),
					)
				],
			),

		);
	}
}