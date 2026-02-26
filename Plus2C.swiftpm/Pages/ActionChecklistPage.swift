import SwiftUI

struct ActionChecklistPage: View{
    //creats and owns all the action calss variables
    @StateObject private var viewModel = ActionChecklistViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header
                VStack(spacing: 8) {
                    Text("Action Checklist")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                    Text("Small steps, big impact")
                        .font(.headline)
                        .foregroundStyle(.white)
                }
                .padding(.top, 20)
                
                // Progress Card
                ProgressCard(
                    completed: viewModel.completedActionsCount,
                    total: viewModel.totalActionsCount
                )
                .frame(height: 100)
                .padding(.horizontal, 20)
                
                // Category Sections
                VStack(spacing: 12) {
                    ForEach(ActionCategory.allCases) { category in
                        ActionCategorySection(
                            category: category,
                            actions: viewModel.actions(for: category),
                            onToggle: { action in
                                viewModel.toggleAction(action)
                            }
                        )
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
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

struct ProgressCard: View{
    let completed: Int
    let total: Int
    var progressPercentage: Double{
        guard total > 0 else {return 0}
        return Double(completed) / Double(total)
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text("Your Progress")
                    .foregroundStyle(.black)
                    .font(.headline)
                Text("\(completed) of \(total) completed")
                    .foregroundStyle(.black.opacity(0.7))
                    .font(.caption)
            }
            
            Spacer()
            
            // Circular progress bar
            ZStack {
                Circle()
                    .stroke(.black.opacity(0.1), lineWidth: 8)
                    .frame(width: 60, height: 60)
                Circle()
                    .trim(from: 0, to: progressPercentage)
                    .stroke(.green, style: StrokeStyle(lineWidth: 8, lineCap: .round))
                    .frame(width: 60, height: 60)
                    .rotationEffect(.degrees(-90))
                    .animation(.spring(response: 0.5, dampingFraction: 0.7), value: progressPercentage)
                Text("\(Int(progressPercentage * 100))%")
                    .font(.caption.bold())
                    .foregroundStyle(.black)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white.opacity(0.85))
        )
    }
}

struct ActionCategorySection: View{
    let category: ActionCategory
    let actions: [ClimateAction]
    let onToggle: (ClimateAction) -> Void
    @State private var isExpanded = true
    
    var completedCount: Int{
        actions.filter{$0.isCompleted}.count
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Category Header Button
            Button(action: {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    isExpanded.toggle()
                }
            }) {
                HStack(spacing: 12) {
                    Image(systemName: category.icon)
                        .font(.title3)
                        .foregroundStyle(category.color)
                        .frame(width: 40, height: 40)
                        .background(
                            Circle()
                                .fill(category.color.opacity(0.2))
                        )
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(category.title)
                            .font(.headline)
                            .foregroundStyle(.black)
                        Text("\(completedCount)/\(actions.count) completed")
                            .font(.caption)
                            .foregroundStyle(.black.opacity(0.6))
                    }
                    
                    Spacer()
                    
                    Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                        .foregroundStyle(.black.opacity(0.6))
                        .font(.headline)
                }
                .padding()
            }
            
            // Expandable Action Items
            if isExpanded {
                VStack(spacing: 8) {
                    ForEach(actions) { action in
                        ChecklistItem(
                            action: action,
                            onToggle: { onToggle(action) }
                        )
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
                .transition(.opacity.combined(with: .scale(scale: 0.95, anchor: .top)))
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white.opacity(0.9))
        )
    }
}

struct ChecklistItem: View {
    let action: ClimateAction
    let onToggle: () -> Void
    
