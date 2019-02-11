import 'package:flutter/material.dart';



// Screen
import 'package:light_novel/screens/show_volumes.dart';


// Models
import 'package:light_novel/models/LightNovel.dart';



class InfoLightNovel extends StatefulWidget 
{
	final LightNovel lightNovel;


	InfoLightNovel({ this.lightNovel });


	@override
	_InfoLightNovelState createState() => _InfoLightNovelState();
}


class _InfoLightNovelState extends State<InfoLightNovel> 
{
	bool isLike = false;
	bool isReadLater = false;


	void _onPressLike()
	{
		setState(() {
			isLike = !isLike;
		});
	}


	void _onPressReadLater()
	{
		setState(() {
			isReadLater = !isReadLater;
		});
	}


	void _onPressSeeVolumes()
	{
		Navigator.of(context).push(
			MaterialPageRoute(
				builder: (BuildContext context) => ShowVolumes(lightNovel: widget.lightNovel,)
			)
		);
	}



	GestureDetector _button(Function onPress, Icon icon, String description)
	{
		return GestureDetector(
			onTap: onPress,
			child: Row(
				children: <Widget>[
					icon,
					SizedBox(width: 10),
					Text(description, style: TextStyle(
						color: Colors.blueGrey[700]
					))
				],
			),
		);
	}


	@override
	Widget build(BuildContext context) 
	{
		return Scaffold(
			appBar: AppBar(
				elevation: 0,
				backgroundColor: Colors.white12,
				leading: GestureDetector(
					onTap: () => Navigator.of(context).pop(),
					child: Icon(Icons.chevron_left, color: Colors.black, size: 30),
				),
				actions: <Widget>[
					GestureDetector(
						onTap: _onPressReadLater,
						child: Padding(
							padding: EdgeInsets.symmetric(horizontal: 30),
							child: Tooltip(
								message: 'Read later',
								child: (isReadLater
									? Icon(Icons.bookmark, color: Theme.of(context).primaryColor )
									: Icon(Icons.bookmark_border, color: Colors.blueGrey[300])
								),
							) 
						),
					)
				],
			),

			body: SingleChildScrollView(
				child:Container(
					padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
					child: Column(
						children: <Widget>[
							

							// Header (Image with Title) 
							SizedBox(
								height: 220,
								child: Row(
									children: <Widget>[
										ClipRRect(
											borderRadius: BorderRadius.all(Radius.circular(10)),
											child: FadeInImage.assetNetwork(
												fit: BoxFit.cover,
												placeholder: 'lib/assets/images/ounq1mw5kdxy.gif',
												fadeInDuration: Duration(seconds: 1),
												fadeInCurve: Curves.easeIn,
												image: widget.lightNovel.thumbnail,
											),
										),
										
										Expanded(
											child: Column(
												crossAxisAlignment: CrossAxisAlignment.center,
												mainAxisAlignment: MainAxisAlignment.center,
												children: <Widget>[

													SizedBox(
														width: MediaQuery.of(context).size.width / 3.2,
														child: Text(widget.lightNovel.name, style: TextStyle(
															fontWeight: FontWeight.bold,
															fontSize: 18,
														))
													),

													SizedBox(height: 16),

													SizedBox(
														width: MediaQuery.of(context).size.width / 3.2,
														child: Text('By ${widget.lightNovel.author}', style: TextStyle(
															color: Colors.blueGrey[300],
															fontSize: 13,
														))
													)
												],
											)
										)

										
									],
								),
							),



							// Buttons actions
							SizedBox(
								height: 80,
								child: Row(
									children: <Widget>[
										
										_button(_onPressSeeVolumes, Icon(Icons.chat), 'See Vols'),

										SizedBox(width: MediaQuery.of(context).size.width / 8),

										_button(_onPressLike, Icon(
											Icons.favorite, 
											color: (isLike
												? Theme.of(context).primaryColor
												: Colors.blueGrey[700])
											), 'Like'),

										SizedBox(width: MediaQuery.of(context).size.width / 8),

										_button(() => {}, Icon(Icons.share), 'Share'),
									],
								),
							),

							SizedBox(height: 30),



							// About light novel 
							SizedBox(
								width: MediaQuery.of(context).size.width,
								child: Text('About ${widget.lightNovel.name}', style: TextStyle(
									color: Colors.blueGrey[700],
									fontWeight: FontWeight.bold,
									fontSize: 19,
									wordSpacing: 2.8
								))
							),							

							SizedBox(height: 25),

							SizedBox(
								width: MediaQuery.of(context).size.width,
								child: Text('${widget.lightNovel.description}', style: TextStyle(
									color: Colors.blueGrey[300],
									height: 1.4,
									fontSize: 15,
								))
							),

							SizedBox(height: 40),

						],
					),
				)
			),
		);
	}
}

