@Event = React.createClass
  getInitialState: ->
    edit: false

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit
  
  handleDelete: (e) ->
    e.preventDefault()
    if confirm "Are you sure?"
      $.ajax
        method: 'DELETE'
        url: "/events/#{ @props.event.id }"
        dataType: 'JSON'
        success: () =>
          @props.handleDeleteEvent @props.event

  handleEdit: (e) ->
    e.preventDefault()
    data = 
      title: React.findDOMNode(@refs.title).value
      date: React.findDOMNode(@refs.date).value
      place: React.findDOMNode(@refs.place).value
      description: React.findDOMNode(@refs.description).value
    $.ajax
      method: 'PUT'
      url: "/events/#{ @props.event.id }"
      dataType: 'JSON'
      data:
        event: data
      success: (data) =>
        @setState edit: false
        @props.handleEditEvent @props.event, data

  eventRow: ->
    React.DOM.tr null,
      React.DOM.td null, @props.event.title
      React.DOM.td null, @props.event.date
      React.DOM.td null, @props.event.place
      React.DOM.td null, @props.event.description
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleToggle
          'Edit'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'

  eventForm: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.event.title
          ref: 'title'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.event.date
          ref: 'date'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.event.place
          ref: 'place'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.event.description
          ref: 'description'
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleEdit
          'Update'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleToggle
          'Cancel'

  render: ->
    if @state.edit
      @eventForm()
    else
      @eventRow()