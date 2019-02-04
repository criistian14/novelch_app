import 'package:flutter/material.dart';


class Search extends StatefulWidget 
{
	final String tag = '/search';

	@override
	_SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> 
{



	@override
	Widget build(BuildContext context) 
	{
		return Scaffold(
			body: Center(child: Text('Search'),),
		);
	}
}