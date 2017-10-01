# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  jQuery ->

    $(".click-to-slide-down").click (window.event), ->
      targetId = "#" + $(@).data("slide-down-id")
      $('body').find(targetId).slideDown()

    $(".hide-on-click").click (window.event), ->
      $(@).fadeOut()

    $('form').on 'click', '.remove_fields', (event) ->
      $(@).parent().find('input.destroy-item').prop('checked', true)
      $(@).parent('fieldset').hide()
      event.preventDefault()

    $('form').on 'click', '.add_fields', (event) ->
      time = new Date().getTime()
      regexp = new RegExp($(this).data('id'), 'g')
      $(@).before($(this).data('fields').replace(regexp, time))
      event.preventDefault()

$(document).on('turbolinks:load', ready)
