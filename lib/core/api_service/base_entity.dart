// const String key_code = 'code';
// const String key_message = 'message';
// const String key_data = 'data';

// class BaseEntity<T> {
//   int code = 0;
//   String message = "";
//   T? data;

//   BaseEntity(this.code, this.message, this.data);

//   BaseEntity.fromJson(Map<String, dynamic> json) {
//     code = json[key_code];
//     message = json[key_message];
//     //
//     var dataContent = json[key_data];
//     data = dataContent != null
//         ? EntityFactory.generateObject<T>(dataContent)
//         : null;
//   }
// }

// class BaseEntityWithList<T> {
//   int code = 0;
//   String message = "";
//   List<T> data = [];

//   BaseEntityWithList(this.code, this.message, this.data);

//   BaseEntityWithList.fromJson(Map<String, dynamic> json) {
//     code = json[key_code];
//     message = json[key_message];
//     //
//     var dataContent = json[key_data];
//     if (dataContent != null) {
//       final list = json[key_data] as List;
//       list.forEach((item) {
//         data.add(EntityFactory.generateObject<T>(item));
//       });
//     }
//   }
// }
