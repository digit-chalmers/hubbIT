# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$.get '/stats/hours.json', (data) ->
		counts = []
		for i in [0..23]
			counts.push data[i] || 0

		sum = counts.reduce (a, b) -> a+b
		counts = counts.map (a) -> a/sum * 100

		source =
			labels: [0..23]
			datasets: [data: counts, fillColor: '#68d157', strokeColor: '#2b881c']
		options =
			barStrokeWidth: 5
			scaleOverride: true
			scaleStartValue: 0
			scaleSteps: 10
			scaleLabel: "<%=value%>%"
			scaleStepWidth: 10

		new Chart($('#chart')[0].getContext('2d')).Line(source, options)
