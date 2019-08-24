class UniResponse {
  final bool success;
  final Map<String, String> result;

  UniResponse(this.success, this.result);

  UniResponse.fromJson(Map<String, dynamic> json)
      : success = json['success'],
        result = json['result'];

  Map<String, dynamic> toJson() =>
    {
      'success': success,
      'result':result,
    };
}