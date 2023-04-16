//
//  ContentView.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 3/12/23.
//

import SwiftUI

struct ContentView: View {
	
	enum DataType {
		case noSubtext(hasIcons: Bool)
		case hasSubtext
	}
	
	@State private var dataType: DataType = .noSubtext(hasIcons: true)
	
	@State private var option1: MenuItem? = nil
	@State private var option2: MenuItem? = nil
	@State private var option3: MenuItem? = nil
	
	let notifications: [MenuItem] = [
		.init(
			title: "Watching",
			subtext: "You will be notified of every new reply in this topic, and a count of new replies will be shown.",
			iconName: "bell.badge.fill",
			tint: .iconBlue
		),
		.init(
			title: "Tracking",
			subtext: "A count of new replies will be shown for this topic. You will be notified if someone mentions your @name or replies to you.",
			iconName: "bell.fill",
			tint: .iconPink
		),
		.init(
			title: "Normal",
			subtext: "You will be notified if someone mentions your @name or replies to you.",
			iconName: "bell",
			tint: .textSecondary
		),
		.init(
			title: "Muted",
			subtext: "You will never be notified of anything about this topic, and it will not appear in latest.",
			iconName: "bell.slash",
			tint: .textSecondary
		)
	]
	
	let hobbyCategories1: [MenuItem] = [
		.init(title: "Listening to Music", iconName: "headphones"),
		.init(title: "Going to the Movies", iconName: "ticket.fill"),
		.init(title: "Playing Games", iconName: "gamecontroller.fill"),
		.init(title: "Stand-up Comedy", iconName: "music.mic"),
		.init(title: "Photography", iconName: "camera.fill"),
		.init(title: "Reading", iconName: "books.vertical.fill"),
		.init(title: "Cycling", iconName: "bicycle"),
		.init(title: "Traveling", iconName: "tram.fill"),
		.init(title: "Investing", iconName: "bitcoinsign.square.fill")
	]
	
	let hobbyCategories2: [MenuItem] = [
		.init(title: "Listening to Music"),
		.init(title: "Going to the Movies"),
		.init(title: "Playing Games"),
		.init(title: "Stand-up Comedy"),
		.init(title: "Photography"),
		.init(title: "Reading"),
		.init(title: "Cycling"),
		.init(title: "Traveling"),
		.init(title: "Investing"),
	]
	
	// MARK: - Body
	
	var body: some View {
		NavigationView {
			ScrollView {
				VStack(spacing: 24) {
					Group {
						DropdownMenu(
							title: menuTitle.0,
							placeholder: "Choose an option",
							menuItems: items,
							selectedItem: $option1,
							excludedItems: option1, option2, option3
						)
						.iconTint(.iconGreen)
						
						DropdownMenu(
							title: menuTitle.1,
							placeholder: "Choose an option",
							menuItems: items,
							selectedItem: $option2,
							excludedItems: option1, option2, option3
						)
						.iconTint(.iconBlue)
						
						DropdownMenu(
							title: menuTitle.2,
							placeholder: "Choose an option",
							menuItems: items,
							selectedItem: $option3,
							excludedItems: option1, option2, option3
						)
						.iconTint(.iconPink)
					}
					.showExcludedItemsAsDisabled()
					
					Spacer()
				}
				.padding()
			}
			.navigationTitle("Settings")
			.background(Color.bgPrimary.ignoresSafeArea())
		}
	}
	
	var items: [MenuItem] {
		switch dataType {
		case .noSubtext(hasIcons: let hasIcons):
			return hasIcons ? hobbyCategories1 : hobbyCategories2
		case .hasSubtext:
			return notifications
		}
	}
	
	var menuTitle: (String, String, String) {
		switch dataType {
		case .noSubtext(_):
			return (
				"First favorite hobby",
				"Second favorite hobby",
				"Third favorite hobby"
			)
		case .hasSubtext:
			return (
				"Notification for Topics",
				"Notification for Categories",
				"Notification for Groups"
			)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
