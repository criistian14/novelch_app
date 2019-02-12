class Volume {
	String name, thumbnail, prev, next;
	List<dynamic> chapters;

	Volume({ this.name, this.prev, this.thumbnail, this.next, this.chapters });

	factory Volume.fromJson(Map<String, dynamic> json)
	{
		var chaptersFromJson = json['chapters'];

		List<String> chaptersList = chaptersFromJson.cast<String>();

		return Volume(
			name: json['name'] as String,
			prev: json['prev'] as String,
			thumbnail: json['thumbnail'] as String,
			next: json['next'] as String,
			chapters: chaptersList
		);
	}
}