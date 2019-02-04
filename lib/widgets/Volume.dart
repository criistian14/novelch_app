import 'package:flutter/material.dart';


class Volume extends StatefulWidget 
{
	@override
	_VolumeState createState() => _VolumeState();
}


class _VolumeState extends State<Volume> 
{
	@override
	Widget build(BuildContext context) 
	{
		return ClipRRect(
			borderRadius: BorderRadius.all(Radius.circular(10)),
			child: Image.network(
				'http://www.wallpapermaiden.com/image/2019/01/16/neon-city-cyberpunk-warrior-sci-fi-futuristic-lights-sword-29239.jpeg',
				fit: BoxFit.cover,
				alignment: Alignment.center,
			),
		);
	}
}