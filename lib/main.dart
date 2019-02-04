import 'package:flutter/material.dart';


// Screens
import 'package:light_novel/screens/home.dart';
import 'package:light_novel/screens/categories.dart';
import 'package:light_novel/screens/search.dart';
import 'package:light_novel/screens/account.dart';




class MyApp extends StatefulWidget 
{
	@override
	_MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> 
{
	final routes = <String, WidgetBuilder> {
		Home().tag: (BuildContext context) => Home(),
		Categories().tag: (BuildContext context) => Categories(),
		Search().tag: (BuildContext context) => Search(),
		Account().tag: (BuildContext context) => Account()
	};

	

	ThemeData theme()
	{
		return ThemeData(
			primaryColor: Colors.blue[800],
			accentColor: Colors.amber,
			accentTextTheme: Theme.of(context).accentTextTheme.apply(
				bodyColor: Colors.blueGrey[300],
			)
		);
	} 


	

	int _selectedIndex = 0;

	final _pages = [
		Home(),
		Categories(),
		Search(),
		Account()
	];

	void _onItemTapped(int index)
	{
		setState(() {
			_selectedIndex = index;		  
		});
	}



	GestureDetector _itemBottom(String tooltip, IconData icon, int index)
	{
		return GestureDetector(
			onTap: () => _onItemTapped(index),
			child: Tooltip( 
				message: tooltip,
				child: Padding(
					padding: EdgeInsets.all(10),
					child: Icon(icon, size: 27, color: (index != _selectedIndex
						? Colors.blueGrey
						: Theme.of(context).primaryColor), 
					)
				)
			)
		);
	}




	@override
	Widget build(BuildContext context) 
	{
		return MaterialApp(
			debugShowCheckedModeBanner: false,
			routes: routes,
			home: Scaffold(
				body: _pages.elementAt(_selectedIndex),
				floatingActionButton: FloatingActionButton(
					onPressed: () {},
					backgroundColor: Theme.of(context).primaryColor,
					tooltip: 'Continue Reading',
					child: Icon(Icons.import_contacts, color: Colors.white, size: 30),
				),
				floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
				bottomNavigationBar: BottomAppBar(
					shape: CircularNotchedRectangle(),
					notchMargin: 4,
					child: Container(
						padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
						child: Row(
							mainAxisAlignment: MainAxisAlignment.spaceBetween,
							children: <Widget>[

								_itemBottom('Home', Icons.home, 0),

								_itemBottom('Categories', Icons.local_offer, 1),


								SizedBox(),


								_itemBottom('Search', Icons.search, 2),

								_itemBottom('Account', Icons.person, 3),



							],
						),
					)
				),
			),
			theme: theme(),
		);
	}
}



void main() => runApp(MyApp());