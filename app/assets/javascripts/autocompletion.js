//= require 'typeahead.bundle'

$(function(){

    var data = new Bloodhound({
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      local: $.map(window.autocomplete_source, function(name) { return { value: name }; })
    });
 
    // kicks off the loading/processing of `local` and `prefetch`
    data.initialize();

    function selectNameValue($el){
        $el.addClass('value-selected');
    };

    $('.typeahead').typeahead({
          hint: true,
          highlight: true,
          minLength: 1
        },
        {
          name: 'name',
          displayKey: 'value',
          source: data.ttAdapter()
        }
    ).keydown(function (event) {
        if (event.which == 13 || event.keyCode == 13) {
            event.preventDefault();
            return false;
        }
        else return true;
    }).on('typeahead:selected', function(e){
        $el = $(this);
        var $nameDiv = $el.parents('.table-attendee')
        var $nameSpan = $nameDiv.find('.typeahead-selected-value');
        $nameSpan.text($el.val());
        selectNameValue($nameDiv);

    });
});