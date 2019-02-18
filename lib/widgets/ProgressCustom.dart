import 'package:flutter/material.dart';


class ProgressCustom extends StatefulWidget 
{
	@override
	_ProgressCustomState createState() => _ProgressCustomState();
}

class _ProgressCustomState extends State<ProgressCustom> 
{
	@override
	Widget build(BuildContext context) 
	{
		return SizedBox(
			height: 500,
			child: Center(
				child: CircularProgressIndicator(
					valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)
				)
			),
		);
	}
}