    var body: some View {
        Button(action: {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                onToggle()
            }
        }) {
            HStack(alignment: .top, spacing: 12) {
                // Checkbox
                ZStack {
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(action.isCompleted ? action.difficulty.color : .black.opacity(0.3), lineWidth: 2)
                        .frame(width: 24, height: 24)
                    if action.isCompleted {
                        Image(systemName: "checkmark")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundStyle(action.difficulty.color)
                            .transition(.scale.combined(with: .opacity))
                    }
                }
                
                // Content
                VStack(alignment: .leading, spacing: 8) {
                    // Title and description
                    VStack(alignment: .leading, spacing: 4) {
                        Text(action.title)
                            .font(.subheadline.weight(.medium))
                            .foregroundStyle(.black)
                        Text(action.description)
                            .font(.caption)
                            .foregroundStyle(.black.opacity(0.6))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    // Badges
                    HStack(spacing: 8) {
                        // Difficulty badge
                        HStack(spacing: 4) {
                            Image(systemName: action.difficulty.icon)
                                .font(.caption2)
                            Text(action.difficulty.rawValue)
                                .font(.caption2)
                        }
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(
                            Capsule()
                                .fill(action.difficulty.color.opacity(0.2))
                        )
                        .foregroundStyle(action.difficulty.color)
                        
                        // Impact badge
                        HStack(spacing: 4) {
                            Image(systemName: action.impact.icon)
                                .font(.caption2)
                            Text(action.impact.rawValue)
                                .font(.caption2)
                        }
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(
                            Capsule()
                                .fill(action.impact == .high ? Color.red.opacity(0.2) : 
                                      action.impact == .medium ? Color.orange.opacity(0.2) : 
                                      Color.blue.opacity(0.2))
                        )
                        .foregroundStyle(
                            action.impact == .high ? .red :
                            action.impact == .medium ? .orange :
                            .blue
                        )
                    }
                }
            }
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(action.isCompleted ? .black.opacity(0.05) : .white)
            )
        }
        .buttonStyle(.plain)
    }
}

//Models
enum ActionCategory: String, CaseIterable, Identifiable {
    case energy = "Energy"
    case transportation = "Transportation"
    case food = "Food & Diet"
    case waste = "Waste Reduction"
    case advocacy = "Advocacy"
    var id: String {rawValue} //so ForEach loop can access
        var title: String {rawValue}
        var icon: String{
            switch self{
            case .energy: return "bolt"
            case .transportation: return "car.fill"
            case .food: return "leaf.fill"
            case .waste: return "trash.fill"
            case .advocacy: return "megaphone.fill"
            }
        }
        var color: Color{
            switch self {
            case .energy: return .yellow
            case .transportation: return .blue
            case .food: return .green
            case .waste: return .orange
            case .advocacy: return .purple
            }
        }
    }
