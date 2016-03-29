Screen.backgroundColor = "#f5f5f6"

# Main scrollable container
navTabs = new ScrollComponent
	width: Screen.width
	height: 150
	x: 0
	y: 0
	backgroundColor: "none"
	scrollVertical: false
	shadowY: 2
	shadowBlur: 0
	shadowSpread: 0
	shadowColor: "rgba(0, 0, 0, 0.1)"


# Add a few buttons to the scroll bar
btn1 = new Layer
	parent: navTabs.content
	html: "Messages"
	width: 300
	x: 0

btn2 = new Layer
	parent: navTabs.content
	html: "My Contact Settings"
	width: 500
	x: 310
	
btn3 = new Layer
	parent: navTabs.content
	html: "Account Details"
	width: 400
	x: 820

btn4 = new Layer
	parent: navTabs.content
	html: "Connected Apps"
	width: 500
	x: 1230

for item in navTabs.content.children
	item.height = navTabs.height
	item.backgroundColor = "#f9f9f9"
	item.style =
		"text-align" : "center"
		"color" : "rgba(0, 0, 0, 0.7)"
		"font-size" : "42px"
		"padding-top" : "58px"

# The horizontal bar marking the active tab
activeTabMark = new Layer
	parent: navTabs.content
	y: navTabs.height - 10
	height: 10
	width: btn1.width
	backgroundColor: "#ffcc44"

# Loop around all the navTabs children and add a tap event to each
# This also adds it to activeTabMark but we don't mind that either way
for item in navTabs.content.children
	item.on Events.TapEnd, (event, target) =>
		activeTabMark.animate
			time: 0.4
			properties:
				x: target.x
				width: target.width
