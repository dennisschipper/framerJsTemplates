# Create a new scroller to hold our layers
scroller = new ScrollComponent
	width: Screen.width
	height: Screen.height
	backgroundColor: "#96C2B6"
	scrollHorizontal: false

# Set a default starter background for our layers
background = "#96C2B6"
# Set a counter to counter the Y position of the layers 
counter = 0
# Start a loop
for item in [1..20]
	layer = new Layer # For each loop, create a layer
		name: "layer_" + item # Give each generated layer a unique name
		parent: scroller.content
		width: Screen.width
		height: 140
		x: Screen.width * -1 # Place the layer exactly off screen
		y: counter
		backgroundColor: background
	counter = counter + 144 # On every loop, add the height of the element to the counter, plus a gap
	background = new Color(background).darken(2.5) # On every loop, darken the background color by just a bit

# Out base delay counter
delayCount = 0
# Loop between all the elements in scroller
for item in scroller.content.children
	item.animate # Animate it
		time: 0.4
		delay: delayCount # Add a delay
		properties:
			x: 0
		curve: "ease-in-out"
	delayCount = delayCount + 0.15 # Add a bit more to the delay for the nexr layer in the loop
