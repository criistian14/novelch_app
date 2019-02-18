import 'package:flutter/material.dart';



// Screen
import 'package:light_novel/screens/read_chapter.dart';


// Models
import 'package:light_novel/models/LightNovel.dart';
import 'package:light_novel/models/Volume.dart';
import 'package:light_novel/models/Chapter.dart';



class ChapterItem extends StatefulWidget 
{
	final LightNovel lightNovel;
	final Volume volume;
	final Chapter chapter;

	ChapterItem({ this.lightNovel, this.volume, this.chapter });

	@override
	_ChapterItemState createState() => _ChapterItemState();
}


class _ChapterItemState extends State<ChapterItem> 
{
	void _readChapter()
	{
		Navigator.of(context).push(MaterialPageRoute(
			builder: (context) => ReadChapter(
				lightNovel: widget.lightNovel,
				volume: widget.volume,
				chapter: widget.chapter,
			)
		));
	}


	@override
	Widget build(BuildContext context) 
	{
		return GestureDetector(
			onTap: _readChapter,
			child: Container(
				height: 75,
				margin: EdgeInsets.only(bottom: 5),
				child: Card(
					child: Padding(
						padding: EdgeInsets.symmetric(horizontal: 15),
						child: Row(
							mainAxisAlignment: MainAxisAlignment.spaceBetween,
							children: <Widget>[
								Text(widget.chapter.name, style: TextStyle(
									fontWeight: FontWeight.bold,
									fontSize: 18
								)),
								Icon(Icons.keyboard_arrow_right, color: Colors.blueGrey[300]),
							],
						),
					)
				),
			)
		);
	}
}