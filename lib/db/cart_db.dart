import 'package:e_commerce_app/data/models/cart_model/cart_models.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

const _dbName = 'cartBox';

abstract class CartDbFunctions {
  Future<List<CartModels>> getCart();
  Future<void> addCart(CartModels models);
  Future<void> removeCart(String cartId);
  Future<void> editCart(CartModels value, String cartId);
}

class CartDb implements CartDbFunctions {
  ValueNotifier<List<CartModels>> cartNotifier = ValueNotifier([]);

  CartDb._internal() {
    refresh(); // Ensure cart data is loaded on app startup
  }
  static final CartDb singleton = CartDb._internal();

  factory CartDb() {
    return singleton;
  }

  Future<void> refresh() async {
    final allCart = await getCart();
    cartNotifier.value = List.from(allCart);
  }

  @override
  Future<void> addCart(CartModels models) async {
    final db = await Hive.openBox<CartModels>(_dbName);
    await db.put(models.id, models);
    refresh();
  }

  @override
  Future<void> editCart(CartModels value, String cartId) async {
    final db = await Hive.openBox<CartModels>(_dbName);
    await db.put(cartId, value);
    refresh();
  }

  @override
  Future<List<CartModels>> getCart() async {
    final db = await Hive.openBox<CartModels>(_dbName);
    return db.values.toList();
    
  }

  @override
  Future<void> removeCart(String cartId) async {
    final db = await Hive.openBox<CartModels>(_dbName);
    await db.delete(cartId);
     refresh();
  }
}
