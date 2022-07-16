
import SwiftUI
import RealmSwift

// extend it to String. You also conform it to CaseIterable, to list all cases of the enum and to PersistableEnum. This is a protocol Realm uses to store enum values in the database.
enum ColorOptions: String, CaseIterable, PersistableEnum {

  case green
  case lightBlue
  case lightRed

  var color: Color {
    Color(rawValue)
  }

  var title: String {
    switch self {
    case .green:
      return "Green"
    case .lightBlue:
      return "Light Blue"
    case .lightRed:
      return "Light Red"
    }
  }
}
