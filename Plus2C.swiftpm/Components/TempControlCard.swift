import SwiftUI

struct TempControlCard: View {
    @Binding var tempIncrease: Double
    @State private var isEditing = false
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Image(systemName: "thermometer")
                        .foregroundStyle(.blue)
                        .frame(width: 30, height: 30)
                    
                    Text("Global Temperature Increase")
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                }
                Slider(
                    value: $tempIncrease,
                    in: 0...3,
                    step: 0.5,
                    onEditingChanged: { editing in
                        isEditing = editing
                    }
                )
                    .frame(width: 600)
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
