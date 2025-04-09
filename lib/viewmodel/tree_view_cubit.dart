import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selection_tree_view/models/tree_configuration.dart';
import 'package:selection_tree_view/models/tree_node.dart';

part 'tree_view_state.dart';

class TreeViewCubit extends Cubit<TreeViewState> {
  TreeViewCubit() : super(TreeViewState.init());

  Future<void> initRootNodes({
    required List<TreeNode> rootNodes,
    TreeConfiguration? treeConfiguration,
  }) async {
    if (treeConfiguration != null) setDecoration(treeConfiguration, rootNodes);
    emit(state.copyWith(rootNodes: rootNodes));
  }

  void setDecoration(
    TreeConfiguration treeConfiguration,
    List<TreeNode> rootNodes,
  ) {
    for (final e in rootNodes) {
      e.treeConfiguration = e.treeConfiguration.copyWith(
        nodeHeight: treeConfiguration.nodeHeight,
        titleStyle: treeConfiguration.titleStyle,
        prefixIcon: treeConfiguration.prefixIcon,
        animatedDuration: treeConfiguration.animatedDuration,
        animatePrefixIcon: treeConfiguration.animatePrefixIcon,
        showCheckbox: treeConfiguration.showCheckbox,
      );
      setDecoration(treeConfiguration, e.children);
    }
  }

  void onSelectNodeChildren(TreeNode node) {
    if (node.children.isEmpty) {
      node.isCheck = !(node.isCheck ?? false);
    }

    if (node.children.isNotEmpty && node.parent != null) {
      final allSelected = node.children.every((e) {
        return e.isCheck == true;
      });
      if (allSelected) {
        node.isCheck = true;
      } else {
        if (node.children.every((e) => e.isCheck == false)) {
          node.isCheck = false;
        } else {
          node.isCheck = null;
        }
      }
    }

    if (node.parent != null) {
      onSelectNodeChildren(node.parent!);
    } else {
      final allSelected = node.children.every((e) {
        return e.isCheck == true;
      });
      if (allSelected) {
        node.isCheck = true;
      } else {
        if (node.children.every((e) => e.isCheck == false)) {
          node.isCheck = false;
        } else {
          node.isCheck = null;
        }
      }
    }
    emit(state.copyWith(rootNodes: state.rootNodes));
  }

  void onSelectParentNode(TreeNode node) {
    bool parentStatus = node.isCheck ?? false;
    parentStatus = !parentStatus;

    void updateChildrenStatusByParent(TreeNode node, bool parentStatus) {
      node.isCheck = parentStatus;
      for (final child in node.children) {
        updateChildrenStatusByParent(child, parentStatus);
      }
    }

    updateChildrenStatusByParent(node, parentStatus);

    if (node.parent != null) {
      onSelectNodeChildren(node.parent!);
    }

    emit(state.copyWith(rootNodes: state.rootNodes));
  }

  void collapseExpandNode(TreeNode node) {
    final status =
        node.treeConfiguration.isExpanded = !node.treeConfiguration.isExpanded;
    findChildren(node, status);
    emit(state.copyWith(rootNodes: state.rootNodes));
  }

  void findChildren(TreeNode node, bool status) {
    for (final child in node.children) {
      child.treeConfiguration.isShowChild = status;
      child.treeConfiguration.isExpanded = status;
      findChildren(child, status);
    }
  }
}
