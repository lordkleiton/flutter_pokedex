import 'package:flutter_pokedex/models/common/api_resource.dart';
import 'package:flutter_pokedex/models/common/named_api_resource.dart';

class MachineVersiondetail {
  ApiResource machine;
  NamedApiResource versionGroup;

  MachineVersiondetail.fromJson(Map<String, dynamic> json)
      : machine = ApiResource.fromJson(json['machine']),
        versionGroup = NamedApiResource.fromJson(json['version_group']);

  @override
  toString() => '$runtimeType {machine: $machine, versionGroup: $versionGroup}';
}
