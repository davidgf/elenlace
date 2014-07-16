// jQuery ->
//   if $('#infinite-scrolling').size() > 0
//     $(window).on 'scroll', ->
//       more_posts_url = $('.pagination .next_page a').attr('href')
//         if more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60
//             $('.pagination').html('<img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />')
//             $.getScript more_posts_url
//         return
//       return

$(function(){
    locked = false;
    if($('#infinite-scrolling').size() > 0){
        $(window).on('scroll', function(){
            var topLimit = $(document).height() - $(window).height() - 60;
            if($(window).scrollTop() >= topLimit){
                var more_posts_url = $('.pagination a.next_page').attr('href');
                if(more_posts_url && !locked){
                    locked = true;
                    $.ajax({
                        url: more_posts_url,
                        dataType: 'html',
                        beforeSend: function() {
                            $('#spinner').show()
                        },
                        success: function(data){
                                $('#infinite-scrolling').replaceWith(data);
                            },
                        complete: function(){
                            locked = false;
                            $('#spinner').hide()
                        }
                    });
                }
            }
        });
    }
});