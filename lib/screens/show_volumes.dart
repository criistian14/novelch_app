import 'package:flutter/material.dart';
import 'package:light_novel/services/HttpHandler.dart';



// Widgets
import 'package:light_novel/widgets/ListVolumes.dart';



class ShowVolumes extends StatefulWidget 
{
	final int id;

	ShowVolumes({ this.id });


	@override
	_ShowVolumesState createState() => _ShowVolumesState();
}


class _ShowVolumesState extends State<ShowVolumes> 
{

	List<LightNovel> lightNovels;


	getVolumes() async
	{
		lightNovels = new List();

		var response = await HttpHandler().getJson('/light-novel/${widget.id}');

		var datos = (response['data'] as List).map((e) => e).toList();

		for (var i = 0; i < datos.length; i++) {

			LightNovel lightTemp = LightNovel(
				name: datos[i]['name'],
				author: datos[i]['author'],
				description: datos[i]['description'],
				thumbnail: datos[i]['thumbnail'],
				views: datos[i]['views'],
				id: datos[i]['id'],
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
			appBar: AppBar(
				backgroundColor: Colors.white12,
				elevation: 0,
				leading: GestureDetector(
					onTap: () => Navigator.of(context).pop(),
					child: Icon(Icons.chevron_left, color: Colors.black, size: 30),
				),
			),

			body: Padding(
				padding: EdgeInsets.symmetric(horizontal: 25),
				child: FutureBuilder(
								future: getVolumes(),
								builder: (context, snapshot)
								{
          							if (snapshot.hasError) print(snapshot.error);

									return (snapshot.hasData)
										? ListVolumes()
										: _progress();


								},
							)
			)
		);
	}
}
