// Mock class

import 'package:selection_tree_view/models/tree_node.dart';

class MockDataModel {
  MockDataModel({
    this.id,
    this.code,
    this.name,
    this.path,
  });

  MockDataModel.fromJson(dynamic json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    path = json['path'];
  }

  int? id;
  String? code;
  String? name;
  String? path;

  MockDataModel copyWith({
    int? id,
    String? code,
    String? name,
    String? path,
  }) =>
      MockDataModel(
        id: id ?? this.id,
        code: code ?? this.code,
        name: name ?? this.name,
        path: path ?? this.path,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['code'] = code;
    map['name'] = name;
    map['path'] = path;
    return map;
  }

  static List<TreeNode> mockTreeData() {
    TreeNode accessManagement = TreeNode(
      title: "Access Management",
      code: "Access Management",
      hierarchy: 0,
      parent: null,
      children: [],
    );

    TreeNode userManagement = TreeNode(
      title: "User Management",
      code: "User Management",
      hierarchy: 1,
      parent: accessManagement,
      children: [],
    );

    TreeNode profiles = TreeNode(
      title: "Profiles",
      code: "Profiles",
      hierarchy: 1,
      parent: accessManagement,
      children: [],
    );

    TreeNode customerProfiles = TreeNode(
      title: "Customer Profiles",
      code: "Customer Profiles",
      hierarchy: 2,
      parent: profiles,
      children: [],
    );

    customerProfiles.children.addAll([
      TreeNode(
        title: "View Profiles",
        code: "VIEW_PROFILES",
        hierarchy: 3,
        parent: customerProfiles,
        children: [],
      ),
      TreeNode(
        title: "Create Profiles",
        code: "CREATE_PROFILES",
        hierarchy: 3,
        parent: customerProfiles,
        children: [],
      ),
    ]);

    TreeNode employeeProfiles = TreeNode(
      title: "Employee Profiles",
      code: "Employee Profiles",
      hierarchy: 2,
      parent: profiles,
      children: [],
    );

    employeeProfiles.children.addAll([
      TreeNode(
        title: "Update Profiles",
        code: "UPDATE_PROFILES",
        hierarchy: 3,
        parent: employeeProfiles,
        children: [],
      ),
      TreeNode(
        title: "Delete Profiles",
        code: "DELETE_PROFILES",
        hierarchy: 3,
        parent: employeeProfiles,
        children: [],
      ),
    ]);

    profiles.children.addAll([customerProfiles, employeeProfiles]);

    userManagement.children.addAll([
      TreeNode(
        title: "View Users",
        code: "VIEW_USERS",
        hierarchy: 2,
        parent: userManagement,
        children: [],
      ),
      TreeNode(
        title: "Create Users",
        code: "CREATE_USERS",
        hierarchy: 2,
        parent: userManagement,
        children: [],
      ),
      TreeNode(
        title: "Update Users",
        code: "UPDATE_USERS",
        hierarchy: 2,
        parent: userManagement,
        children: [],
      ),
      TreeNode(
        title: "Delete Users",
        code: "DELETE_USERS",
        hierarchy: 2,
        parent: userManagement,
        children: [],
      ),
    ]);

    TreeNode roleManagement = TreeNode(
      title: "Role Management",
      code: "Role Management",
      hierarchy: 1,
      parent: accessManagement,
      children: [],
    );

    roleManagement.children.addAll([
      TreeNode(
        title: "View Roles",
        code: "VIEW_ROLES",
        hierarchy: 2,
        parent: roleManagement,
        children: [],
      ),
      TreeNode(
        title: "Create Roles",
        code: "CREATE_ROLES",
        hierarchy: 2,
        parent: roleManagement,
        children: [],
      ),
      TreeNode(
        title: "Update Roles",
        code: "UPDATE_ROLES",
        hierarchy: 2,
        parent: roleManagement,
        children: [],
      ),
      TreeNode(
        title: "Delete Roles",
        code: "DELETE_ROLES",
        hierarchy: 2,
        parent: roleManagement,
        children: [],
      ),
    ]);

    accessManagement.children.addAll(
      [userManagement, profiles, roleManagement],
    );

    TreeNode inventoryManagement = TreeNode(
      title: "Inventory Management",
      code: "Inventory Management",
      hierarchy: 0,
      parent: null,
      children: [],
    );

    TreeNode products = TreeNode(
      title: "Products",
      code: "Products",
      hierarchy: 1,
      parent: inventoryManagement,
      children: [],
    );

    TreeNode electronics = TreeNode(
      title: "Electronics",
      code: "Electronics",
      hierarchy: 2,
      parent: products,
      children: [],
    );

    electronics.children.addAll([
      TreeNode(
        title: "View Products",
        code: "VIEW_PRODUCTS",
        hierarchy: 3,
        parent: electronics,
        children: [],
      ),
      TreeNode(
        title: "Create Products",
        code: "CREATE_PRODUCTS",
        hierarchy: 3,
        parent: electronics,
        children: [],
      ),
    ]);

    TreeNode furniture = TreeNode(
      title: "Furniture",
      code: "Furniture",
      hierarchy: 2,
      parent: products,
      children: [],
    );

    furniture.children.addAll([
      TreeNode(
        title: "Update Products",
        code: "UPDATE_PRODUCTS",
        hierarchy: 3,
        parent: furniture,
        children: [],
      ),
      TreeNode(
        title: "Delete Products",
        code: "DELETE_PRODUCTS",
        hierarchy: 3,
        parent: furniture,
        children: [],
      ),
    ]);

    products.children.addAll([electronics, furniture]);

    inventoryManagement.children.add(products);

    return [accessManagement, inventoryManagement];
  }

