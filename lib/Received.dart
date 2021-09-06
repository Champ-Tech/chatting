class Received {
  late String time;
  late String msg;

  Received({time, msg}){
    this.time=time;
  }

  Received.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['msg'] = this.msg;
    return data;
  }
}
