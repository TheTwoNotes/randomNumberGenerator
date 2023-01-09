//
//  ContentView.swift
//  RandomNumberGenerator
//
//  Created by Gil Estes on 1/9/23.
//

import SwiftUI

struct ContentView: View {
	// Struct ContentView: View {
	@State private var maxValue = ""
	@State private var generatedNumber = 0
	
	var copyrightText: String = {
		let copyrightSymbol = "\u{00A9}"
		
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy"
		let currentYear = formatter.string(from: Date())
		
		let businessName = " BGE Software, Inc."
		return copyrightSymbol + currentYear + businessName
	}()
	
	var body: some View {
		VStack {
			Text("Random Number Generator").font(.title)
				.padding()
				.foregroundColor(.blue)
			Spacer()
			Text("Max Value: (Default is 100)")
			// User text entry field for a max number value
			TextField("Enter a number or 100", text: $maxValue)
				.frame(width: UIScreen.main.bounds.width * 0.5, height: 25)
				.keyboardType(.numberPad)
				.textFieldStyle(RoundedBorderTextFieldStyle())
				.multilineTextAlignment(.center)
				.padding()
			
			// Generate a random number between 1 and the max value entered by the user
			Button(action: {
				self.generatedNumber = Int.random(in: 1..<convert(string: self.maxValue))
			}) {
				Text("Generate")
					.foregroundColor(.white)
					.padding()
			}
			.background(Color.green)
			.cornerRadius(15)
			.overlay(RoundedRectangle(cornerRadius: 15.0)
				.stroke(Color.green, lineWidth: 5)
			)
			
			Spacer()
			// Update the generatedNumber value and display it
			Text("\(generatedNumber)")
				.font(.system(size: 100.0))
			Text("Generated Number")
			
			Spacer()
			Text(copyrightText).font(.caption)
			
		}
	}
	
	
	
	func convert(string: String) -> Int {
		// Initialize an int value based on string and use a guard statement to check if it succeeds
		guard let intValue = Int(string) else {
			maxValue = "100"
			return 100
		}
		
		// Guard statement to check if the number is greater than the minimum
		guard intValue > 1 else {
			maxValue = "100"
			return 100
		}
		
		// Return intValue if it succeeds
		return intValue
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