  // This data simulates geographical regions and their hierarchical relationships.
  static List<Map<String, dynamic>> initialRelationshipTreeData() => [
        {"parentId": 0, "value": "Earth", "id": 1},
        {"parentId": 1, "value": "Continents", "id": 2},
        {"parentId": 2, "value": "Asia", "id": 3},
        {"parentId": 3, "value": "China", "id": 4},
        {"parentId": 4, "value": "Beijing", "id": 5},
        {"parentId": 4, "value": "Shanghai", "id": 6},
        {"parentId": 3, "value": "Japan", "id": 7},
        {"parentId": 7, "value": "Tokyo", "id": 8},
        {"parentId": 2, "value": "Europe", "id": 9},
        {"parentId": 9, "value": "France", "id": 10},
        {"parentId": 10, "value": "Paris", "id": 11},
        {"parentId": 9, "value": "Germany", "id": 12},
        {"parentId": 12, "value": "Berlin", "id": 13},
        {"parentId": 2, "value": "America", "id": 14},
        {"parentId": 14, "value": "USA", "id": 15},
        {"parentId": 15, "value": "New York", "id": 16},
        {"parentId": 15, "value": "Los Angeles", "id": 17},
        {"parentId": 14, "value": "Canada", "id": 18},
        {"parentId": 18, "value": "Toronto", "id": 19},
      ];

  // This data simulates permissions within different modules and their hierarchical paths.
  static List<Map<String, dynamic>> initialPathTreeData() => [
        {
          'code': 'VIEW_USERS',
          'name': 'View Users',
          'path': r'Access Management\\User Management',
        },
        {
          'code': 'CREATE_USERS',
          'name': 'Create Users',
          'path': r'Access Management\\User Management',
        },
        {
          'code': 'UPDATE_USERS',
          'name': 'Update Users',
          'path': r'Access Management\\User Management',
        },
        {
          'code': 'DELETE_USERS',
          'name': 'Delete Users',
          'path': r'Access Management\\User Management',
        },
        {
          'code': 'VIEW_ROLES',
          'name': 'View Roles',
          'path': r'Access Management\\Role Management',
        },
        {
          'code': 'CREATE_ROLES',
          'name': 'Create Roles',
          'path': r'Access Management\\Role Management',
        },
        {
          'code': 'UPDATE_ROLES',
          'name': 'Update Roles',
          'path': r'Access Management\\Role Management',
        },
        {
          'code': 'DELETE_ROLES',
          'name': 'Delete Roles',
          'path': r'Access Management\\Role Management',
        },
        {
          'code': 'VIEW_PRODUCTS',
          'name': 'View Products',
          'path': r'Inventory Management\\Products\\Electronics',
        },
        {
          'code': 'CREATE_PRODUCTS',
          'name': 'Create Products',
          'path': r'Inventory Management\\Products\\Electronics',
        },
        {
          'code': 'UPDATE_PRODUCTS',
          'name': 'Update Products',
          'path': r'Inventory Management\\Products\\Furniture',
        },
        {
          'code': 'DELETE_PRODUCTS',
          'name': 'Delete Products',
          'path': r'Inventory Management\\Products\\Furniture',
        },
        {
          'code': 'VIEW_ORDERS',
          'name': 'View Orders',
          'path': r'E-Commerce\\Orders\\Pending Orders',
        },
        {
          'code': 'CREATE_ORDERS',
          'name': 'Create Orders',
          'path': r'E-Commerce\\Orders\\Pending Orders',
        },
        {
          'code': 'UPDATE_ORDERS',
          'name': 'Update Orders',
          'path': r'E-Commerce\\Orders\\Completed Orders',
        },
        {
          'code': 'DELETE_ORDERS',
          'name': 'Delete Orders',
          'path': r'E-Commerce\\Orders\\Completed Orders',
        },
        {
          'code': 'VIEW_PROFILES',
          'name': 'View Profiles',
          'path': r'User Management\\Profiles\\Customer Profiles',
        },
        {
          'code': 'CREATE_PROFILES',
          'name': 'Create Profiles',
          'path': r'User Management\\Profiles\\Customer Profiles',
        },
        {
          'code': 'UPDATE_PROFILES',
          'name': 'Update Profiles',
          'path': r'User Management\\Profiles\\Employee Profiles',
        },
        {
          'code': 'DELETE_PROFILES',
          'name': 'Delete Profiles',
          'path': r'User Management\\Profiles\\Employee Profiles',
        },
        {
          'code': 'VIEW_SETTINGS',
          'name': 'View Settings',
          'path': r'System Settings\\General Settings\\Configurations',
        },
        {
          'code': 'CREATE_SETTINGS',
          'name': 'Create Settings',
          'path': r'System Settings\\General Settings\\Configurations',
        },
        {
          'code': 'UPDATE_SETTINGS',
          'name': 'Update Settings',
          'path': r'System Settings\\General Settings\\Permissions',
        },
        {
          'code': 'DELETE_SETTINGS',
          'name': 'Delete Settings',
          'path': r'System Settings\\General Settings\\Permissions',
        }
      ];
}
