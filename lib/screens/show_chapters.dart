import 'package:flutter/material.dart';


// Widgets
import 'package:light_novel/widgets/ListChapters.dart';
import 'package:light_novel/widgets/ProgressCustom.dart';


// Services
import 'package:light_novel/services/HttpHandler.dart';


// Models
import 'package:light_novel/models/LightNovel.dart';
import 'package:light_novel/models/Volume.dart';
import 'package:light_novel/models/Chapter.dart';


class ShowChapters extends StatefulWidget 
{
	final LightNovel lightNovel;
	final Volume volume;


	ShowChapters({ this.lightNovel, this.volume });


	@override
	_ShowChaptersState createState() => _ShowChaptersState();
}


class _ShowChaptersState extends State<ShowChapters> 
{
	String url() => '/light-novel/${widget.lightNovel.id}/${widget.volume.id}';
	List<Chapter> chapters;

	getChapters() async
	{
		chapters = new List();

		var response = await HttpHandler().getJson(url());


		for (var i = 0; i < response['data']['volumes'][0]['chapters'].length; i++) {

			Chapter chapterTemp = Chapter.fromJson(response['data']['volumes'][0]['chapters'][i]);

			chapters.add(chapterTemp);
		}

		return true;
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
					future: getChapters(),
					builder: (context, snapshot)
					{
						if (snapshot.hasError) print(snapshot.error);

						return (snapshot.hasData)
							? ListChapters(chpaters: chapters, lightNovel: widget.lightNovel, volume: widget.volume,)
							: ProgressCustom();
					},
				)
			)
		);
	}
}
