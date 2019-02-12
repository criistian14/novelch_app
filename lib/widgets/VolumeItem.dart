import 'package:flutter/material.dart';


// Models
import 'package:light_novel/models/Volume.dart';


class VolumeItem extends StatefulWidget 
{
	final Volume volume;

	VolumeItem({ this.volume });

	@override
	_VolumeItemState createState() => _VolumeItemState();
}


class _VolumeItemState extends State<VolumeItem> 
{
	void _showChapters()
	{
		
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