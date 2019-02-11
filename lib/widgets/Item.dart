import 'package:flutter/material.dart';


// Screen
import 'package:light_novel/screens/info_light_novel.dart';


// Models
import 'package:light_novel/models/LightNovel.dart';


// id: id,
// 				name: name, 
// 				author: author,
// 				description: description, 
// 				thumbnail: thumbnail


class Item extends StatefulWidget 
{
	final LightNovel lightNovel;

	Item({ this.lightNovel });


	@override
	_ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> 
{

	void _showInfo()
	{
		Navigator.of(context).push(MaterialPageRoute(
			builder: (context) => InfoLightNovel(
				lightNovel: widget.lightNovel,
			),
		));
	}



	@override
	Widget build(BuildContext context) 
	{
		return SizedBox(
			height: 260,
			child: Stack(
			  	children: <Widget>[

					Positioned(
						right: 0,
						child: SizedBox(
							width: MediaQuery.of(context).size.width / 2,
							height: 230,
							child: ClipRRect(
								borderRadius: BorderRadius.all(Radius.circular(10)),
								child: FadeInImage.assetNetwork(
									placeholder: 'lib/assets/images/ounq1mw5kdxy.gif',
									fadeInCurve: Curves.easeIn,
									fadeInDuration: Duration(seconds: 1),
									image: widget.lightNovel.thumbnail, 
									fit: BoxFit.cover,
								)
							),
						)
					),


					Positioned(
						top: 35,
						child: SizedBox(
							height: 150,
							width: MediaQuery.of(context).size.width / 2.3,
							child: Material(
								elevation: 4,
								borderRadius: BorderRadius.all(Radius.circular(10)),
								child: Padding(
									padding: const EdgeInsets.symmetric(horizontal: 18),
									child: Column(
										// crossAxisAlignment: CrossAxisAlignment.center,
										mainAxisAlignment: MainAxisAlignment.center,
										children: <Widget>[


											SizedBox(
												width: MediaQuery.of(context).size.width / 2,
												child: Text(widget.lightNovel.name, style: TextStyle(
													fontWeight: FontWeight.bold,
													fontSize: 16,
												)),
											),



											SizedBox(height: 15),

											SizedBox(
												width: MediaQuery.of(context).size.width / 2,
												child: Text('By ${widget.lightNovel.author}', style: TextStyle(
													color: Colors.blueGrey[300],
													fontSize: 13,
												)) 
											),



											SizedBox(height: 15),

											Row(
												mainAxisAlignment: MainAxisAlignment.spaceBetween,
												children: <Widget>[
													Text('${widget.lightNovel.views} Views', style: TextStyle(
														color: Theme.of(context).primaryColor,
														fontSize: 13
													)),
													GestureDetector(
														onTap: _showInfo,
														child: Icon(Icons.keyboard_arrow_right, color: Colors.blueGrey[300])
													)
												],
											)


										],
									),
								),
							),
						)
					)
					

			  		
				],
			),
		);
	}
}
