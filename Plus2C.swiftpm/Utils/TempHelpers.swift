import SwiftUI

func getSeverity(temperature: Double) -> String {
    switch temperature {
    case ...0.0: return "Pre-industrial"
    case ...0.5: return "Stable"
    case ...1.0: return "Changing"
    case ...1.3: return "📍Today"
    case ...1.5: return "Unstable"
    case ...2.0: return "Dangerous"
    case ...2.5: return "Severe"
    case ...3.0: return "⚠Catastrophic"
    default:     return ""
    }
}
func getTempColor(temperature: Double) -> Color {
    let minTemp = 0.0
    let maxTemp = 3.0
    
    // Clamp temperature between 0 and 3
    let clamped = min(max(temperature, minTemp), maxTemp)
    let progress = clamped / maxTemp   // 0 to 1
    
    // Start color (245,245,245)
    let startR = 245.0
    let startG = 245.0
    let startB = 245.0
    
    // End color (250,5,5)
    let endR = 250.0
    let endG = 5.0
    let endB = 5.0
    
    // Linear interpolation
    let r = startR + (endR - startR) * progress
    let g = startG + (endG - startG) * progress
    let b = startB + (endB - startB) * progress
    
    return Color(red: r/255, green: g/255, blue: b/255)
}
func globeTempColor(temperature: Double) -> Color {
    switch temperature {
        case ...0.0: return Color(red: 0.2, green: 0.4, blue: 1.0)   // blue
        case ...0.5: return Color(red: 0.3, green: 0.35, blue: 0.9)  // blue-purple
        case ...1.0: return Color(red: 0.5, green: 0.25, blue: 0.7)  // purple
        case ...1.3: return Color(red: 0.7, green: 0.2, blue: 0.4)   // purple-red
        case ...1.5: return Color(red: 0.7, green: 0.2, blue: 0.4)   // purple-red
        case ...2.0: return Color(red: 0.9, green: 0.15, blue: 0.2)  // near red
        case ...2.5: return Color(red: 1.0, green: 0.15, blue: 0.1)  // red
        case ...3.0: return Color(red: 1.0, green: 0.15, blue: 0.1)  // red
        default:     return Color(red: 1.0, green: 0.15, blue: 0.1)
        }
}
