$('#<%= invitation_html_id(@invitation) %>').remove()
$('.family_links').append('<%= j link_to_family(@family) %>')