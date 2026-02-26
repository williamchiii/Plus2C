import SwiftUI

struct RiskSnapshotPage: View{
    @State private var selectedTimeFrame: TimeFrame = .current
    
    var body: some View{
        ZStack{
            GeometryReader{ geo in
                ScrollView{
                    VStack (spacing: 8){
                        Text("Risk Snapshot")
                            .foregroundStyle(.white)
                            .font(.largeTitle.bold())
                            .padding(.bottom, geo.size.width/5)
                        TimeFrameSelector(selectedTimeFrame: $selectedTimeFrame)
                        OverallRiskCard(timeframe: selectedTimeFrame)
                        RiskCategoryCard(
                            icon: "thermometer.sun.fill",
                            title: "Extreme Heat",
                            year1900Risk: .low,
                            currentRisk: .moderate,
                            year2050Risk: .severe,
                            year2100Risk: .severe,
                            timeFrame: selectedTimeFrame,
                            description: "Increased frequency and instensity of heat waves"
                        )
                        RiskCategoryCard(
                            icon: "water.waves",
                            title: "Flooding",
                            year1900Risk: .low,
                            currentRisk: .high,
                            year2050Risk: .high,
                            year2100Risk: .severe,
                            timeFrame: selectedTimeFrame,
                            description: "Rising sea levels and extreme participitation events"
                        )
                        RiskCategoryCard(
                            icon: "hurricane",
                            title: "Extreme weather",
                            year1900Risk: .low,
                            currentRisk: .moderate,
                            year2050Risk: .high,
                            year2100Risk: .severe,
                            timeFrame: selectedTimeFrame,
                            description: "More intense storms, hurricanes, and weather events"
                        )
                        RiskCategoryCard(
                            icon: "flame.fill",
                            title: "Wildfire",
                            year1900Risk: .low,
                            currentRisk: .high,
                            year2050Risk: .high,
                            year2100Risk: .severe,
                            timeFrame: selectedTimeFrame,
                            description: "Increased wildfire frequency due to drought and heat"
                        )
                        RiskCategoryCard(
                            icon: "drop.fill",
                            title: "Water Scarcity",
                            year1900Risk: .low,
                            currentRisk: .moderate,
                            year2050Risk: .high,
                            year2100Risk: .severe,
                            timeFrame: selectedTimeFrame,
                            description: "Increased frequency and instensity of heat waves"
                        )
                        RiskCategoryCard(
                            icon: "leaf.fill",
                            title: "Ecosystem Loss",
                            year1900Risk: .low,
                            currentRisk: .high,
                            year2050Risk: .severe,
                            year2100Risk: .severe,
                            timeFrame: selectedTimeFrame,
                            description: "Biodiversity decline and habitat destruction"
                        )
                        
                    }
                    .padding(.horizontal)
                    
                }
            }
        }
        .background(
            Image("stars")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
    }
}

enum RiskLevel: String{
    case low = "Low"
    case moderate = "Moderate"
    case high = "High"
    case severe = "Severe"
    var color: Color{
        switch self{
        case .low: return .green
        case .moderate: return .orange
        case .high: return Color(red: 255/255, green: 105/255, blue: 0/255)
        case .severe: return .red
        }
    }
    var iconName: String{
        switch self {
        case .low: return "checkmark.circle.fill"
        case .moderate: return "exclamationmark.triangle.fill"
        case .high: return "exclamationmark.triangle.fill"
        case .severe: return "exclamationmark.octagon.fill"
        }
    }
}

struct OverallRiskCard: View {
    let timeframe: TimeFrame
    
    var overallRisk: RiskLevel{
        switch timeframe {
        case .year1900: return .low
        case .current: return .moderate
        case .year2050: return .high
        case .year2100: return .severe
        }
    }
    var body: some View{
        VStack{
            HStack{
                //the text
                VStack(alignment: .leading){
                    Text("Overall Risk Level")
                        .font(.headline)
                        .foregroundStyle(.black)
                    Text(timeframe.rawValue)
                        .font(.caption)
                        .foregroundStyle(.black.opacity(0.6))
                }
                Spacer()
                //the icon
                HStack(spacing: 8) {
                    Image(systemName: overallRisk.iconName)
                        .font(.title2)
                        .foregroundStyle(overallRisk.color)
                    
                    Text(overallRisk.rawValue)
                        .font(.title2.bold())
                        .foregroundStyle(overallRisk.color)
                }
            }
            //the color slider looking thing
            GeometryReader{ geo in
                ZStack{
                    if #available(iOS 17.0, *) {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(overallRisk.color.opacity(0.1))
                            .fill(.black.opacity(0.1))
                            .frame(height: 12)
                    } else {
                        // Fallback on earlier versions
                    }
                    RoundedRectangle(cornerRadius: 8)
                        .fill(overallRisk.color)
                        .frame(
                            width: geo.size.width * riskPercentage,
                            height: 12
                        )
                }
            }
        }
        //styles the entire box
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white.opacity(0.9))
        )
    }
    private var riskPercentage: Double {
        switch overallRisk {
        case .low: return 0.25
        case .moderate: return 0.5
        case .high: return 0.75
        case .severe: return 1.0
        }
    }
}

struct RiskCategoryCard: View {
    //these variables have to be passed in when u call this
    let icon: String
    let title: String
    let year1900Risk: RiskLevel
    let currentRisk: RiskLevel
    let year2050Risk: RiskLevel
    let year2100Risk: RiskLevel
    let timeFrame: TimeFrame
    let description: String
    @State private var isExpanded = false

    var displayedRisk: RiskLevel {
        switch timeFrame {
        case .year1900: return year1900Risk
        case .current:  return currentRisk
        case .year2050: return year2050Risk
        case .year2100: return year2100Risk
        }
    }
    
    var body: some View{
        VStack(alignment: .leading){
            Button(action: {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)){
                    isExpanded.toggle()
                }
            }) {
                HStack{
                    //icon
                    Image(systemName: icon)
                        .font(.title2)
                        .foregroundStyle(displayedRisk.color)
                        .frame(width: 40, height: 40)
                        .background(
                            Circle()
                                .fill(displayedRisk.color.opacity(0.20))
                        )
                    VStack(alignment: .leading){
                        Text(title)
                            .foregroundStyle(.black)
                            .font(.headline)
                        Text("\(displayedRisk.rawValue) Risk")
                            .foregroundStyle(displayedRisk.color.opacity(0.6))
                            .font(.caption)
                    }
                    Spacer()
                    if !isExpanded{
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.black.opacity(0.8))
                       // isExpanded.toggle()
                    }
                    else{
                        Image(systemName: "chevron.down")
                            .foregroundStyle(.black.opacity(0.8))
                            .font(.caption)
                      //  isExpanded.toggle()
                    }
                }
                
            }
            if isExpanded{
                VStack(alignment: .leading, spacing: 12){
                    Divider()
                    Text(description)
                        .font(.subheadline)
                        .foregroundStyle(.black.opacity(0.8))
                }
                .transition(
                    .opacity.combined(with: .scale(scale: 0.8, anchor: .trailing))
                )

            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.white.opacity(0.9))
        )
    }
}
