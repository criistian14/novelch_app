class Volume {
	String name, thumbnail, prev, next, id;
	List<dynamic> chapters;

	Volume({ this.id, this.name, this.prev, this.thumbnail, this.next, this.chapters });

	factory Volume.fromJson(Map<String, dynamic> json)
	{
		var chaptersFromJson = json['chapters'];

		List<String> chaptersList = chaptersFromJson.cast<String>();

		return Volume(
			id: json['_id'] as String,
			name: json['name'] as String,
			prev: json['prev'] as String,
			thumbnail: json['thumbnail'] as String,
			next: json['next'] as String,
			chapters: chaptersList
		);
	}
}