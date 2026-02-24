import SwiftUI

struct WarmingCircle: View {
    @Binding var tempIncrease: Double
    
    var body: some View {
        ZStack {
            // Outer glow layers
            Circle()
                .fill(globeTempColor(temperature: tempIncrease).opacity(0.10))
                .frame(width: 350, height: 350)
                .blur(radius: 30)
            
            Circle()
                .fill(globeTempColor(temperature: tempIncrease).opacity(0.05))
                .frame(width: 250, height: 250)
                .blur(radius: 20)
            
            // Core circle
           
        }
    }
}
