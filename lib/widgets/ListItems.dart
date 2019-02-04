import 'package:flutter/material.dart';


// Widgets
import 'package:light_novel/widgets/Item.dart';



class ListItems extends StatefulWidget 
{
	final List list;

	ListItems({ @required this.list });

	@override
	_ListItemsState createState() => _ListItemsState();
}


class _ListItemsState extends State<ListItems> 
{
	@override
	Widget build(BuildContext context) 
	{
		print(widget.list.length);

		return ListView.builder(
			padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
			shrinkWrap: true,
			physics: NeverScrollableScrollPhysics(),
			itemCount: widget.list.length,
			itemBuilder: (BuildContext context, int index) => Item(
				id: widget.list[index].id, 
				views: widget.list[index].views,
				name: widget.list[index].name,
				author: widget.list[index].author,				 
				description: widget.list[index].description,
				thumbnail: widget.list[index].thumbnail
			),
		);
	}
}