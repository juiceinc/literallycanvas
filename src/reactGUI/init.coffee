React = require './React-shim'

createToolButton = require './createToolButton'
Options = require './Options'
Picker = require './Picker'


init = (pickerElement, optionsElement, lc, tools, imageURLPrefix) ->
  toolButtonComponents = tools.map (ToolClass) ->
    toolInstance = new ToolClass()
    if lc.showToolbar
	    createToolButton
	      displayName: toolInstance.name
	      imageName: toolInstance.iconName
	      getTool: -> toolInstance
    else
      lc.tools.push(toolInstance)

  if lc.showToolbar
    React.renderComponent(Picker(
      {lc, toolButtonComponents, imageURLPrefix}), pickerElement)
    React.renderComponent(Options({lc, imageURLPrefix}), optionsElement)


module.exports = init