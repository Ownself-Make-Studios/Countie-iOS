import SwiftUI

enum DefaultCountSinceBehavior: String, CaseIterable, Identifiable {
    case startOfYear = "Start of year"
    case startOfMonth = "Start of month"
    case sameDayLastYear = "Same day/time last year"
    case now = "Now (default)"
    
    var id: String { self.rawValue }
}

enum ChangeCountdownWhenCalendarEventChangedOption: String, CaseIterable, Identifiable {
    case dontChange = "Don't Change"
    case change = "Change (default)"
    
    var id: String { self.rawValue }
}

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @AppStorage("showProgress") private var showProgress: Bool = true
    @AppStorage("defaultCountSinceBehavior") private var defaultCountSinceBehaviorRaw: String = DefaultCountSinceBehavior.now.rawValue
    @AppStorage("defaultCountdownTimeToggle") private var defaultCountdownTimeToggle: Bool = false
    @AppStorage("changeCountdownWhenCalendarEventChanged") private var changeCountdownWhenCalendarEventChangedRaw: String = ChangeCountdownWhenCalendarEventChangedOption.change.rawValue
    
    
    
    var defaultCountSinceBehavior: DefaultCountSinceBehavior {
        get { DefaultCountSinceBehavior(rawValue: defaultCountSinceBehaviorRaw) ?? .now }
        set { defaultCountSinceBehaviorRaw = newValue.rawValue }
    }
    
    var body: some View {
        NavigationView {
            Form {
                //                VStack(spacing: 12) {
                //                    Image("AppIcon")
                //                        .resizable()
                //                        .frame(width: 64, height: 64)
                //                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                //                    Text("Countie")
                //                        .font(.largeTitle)
                //                        .fontWeight(.bold)
                //                        .foregroundColor(.black)
                //                }
                //                .frame(maxWidth: .infinity)
                //                .padding()
                //                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                //                .padding(.vertical, 8)
                
                Section(header: Text("Appearance")) {
                    Toggle(isOn: $isDarkMode) {
                        Label("Dark Mode", systemImage: "moon.fill")
                    }
                    
                    VStack(spacing: 10){
                        
                    Toggle(isOn: $showProgress) {
                        Label("Show Progress", systemImage: "clock.badge.questionmark.fill")
                    }
                    
                    Text("Progress shows how much time has passed since \"Count Since\" date.")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity)
                    }
                }
                
                
                
//                Section(header: Text("Default Behaviors")) {
//                    Picker("Count since behavior", selection: $defaultCountSinceBehaviorRaw) {
//                        ForEach(DefaultCountSinceBehavior.allCases) { behavior in
//                            Text(behavior.rawValue).tag(behavior)
//                        }
//                    }
//                    
//                    Picker("Change countdown when calendar event changes", selection: $changeCountdownWhenCalendarEventChangedRaw) {
//                        ForEach(ChangeCountdownWhenCalendarEventChangedOption.allCases) { option in
//                            Text(option.rawValue).tag(option.rawValue)
//                        }
//                    }
//                    
//                    Toggle(isOn: $defaultCountdownTimeToggle) {
//                        Text("Include time by default")
//                    }
//                }
//                
                Section(header: Text("Support & Feedback")) {
                    Link(destination: URL(string: "https://github.com/your-repo/issues/new?template=bug_report.md")!) {
                        Label("Submit Bug Issue", systemImage: "ladybug.circle")
                    }
                    Link(destination: URL(string: "mailto:support@yourapp.com")!) {
                        Label("Contact Developers", systemImage: "envelope.fill")
                    }
//                    Text("Tip: You can long-press a countdown to quickly edit or delete it!")
//                        .font(.footnote)
//                        .foregroundColor(.secondary)
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
