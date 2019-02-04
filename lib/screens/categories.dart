import 'package:flutter/material.dart';


class Categories extends StatefulWidget 
{
	final String tag = '/categories';

	@override
	_CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> 
{



	@override
	Widget build(BuildContext context) 
	{
		return Scaffold(
			body: Center(child: Text('Categories'),),
		);
	}
}