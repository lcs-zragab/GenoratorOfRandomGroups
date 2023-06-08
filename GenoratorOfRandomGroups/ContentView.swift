import SwiftUI

struct NumberEntry: Identifiable {
    let id = UUID()
    let name: String
    let number: Int
}

struct ContentView: View {
    @State private var upperBound: Int = 100
    @State private var randomNumberEntries: [NumberEntry] = []

    var body: some View {
        VStack {
            List(randomNumberEntries) { entry in
                VStack(alignment: .leading) {
                    Text("Name: \(entry.name)")
                    Text("Number: \(entry.number)")
                }
            }

            HStack {
                Text("Upper Bound:")
                TextField("Enter upper bound", value: $upperBound, formatter: NumberFormatter(), onCommit: {
                    generateRandomNumber()
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            }
            TextField("enter person name")

            Button("Generate Random Number") {
                generateRandomNumber()
            }
            .padding()
        }
        .padding()
    }

    private func generateRandomNumber() {
        let randomName = "Name \(randomNumberEntries.count + 1)"
        let randomNumber = Int.random(in: 1...upperBound)
        let entry = NumberEntry(name: randomName, number: randomNumber)
        randomNumberEntries.append(entry)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
