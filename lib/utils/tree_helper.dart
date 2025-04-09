import 'package:selection_tree_view/models/tree_node.dart';

class TreeHelper {
  static List<TreeNode> buildRelationshipTreeData(
    List<Map<String, dynamic>> data,
  ) {
    Map<int, TreeNode> nodeMap = {};
    List<TreeNode> rootNodes = [];

    for (var item in data) {
      nodeMap.putIfAbsent(
        item["id"],
        () => TreeNode(
          id: item["id"],
          title: item["value"],
          parent: null,
          children: [],
        ),
      );
    }

    for (var item in data) {
      var node = nodeMap[item["id"]];
      if (node == null) continue;

      if (!nodeMap.containsKey(item["parentId"])) {
        rootNodes.add(node);
        node.hierarchy = 0;
      } else {
        var parentNode = nodeMap[item["parentId"]];
        if (parentNode != null) {
          node.parent = parentNode;
          parentNode.children.add(node);
          node.hierarchy = parentNode.hierarchy + 1;
        }
      }
    }

    return rootNodes;
  }

  static List<TreeNode> buildPathTreeData(
    List<Map<String, dynamic>> data,
  ) {
    final nodesMap = <String, TreeNode>{};
    final rootNodes = <TreeNode>[];

    for (final item in data) {
      final paths = item['path']?.trim().split(r'\\');
      TreeNode? currentParent;

      for (var i = 0; i < (paths?.length ?? 0); i++) {
        final path = paths![i];

        final hierarchyLevel = i;

        final currentNode = nodesMap.putIfAbsent(path, () {
          final newNode = TreeNode(
            title: path,
            code: path,
            children: [],
            hierarchy: hierarchyLevel,
            parent: currentParent,
          );

          if (currentParent != null) {
            currentParent.children.add(newNode);
          } else {
            rootNodes.add(newNode);
          }

          return newNode;
        });

        currentParent = currentNode;
      }

      final permissionNode = TreeNode(
        title: item['name'],
        code: item['code'],
        parent: currentParent,
        hierarchy: (currentParent?.hierarchy ?? 0) + 1,
        children: [],
      );

      currentParent?.children.add(permissionNode);
    }

    return rootNodes;
  }
}
