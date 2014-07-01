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

          function addAutocompleteHandlers($el){
            $el.typeahead(options, source).keydown(function (event) {
                if (event.which == 13 || event.keyCode == 13) {
                    event.preventDefault();
                    return false;
                }
                else return true;
            }).on('typeahead:selected', function(e, datum){
                $('#partner-id').val(datum.value);
            });
          }

          addAutocompleteHandlers($('.typeahead'));
          });