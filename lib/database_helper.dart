import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'meal_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('favorites.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE favorites(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        restaurant TEXT,
        price TEXT,
        image TEXT,
        rating REAL,
        reviews TEXT
      )
    ''');
  }

  
  Future<void> insertMeal(Meal meal) async {
    final db = await database;
    await db.insert('favorites', meal.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

 
  Future<void> deleteMeal(String name) async {
    final db = await database;
    await db.delete('favorites', where: 'name = ?', whereArgs: [name]);
  }

  Future<List<Meal>> getFavorites() async {
    final db = await database;
    final maps = await db.query('favorites');

    return List.generate(maps.length, (i) {
      return Meal.fromMap(maps[i]);
    });
  }

  Future<bool> isFavorite(String name) async {
    final db = await database;
    final maps =
        await db.query('favorites', where: 'name = ?', whereArgs: [name]);
    return maps.isNotEmpty;
  }
}