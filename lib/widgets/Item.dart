import 'package:flutter/material.dart';


// Screen
import 'package:light_novel/screens/info_light_novel.dart';



class Item extends StatefulWidget 
{
	final String name, author, thumbnail, description;
	final int id, views;

	Item({ this.name, this.author, this.description, this.thumbnail, this.views, this.id });


	@override
	_ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> 
{

	void _showInfo(int id, String name, String author, String description, String thumbnail)
	{
		Navigator.of(context).push(MaterialPageRoute(
			builder: (context) => InfoLightNovel(
				id: id,
				name: name, 
				author: author,
				description: description, 
				thumbnail: thumbnail
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
									image: widget.thumbnail, 
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
												child: Text(widget.name, style: TextStyle(
													fontWeight: FontWeight.bold,
													fontSize: 16,
												)),
											),



											SizedBox(height: 15),

											SizedBox(
												width: MediaQuery.of(context).size.width / 2,
												child: Text('By ${widget.author}', style: TextStyle(
													color: Colors.blueGrey[300],
													fontSize: 13,
												)) 
											),



											SizedBox(height: 15),

											Row(
												mainAxisAlignment: MainAxisAlignment.spaceBetween,
												children: <Widget>[
													Text('${widget.views} Views', style: TextStyle(
														color: Theme.of(context).primaryColor,
														fontSize: 13
													)),
													GestureDetector(
														onTap: () => _showInfo(
															widget.id, 
															widget.name, 
															widget.author,
															widget.description, 
															widget.thumbnail
														),
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
