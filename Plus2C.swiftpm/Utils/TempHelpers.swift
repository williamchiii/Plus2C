import SwiftUI

func getSeverity(temperature: Double) -> String {
    switch temperature {
    case ...0.0:  return "Pre-industrial"
    case ...0.5:  return "Slight changes"
    case ...1.0:  return "Moderate impact"
    case ...1.5:  return "Unsafe"
    case ...2.0:  return "Dangerous"
    case ...2.5:  return "Severe"
    case ...3.0:  return "Catastrophic"
    default:      return ""
    }
}
func getTempColor(temperature: Double) -> Color {
    switch temperature {
    case ...0.0:  return .white
    case ...0.5:  return Color(red: 1.0, green: 0.8, blue: 0.8) // light pink
    case ...1.0:  return Color(red: 1.0, green: 0.5, blue: 0.5) // pink-red
    case ...1.5:  return Color(red: 0.9, green: 0.2, blue: 0.2) // red
    case ...2.0:  return Color(red: 0.7, green: 0.1, blue: 0.1) // medium red
    case ...2.5:  return Color(red: 0.6, green: 0, blue: 0) // dark red
    case ...3.0:  return Color(red: 0.5, green: 0, blue: 0) // very dark red
    default:      return Color(red: 0.2, green: 0.0, blue: 0.0)
    }
}
func globeTempColor(temperature: Double) -> Color {
    switch temperature {
        case ...0.0:  return Color(red: 0.2, green: 0.4, blue: 1.0)   // blue
        case ...0.5:  return Color(red: 0.3, green: 0.35, blue: 0.9)  // blue-purple
        case ...1.0:  return Color(red: 0.5, green: 0.25, blue: 0.7)  // purple
        case ...1.5:  return Color(red: 0.7, green: 0.2, blue: 0.4)   // purple-red
        case ...2.0:  return Color(red: 0.9, green: 0.15, blue: 0.2)  // near red
        case ...2.5:  return Color(red: 1.0, green: 0.15, blue: 0.1)  // red
        case ...3.0:  return Color(red: 1.0, green: 0.15, blue: 0.1)  // red
        default:      return Color(red: 1.0, green: 0.15, blue: 0.1)
        }
}
