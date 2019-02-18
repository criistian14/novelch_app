class Chapter {
	String name, prev, next, id, body;

	Chapter({ this.id, this.name, this.prev, this.next, this.body });

	factory Chapter.fromJson(Map<String, dynamic> json)
	{
		return Chapter(
			id: json['_id'] as String,
			name: json['name'] as String,
			prev: json['prev'] as String,
			next: json['next'] as String,
			body: json['body'] as String
		);
	}
}