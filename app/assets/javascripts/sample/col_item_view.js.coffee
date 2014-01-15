#= require sample/col_item_template
class App.ColItemView extends Backbone.View

  tagName: 'td'
  className: 'ISUEE-VALUE'

  initialize: (options)->
    @model = options.model
    @key = options.key
    @render()

  events: ->
    'click' : 'onClick'
    'focusout textarea' : 'onFocusOut'

  onClick: ->
    @toEditMode()

  onFocusOut: ->
    val=  @$('[name=input-form]').val()
    @model.set( @key , val )

    if @model.changed
      @model.save( )
    @render()


  toEditMode: ->
    @$('.show').addClass('hide')
    @$('.edit').removeClass('hide')
    @$('textarea').focus()


  render: ->
    #  @$el.children().remove()
    @$el.html @template( { options: { issue: @model.attributes, key: @key }} )

  template: JST['sample/col_item_template']
