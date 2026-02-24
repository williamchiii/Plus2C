import SwiftUI

struct TempControlCard: View {
    @Binding var tempIncrease: Double
    @State private var isEditing = false
    
    let steps: [Double] = [0.0, 0.5, 1.0, 1.3, 1.5, 2.0, 2.5, 3.0]
    @State private var stepIndex: Int = 0
    
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
                    VStack{
                        Text("Past")
                            .foregroundStyle(.white)
                            .font(.system(size: 8))
                        Text("0°C")
                            .foregroundStyle(.white)
                            .padding(.horizontal, 5)
                            .font(.caption)
                    }
                   
                    Slider(
                        value: Binding(
                            get: { Double(stepIndex) },
                            set: { newVal in
                                stepIndex = Int(newVal.rounded())
                                tempIncrease = steps[stepIndex]  // keeps the binding in sync
                            }
                        ),
                        in: 0...Double(steps.count - 1),
                        step: 1,
                        onEditingChanged: { editing in
                            isEditing = editing
                        }
                    )
                    .frame(width: 600)
                    .accentColor(getTempColor(temperature: tempIncrease))
                    .overlay(
                        GeometryReader { geo in
                            let slitXPos = geo.size.width * 3.0 / 7.0
                            VStack{
                                Rectangle()
                                    .fill(.white.opacity(0.2))
                                    .frame(width: 2, height: 20)
                            }
                            .offset(x: slitXPos - 1, y: +5)
                        }
                    )
                    VStack{
                        Text("Future")
                            .foregroundStyle(.white)
                            .font(.system(size: 8))
                            .padding(.horizontal, 5)
                        Text("3°C")
                            .foregroundStyle(.white)
                            .font(.caption)
                    }
                    
                }
                
                Text("+\(tempIncrease, specifier: "%.1f")°C")
                    .foregroundStyle(.white)
                    .font(.title3)
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
