class EventDetail{
  String id;
  String _description;
  String _date;
  String _startTime;
  String _endTime;
  String _speaker;
  bool _isFavourite;

//constructor
  EventDetail(
    this.id,
    this._description,
    this._date,
    this._startTime,
    this._endTime,
    this._speaker,
    this._isFavourite
  );
  
  //create getter method foll private variable
  String get description => _description;
  String get date => _date;
  String get startTime => _startTime;
  String get endTime => _endTime;
  String get speaker => _speaker;
  bool get is_favourite => _isFavourite;

  //named constructor
  EventDetail.fromMap(dynamic obj)
  :this.id = obj['id'],
   this._description = obj['description'],
   this._date =obj['date'],
   this._startTime = obj['start_time'],
   this._endTime = obj['end_time'],
   this._speaker = obj['speaker'],
   this._isFavourite = obj['is_favourite'];

Map<String ,dynamic> toMap(){
  var map = <String,dynamic>{};
  map['id'] = id;
  map['description'] = _description;
  map['date'] = _date;
  map['start_time'] = _startTime;
  map['end_time'] = _endTime;
  map['is_favourite'] = _isFavourite;
  map['speaker'] = _speaker;
  return map;
}

  

  

}