enum ActionDifficulty: String {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
    var color: Color{
        switch self{
        case .easy: return .green
        case .medium: return .orange
        case .hard: return .red
        }
    }
    var icon: String{
        switch self{
        case .easy: return "star"
        case .medium: return "star.leadinghalf.filled"
        case .hard: return "star.fill"
        }
    }
}
enum ActionImpact: String{
    case low = "Low Impact"
    case medium = "Medium Impact"
    case high = "High Impact"
    var icon: String{
        switch self{
        case .low: return "leaf"
        case .medium: return "leaf.fill"
        case .high: return "leaf.circle.fill"
        }
    }
}
struct ClimateAction: Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var category: ActionCategory
    var difficulty: ActionDifficulty
    var impact: ActionImpact
    var isCompleted: Bool
}
//view model
class ActionChecklistViewModel: ObservableObject {
    @Published var actions: [ClimateAction] = [
        //Energy Options
        ClimateAction(
            title: "Switch to LED light bulbs",
            description: "Replace incandescent bulbs with energy-efficient LED options.",
            category: .energy,
            difficulty: .easy,
            impact: .medium,
            isCompleted: false
        ),
        ClimateAction(
            title: "Wash Clothes in Cold Water",
            description: "Most of washing machine energy is used to heat water",
            category: .energy,
            difficulty: .easy,
            impact: .medium,
            isCompleted: false
        ),
        ClimateAction(
            title: "Seal Home Air Leaks",
            description: "Better insulation can reduce up to 20% in energy waste",
            category: .energy,
            difficulty: .medium,
            impact: .medium,
            isCompleted: false
        ),
        ClimateAction(
            title: "Install Solar Panels",
            description: "Solar panels cuts household emissions dramatically, especially in sunny states",
            category: .energy,
            difficulty: .hard,
            impact: .high,
            isCompleted: false
        ),
        //transportation
        ClimateAction(
            title: "Keep Tires Properly Inflated",
            description: "Improve fuel efficiency by 3-5%",
            category: .transportation,
            difficulty: .easy,
            impact: .low,
            isCompleted: false
        ),
        ClimateAction(
            title: "Drive Smoothly",
            description: "Gentle acceleration, anticipate braking, maintain steady speeds",
            category: .transportation,
            difficulty: .easy,
            impact: .low,
            isCompleted: false
        ),
        ClimateAction(
            title: "Carpool twice a week",
            description: "Cuts commute emissions and shares fuel cost",
            category: .transportation,
            difficulty: .medium,
            impact: .medium,
            isCompleted: false
        ),
        ClimateAction(
            title: "Consider an electric or hybrid vehicle",
            description: "Eliminates tailpipe emissions and reduces energy consumption",
            category: .transportation,
            difficulty: .hard,
            impact: .high,
            isCompleted: false
        ),
        //Food & Diet
        ClimateAction(
            title: "Drink Tap Instead of Bottled Water",
            description: "Bottled water requires energy for plastic production and transport",
            category: .food,
            difficulty: .easy,
            impact: .low,
            isCompleted: false
        ),
        ClimateAction(
            title: "Reduce Food Waste",
            description: "Food waste increases total agricultural energy use",
            category: .food,
            difficulty: .easy,
            impact: .medium,
            isCompleted: false
        ),
        ClimateAction(
            title: "Meal Prep",
            description: "Meal prepping reduces repeated energy use in food preparation",
            category: .food,
            difficulty: .medium,
            impact: .medium,
            isCompleted: false
        ),
        ClimateAction(
            title: "Go Mostly Plant-Based or Vegan",
            description: "Plant-based diets reduce agricultural energy demand",
            category: .food,
            difficulty: .hard,
            impact: .high,
            isCompleted: false
        ),
        //waste reduction
        ClimateAction(
            title: "Use Reusable Bags",
            description: "Bring reusable bags to reduce repeated manufacturing energy from single-use plastics",
            category: .waste,
            difficulty: .easy,
            impact: .low,
            isCompleted: false
        ),
        ClimateAction(
            title: "Recycle Properly",
            description: "Sort and recycle materials correctly to lower the energy required for producing new raw materials",
            category: .waste,
            difficulty: .easy,
            impact: .medium,
            isCompleted: false
        ),
        ClimateAction(
            title: "Repair Instead of Replace",
            description: "Extend product lifespan by repairing items to avoid energy-intensive manufacturing of new goods",
            category: .waste,
            difficulty: .medium,
            impact: .high,
            isCompleted: false
        ),
        ClimateAction(
            title: "Buy Secondhand When Possible",
            description: "Choose secondhand products to eliminate the energy required for new manufacturing",
            category: .waste,
            difficulty: .hard,
            impact: .high,
            isCompleted: false
        ),
        //Advocacy
        ClimateAction(
            title: "Stay Informed on Climate Policy",
            description: "Follow credible sources to understand current evnets",
            category: .advocacy,
            difficulty: .easy,
            impact: .low,
            isCompleted: false
        ),
        ClimateAction(
            title: "Vote in Elections",
            description: "Participate in local and national elections",
            category: .advocacy,
            difficulty: .easy,
            impact: .high,
            isCompleted: false
        ),
        ClimateAction(
            title: "Support Climate-Focused Organizations",
            description: "Contribute time, skills, or financial support to climate organizations",
            category: .advocacy,
            difficulty: .medium,
            impact: .high,
            isCompleted: false
        ),
        ClimateAction(
            title: "Participate in Community Climate Events",
            description: "Engage in community events that promote local sustainability and clean energy action",
            category: .advocacy,
            difficulty: .hard,
            impact: .high,
            isCompleted: false
        ),
    ]
    var totalActionsCount: Int{
        actions.count
    }
    var completedActionsCount: Int{
        actions.filter{action in return action.isCompleted}.count
    }
    // Filters master array by category - called in ForEach to give each section its own actions
    func actions(for category: ActionCategory) -> [ClimateAction] {
        actions.filter {action in return action.category == category}
    }
    
    // Finds the action by its UUID and flips isCompleted
    func toggleAction(_ action: ClimateAction) {
        if let index = actions.firstIndex(where: { $0.id == action.id }) {
            actions[index].isCompleted.toggle()
        }
    }
}
#Preview {
    ActionChecklistPage()
}
