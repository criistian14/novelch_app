import 'package:flutter/material.dart';


// Screen
import 'package:light_novel/screens/show_chapters.dart';



// Models
import 'package:light_novel/models/Volume.dart';
import 'package:light_novel/models/LightNovel.dart';



class VolumeItem extends StatefulWidget 
{
	final LightNovel lightNovel;
	final Volume volume;
 
	VolumeItem({ this.lightNovel, this.volume });

	@override
	_VolumeItemState createState() => _VolumeItemState();
}


class _VolumeItemState extends State<VolumeItem> 
{
	void _showChapters()
	{
		Navigator.of(context).push(MaterialPageRoute(
			builder: (context) => ShowChapters(
				lightNovel: widget.lightNovel,
				volume: widget.volume,
			)
		));
	}


	@override
	Widget build(BuildContext context) 
	{
		return GestureDetector(
			onTap: _showChapters,
			child: ClipRRect(
				borderRadius: BorderRadius.all(Radius.circular(10)),
				child: FadeInImage.assetNetwork(
					placeholder: 'lib/assets/images/ounq1mw5kdxy.gif',
					fadeInCurve: Curves.easeIn,
					fadeInDuration: Duration(seconds: 1),
					image: widget.volume.thumbnail, 
					fit: BoxFit.cover,
				)
			)
		);
	}
}