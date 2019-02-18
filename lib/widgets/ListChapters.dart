import 'package:flutter/material.dart';


// Widgets
import 'package:light_novel/widgets/ChapterItem.dart';


// Models
import 'package:light_novel/models/LightNovel.dart';
import 'package:light_novel/models/Volume.dart';


class ListChapters extends StatefulWidget 
{
	final LightNovel lightNovel;
	final Volume volume;
	final List chpaters;

	ListChapters({ this.chpaters, this.lightNovel, this.volume });


	@override
	_ListChaptersState createState() => _ListChaptersState();
}



class _ListChaptersState extends State<ListChapters> 
{
	@override
	Widget build(BuildContext context) 
	{
		return ListView.builder(
			// padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
			shrinkWrap: true,
			physics: NeverScrollableScrollPhysics(),
			itemCount: widget.chpaters.length,
			itemBuilder: (BuildContext context, int index) => ChapterItem(
				chapter: widget.chpaters[index],
				lightNovel: widget.lightNovel,
				volume: widget.volume,
			),
		);
	}
}