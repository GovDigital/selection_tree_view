import 'package:selection_tree_view/models/tree_configuration.dart';

class TreeNode {
  TreeNode({
    this.id,
    this.title,
    this.code,
    this.isCheck = false,
    this.hierarchy = 0,
    this.parent,
    this.children = const [],
  });

  int? id;
  String? title;
  String? code;
  bool? isCheck;
  int hierarchy;
  TreeNode? parent;
  List<TreeNode> children;
  TreeConfiguration treeConfiguration = TreeConfiguration();

  TreeNode copyWith({
    int? id,
    String? title,
    String? code,
    bool? isCheck,
    int? hierarchy,
    TreeNode? parent,
    List<TreeNode>? children,
  }) {
    return TreeNode(
      id: id ?? this.id,
      title: title ?? this.title,
      code: code ?? this.code,
      isCheck: isCheck ?? this.isCheck,
      hierarchy: hierarchy ?? this.hierarchy,
      parent: parent ?? this.parent,
      children: children ?? [],
    );
  }

  TreeNode.fromJson(dynamic json)
      : id = json['id'],
        title = json['title'],
        code = json['code'],
        isCheck = json['isCheck'] ?? false,
        hierarchy = json['hierarchy'] ?? 0,
        parent =
            json['parent'] != null ? TreeNode.fromJson(json['parent']) : null,
        children = (json['children'] as List<dynamic>)
            .map((child) => TreeNode.fromJson(child))
            .toList();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'code': code,
      'isCheck': isCheck,
      'hierarchy': hierarchy,
      'parent': parent?.title,
      'children': children.map((child) => child.toJson()).toList(),
    };
  }
}
