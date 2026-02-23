import SwiftUI

struct TimeMachineCard: View {
    @State private var sliderValue = 0.0
    @State private var isEditing = false
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Image(systemName: "thermometer")
                        .foregroundStyle(.blue)
                        .frame(width: 30, height: 30)
                    
                    Text("Time MACHINE")
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    NavigationLink(destination: SeaLevelPage()) {
                        Text("Click here")
                    }
                }
                HStack{
                    Text("Some Value Here")
                        .foregroundStyle(.white)
                    Spacer()
                    Text("Severity THing")
                        .foregroundStyle(.white)
                }
            }
            //this styles the box
            .background(RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(.ultraThinMaterial)
            )
            .frame(width: 700, height: 60)
        }
    }
}
