import 'package:flutter/material.dart';


// Widgets
import 'package:light_novel/widgets/ListVolumes.dart';


// Services
import 'package:light_novel/services/HttpHandler.dart';


// Models
import 'package:light_novel/models/LightNovel.dart';
import 'package:light_novel/models/Volume.dart';


class ShowVolumes extends StatefulWidget 
{
	final LightNovel lightNovel;

	ShowVolumes({ this.lightNovel });


	@override
	_ShowVolumesState createState() => _ShowVolumesState();
}


class _ShowVolumesState extends State<ShowVolumes> 
{

	List<Volume> volumes;

	getVolumes() async
	{
		volumes = new List();

		var response = await HttpHandler().getJson('/light-novel/${widget.lightNovel.id}');

		response['data'].map((m) => print(m));

		// var datos = (response['data'] as List<dynamic>).map((e) => e).toList();

		// for (var i = 0; i < datos.length; i++) {

		// 	Volume volumeTemp = Volume(
		// 		name: datos[i]['name'],
		// 		prev: datos[i]['prev'],
		// 		next: datos[i]['next'],
		// 		thumbnail: datos[i]['thumbnail'],
		// 		chapters: datos[i]['chapters']
		// 	);

		// 	volumes.add(volumeTemp);
		// }

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
