$(function(){
    $(document).on('click', '.load-comments', function(ev){
        ev.preventDefault();
        var $link = $(this);
        var url = $link.attr('href');
        var $comments = $link.siblings('.comments');
        var $hideComments = $link.siblings('.hide-comments');
        $.ajax({
            url: url,
            success: function(data) {
                $comments.html(data).show();
                $link.hide();
                $hideComments.show();
            }
        })
    });

    $(document).on('click', '.hide-comments', function(ev){
        ev.preventDefault();
        $(this).hide();
        $(this).siblings('.comments').hide();
        $(this).siblings('.load-comments').show();
    });
});