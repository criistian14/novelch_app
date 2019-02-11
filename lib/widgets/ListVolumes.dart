import 'package:flutter/material.dart';


// Widgets
import 'package:light_novel/widgets/VolumeItem.dart';




class ListVolumes extends StatefulWidget 
{
	final List list;

	ListVolumes({ this.list });


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
					itemBuilder: (BuildContext context, int index) => VolumeItem(
						volume: widget.list[index],
					),
				);
			}
		);
	}
}