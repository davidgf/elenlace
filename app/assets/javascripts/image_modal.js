$(function(){
    var customModal = $(
        '<div class="modal fade" id="image-modal"> \
          <div class="modal-dialog"> \
            <div class="modal-content"> \
              <div class="modal-header"> \
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> \
              </div> \
              <div class="modal-body"> \
                <img class="center-block img-responsive"></img> \
              </div> \
            </div> \
          </div> \
        </div>');

    $('img.media-picture').click(function(){
        var originalUrl = $(this).data('original');
        if(originalUrl){
            if(!$('#image-modal').length)
                $('body').append(customModal);
            var $modal = $('#image-modal');
            var spinnerUrl = '/assets/spinner.gif';
            $modal.find('img').attr('src', spinnerUrl);
            $modal.find('img').attr('src', originalUrl);
            $modal.modal('show');
        }
    });

})
