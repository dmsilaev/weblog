$(document).ready ->
  #nested_comments
  comment_form = $("#new_story_comment")
  nested_comment_link = $(".nested_comment")
  comment_link = $(".comment_link")
  parent_field = $("#story_comment_parent_id")

  nested_comment_link.click ->
    $(this).parent().parent().next().after comment_form
    comment_link.show()
    parent_field.val $(this).attr("data_id")

  comment_link.click ->
    $(this).after comment_form
    comment_link.hide()
    parent_field.val $(this).attr("")