import 'package:flutter/material.dart';


// Widgets
import 'package:light_novel/widgets/VolumeItem.dart';


// Models
import 'package:light_novel/models/LightNovel.dart';


class ListVolumes extends StatefulWidget 
{
	final LightNovel lightNovel;
	final List list;

	ListVolumes({ this.list, this.lightNovel });


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
					itemCount: widget.list.length,
					gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
						crossAxisCount: (orientation == Orientation.portrait ? 2 : 3),
						childAspectRatio: 4 / 5.5,
						mainAxisSpacing: 15,
						crossAxisSpacing: 13
					),
					itemBuilder: (BuildContext context, int index) => VolumeItem(
						volume: widget.list[index],
						lightNovel: widget.lightNovel,
					),
				);
			}
		);
	}
}