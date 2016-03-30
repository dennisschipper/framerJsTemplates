scroller = new ScrollComponent
	width: Screen.width
	height: Screen.height
	scrollHorizontal: false
	backgroundColor: "#f9f9f9"

xhr = new XMLHttpRequest()
xhr.open("GET", "http://jsonplaceholder.typicode.com/users", true)
xhr.onload = ->
	buildList(JSON.parse(xhr.responseText))

xhr.send(null)


buildList = (response) ->
	counter = 0
	
	for item in response
		item = new Layer
			parent: scroller.content
			name: "item_" + item.id
			width: Screen.width
			height: 100
			x: 0
			y: counter
			backgroundColor: "#fff"
			html: item.username
			style:
				"color" : "#333"
				"font-size" : "1.4em"
				"padding-left" : "30px"
				"padding-top" : "34px"
		counter = counter + 110
			