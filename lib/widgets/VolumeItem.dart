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
	@override
	Widget build(BuildContext context) 
	{
		return ClipRRect(
			borderRadius: BorderRadius.all(Radius.circular(10)),
			child: Image.network(
				widget.volume.thumbnail,
				fit: BoxFit.cover,
				alignment: Alignment.center,
			),
		);
	}
}