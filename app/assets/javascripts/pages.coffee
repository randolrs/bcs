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

$(document).on('turbolinks:load', ready)
