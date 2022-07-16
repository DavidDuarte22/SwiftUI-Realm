import RealmSwift

enum RealmMigrator {
  // define a migration method. The method receives a migration object and oldSchemaVersion.
  static private func migrationBlock(
    migration: Migration,
    oldSchemaVersion: UInt64
  ) {
    // check the version of the file-persisted schema to decide which migration to run. Each schema has a version number, starting from zero. In this case, if the old schema is the first one (before you added a new property), run the migration.
    if oldSchemaVersion < 1 {
      // for each of the old and new Ingredient objects in Realm, you assign a default value to the new property, colorOption.
      migration.enumerateObjects(
        ofType: Ingredient.className()
      ) { _, newObject in
        newObject?["colorOption"] = ColorOptions.green
      }
    }
  }

  static var configuration: Realm.Configuration {
    Realm.Configuration(schemaVersion: 1, migrationBlock: migrationBlock)
  }
}
