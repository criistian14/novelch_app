import 'package:flutter/material.dart';


// Widgets
import 'package:light_novel/widgets/Volume.dart';



class ListVolumes extends StatefulWidget 
{
	@override
	_ListVolumesState createState() => _ListVolumesState();
}


class _ListVolumesState extends State<ListVolumes> 
{
	@override
	Widget build(BuildContext context) 
	{
		return OrientationBuilder(
			builder: (BuildContext context, Orientation orientation) 
			{
				return GridView.builder(
					itemCount: 7,
					gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
						crossAxisCount: (orientation == Orientation.portrait ? 2 : 3),
						childAspectRatio: 4 / 5.5,
						mainAxisSpacing: 15,
						crossAxisSpacing: 13
					),
					itemBuilder: (BuildContext context, int index) => Volume(),
				);
			}
		);
	}
}