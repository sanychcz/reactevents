@Events = React.createClass
	getInitialState: ->
		events: @props.data

	getDefaultProps: ->
		events: []

	addEvent: (event) ->
		events = React.addons.update(@state.events, { $push: [event] })
		@setState events: events
  
  deleteEvent: (event) ->
  	index = @state.events.indexOf event
  	events = React.addons.update(@state.events, { $splice: [[index, 1]] })
  	@replaceState events: events

  updateEvent: (event, data) ->
  	index = @state.events.indexOf event
  	events = React.addons.update(@state.events, { $splice: [[index, 1, data]] })

	render: -> 
		React.DOM.div
			className: 'container'
			React.DOM.div
				className: 'events'
				React.DOM.h2
					className: 'title'
					'Events'
				React.createElement EventForm, handleNewEvent: @addEvent
				React.DOM.hr null
				React.DOM.table
					className: 'table table-bordered'
					React.DOM.thead null,
						React.DOM.tr null,
							React.DOM.th null, 'Title'
							React.DOM.th null, 'Date'
							React.DOM.th null, 'Place'
							React.DOM.th null, 'Description'
							React.DOM.th null, 'Actions'
					React.DOM.tbody null,
						for event in @state.events
							React.createElement Event, key: event.id, event: event, handleDeleteEvent: @deleteEvent, handleEditEvent: @updateEvent