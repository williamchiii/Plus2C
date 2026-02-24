import SwiftUI

struct TempControlCard: View {
    @Binding var tempIncrease: Double
    @State private var isEditing = false
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Image(systemName: "thermometer")
                        .foregroundStyle(.white)
                        .frame(width: 50, height: 50)
                        .font(.title2)
                    
                    Text("Global Temperature Increase")
                        .foregroundStyle(.white)
                        .font(.title3)
                    Spacer()
                    
                    Text(getSeverity(temperature: tempIncrease))
                        .foregroundStyle(getTempColor(temperature: tempIncrease))
                        .font(.title3)
                        .padding(10)
                    
                }
                HStack{
                    Text("0°C")
                        .foregroundStyle(.white)
                        
                        .font(.caption)
                    Slider(
                        value: $tempIncrease,
                        in: 0...3,
                        step: 0.5,
                        onEditingChanged: { editing in
                            isEditing = editing
                        }

                    )
                        .frame(width: 600)
                    Text("3°C")
                        .foregroundStyle(.white)
                        
                        .font(.caption)
                }
                
                Text("+\(tempIncrease, specifier: "%.1f")°C")
                    .foregroundStyle(.white)
                    .font(.headline)
                    .padding()

            }
            //this styles the box
            .background(
                ZStack{
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(.ultraThinMaterial)
                    //inner glow
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(
                            LinearGradient(
                                colors: [getTempColor(temperature: tempIncrease).opacity(0.10), .clear], startPoint: .top, endPoint: .bottom
                            )
                        )
                }
            )
            .shadow(color: getTempColor(temperature: tempIncrease).opacity(0.5), radius: 25, x: 0, y: 5)
            .frame(width: 700)
        }
    }
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
}
