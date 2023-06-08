import SwiftUI

struct NumberEntry: Identifiable {
    let id = UUID()
    let name: String
    let number: Int
}

struct ContentView: View {
    @State private var upperBound: Int = 100
    @State private var randomNumberEntries: [NumberEntry] = []
    @State var name = ""
    var body: some View {
        VStack {
            List(randomNumberEntries) { entry in
                VStack(alignment: .leading) {
                    Text("Name: \(entry.name)")
                    Text("Group: \(entry.number)")
                }
            }

            HStack {
                Text("Number of Groups:")
                TextField("Enter upper bound", value: $upperBound, formatter: NumberFormatter(), onCommit: {
                    generateRandomNumber()
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            }
            TextField("enter person name", text: $name)

            Button("Generate Random Number") {
                generateRandomNumber()
            }
            .padding()
        }
        .padding()
    }

    private func generateRandomNumber() {
        let randomName = name
        let randomNumber = Int.random(in: 1...upperBound)
        let entry = NumberEntry(name: randomName, number: randomNumber)
        randomNumberEntries.append(entry)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(name: "the")
    }
}
