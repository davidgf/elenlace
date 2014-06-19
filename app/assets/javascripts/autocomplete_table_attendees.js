$(function(){

    var data = new Bloodhound({
      local: window.autocomplete_source,
      datumTokenizer: function(d) {
        return Bloodhound.tokenizers.whitespace(d.label); 
      },
      queryTokenizer: Bloodhound.tokenizers.whitespace    
    });
 
    // kicks off the loading/processing of `local` and `prefetch`
    data.initialize();

    var options = {
          hint: true,
          highlight: true,
          minLength: 1
        };

    var source = {
          name: 'name',
          displayKey: 'label',
          source: data.ttAdapter()
        };

    function selectNameValue($el){
        $el.addClass('value-selected');
    };

    function addAutocompleteHandlers($el){
      $el.typeahead(options, source).keydown(function (event) {
          if (event.which == 13 || event.keyCode == 13) {
              event.preventDefault();
              return false;
          }
          else return true;
      }).on('typeahead:selected', function(e, datum){
          $el = $(this);
          var $nameDiv = $el.parents('.table-attendee')
          parent = $nameDiv;
          var $nameSpan = $nameDiv.find('.typeahead-selected-value span');
          var $nameHidden = $nameDiv.find('.selected-value-hidden');
          $nameSpan.text(datum.label);
          $nameHidden.val(datum.value);
          selectNameValue($nameDiv);
      });
    }

    addAutocompleteHandlers($('.typeahead'));

    $('a.add-new-attendee').click(function(){
      var lastAttendee = $('div.table-attendee').last();
      var $newAttendeeHtml = $($('#new-attendee-template').html());
      lastAttendee.after($newAttendeeHtml);
      addAutocompleteHandlers($newAttendeeHtml.find('.typeahead'));
    });

    $('body').on('click', 'a.remove-attendee', function(ev){
      $(this).parents('div.table-attendee').remove();
    });
});