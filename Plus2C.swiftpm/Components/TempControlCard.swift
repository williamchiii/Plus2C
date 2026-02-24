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
                        .foregroundStyle(.white)
                        .font(.headline)
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
            .background(RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(.ultraThinMaterial)
            )
            .frame(width: 700)
        }
    }
    func getSeverity(temperature: Double) -> String{
        var severity: String = ""
        if temperature <= 0.0{
            severity = "Pre-industrial"
        }
        else if temperature <= 0.5{
            severity = "Slight changes"
        }
        else if temperature <= 1{
            severity = "Moderate impact"
        }
        else if temperature <= 1.5{
            severity = "Unsafe"
        }
        else if temperature <= 2.0{
            severity = "Dangerous"
        }
        else if temperature <= 2.5{
            severity = "Severe"
        }
        else if temperature <= 3.0{
            severity = "Catastrophic"
        }
        return severity
    }
}
