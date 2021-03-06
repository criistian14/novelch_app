import 'package:flutter/material.dart';


// Services
import 'package:light_novel/services/HttpHandler.dart';
import 'package:shared_preferences/shared_preferences.dart';


// Widgets
import 'package:light_novel/widgets/ProgressCustom.dart';


// Models
import 'package:light_novel/models/LightNovel.dart';
import 'package:light_novel/models/Volume.dart';
import 'package:light_novel/models/Chapter.dart';



class ReadChapter extends StatefulWidget 
{
	final LightNovel lightNovel;
	final Volume volume;
	final Chapter chapter;
	final String url;


	ReadChapter({ this.lightNovel, this.volume, this.chapter, this.url });


	@override
	_ReadChapterState createState() => _ReadChapterState();
}



class _ReadChapterState extends State<ReadChapter> 
{
	ScrollController _scrollController;
	Chapter _chapter;
	String _name;
	double _position;
	SharedPreferences prefs;
	bool isChange;


	@override
	void initState() 
	{ 
	 	super.initState();

		_name = '';
	  	_position = 0;
		isChange = false;
		_scrollController = ScrollController(initialScrollOffset: 0);

		_loadData();
	}




	@override
	void dispose() 
	{ 
		prefs.setDouble('position', _position);

		super.dispose();
	}

	
	_loadData() async
	{
		prefs = await SharedPreferences.getInstance();

		prefs.setString('url', url());


		setState(() {
			_position = prefs.getDouble('position');	
		});


		_scrollController.addListener(() {			
			_position = _scrollController.offset;
		});
	}





	String url()
	{
		if (widget.url == null) {

			return '/light-novel/${widget.lightNovel.id}/${widget.volume.id}/${widget.chapter.id}';
		} else {

			return widget.url;
		}

	}




	_getBody() async
	{
		var response = await HttpHandler().getJson(url());

		_chapter = Chapter.fromJson(response['data']['volumes'][0]['chapters'][0]);


		if (mounted) {
			setState(() {
				_name = _chapter.name;
			});
		}


		if (!isChange) {
			_scrollController.animateTo(
				_position, 
				duration: Duration(seconds: 1), 
				curve: Curves.easeIn
			);

			setState(() {
				isChange = true;
			});
		}



		return true;
	}




	String _getName()
	{
		if (widget.chapter != null) {

			return widget.chapter.name;
		} else {

			return _name;
		}
	}


	Container _body()
	{
		return Container(
			padding: EdgeInsets.symmetric(horizontal: 17, vertical: 25),
			child: Text(_chapter.body, style: TextStyle(
				fontSize: 18,
				height: 1.4,
				fontWeight: FontWeight.w500,
				color: Colors.blueGrey
			)),
		);
	}


	@override
	Widget build(BuildContext context) 
	{
		return Scaffold(
			body: CustomScrollView(
				controller: _scrollController,
				slivers: <Widget>[
					SliverAppBar(
						expandedHeight: 60,
						floating: true,
						title: Text(_getName(), style: TextStyle(
							color: Colors.white
						)),
						leading: GestureDetector(
							onTap: () => Navigator.of(context).pop(),
							child: Icon(Icons.chevron_left, color: Colors.white, size: 30),
						),
					),


					SliverList(
						delegate: SliverChildListDelegate([
							FutureBuilder(
								future: _getBody(),
								builder: (context, snapshot)
								{
									if (snapshot.hasError) print(snapshot.error);

									return (snapshot.hasData)
										? _body()
										: ProgressCustom();
								},
							),
						]),
					)
					
				],
			),
		);
	}
}