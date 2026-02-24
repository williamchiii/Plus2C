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

}
