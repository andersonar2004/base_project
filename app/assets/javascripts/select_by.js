var loadSelectBy = function($) {

  $('select.select_by').change(function(){
    //id pacial (attribute) do objeto a ser modificado
    fieldChange   = $(this).data('fieldChange');

    //Atributo do objeto atual
    selfAttribute = $(this).data('attribute');
    
    //Recupera o id real do objeto a ser modificado
    fieldChangeId = $(this).attr("id").replace(selfAttribute, fieldChange);
    
    options       = $("#"+fieldChangeId);
    indicator_id  = selfAttribute+"_indicator"
    indicator     = $(this).parent().children("img.indicator");
    
    if ( $(this).val() ) {
      url         = "/" + $(this).data('controller') + "/" + $(this).val() + "/" + $(this).data('action');

      indicator.attr('class', 'indicator img_indicator_enable');

      $.getJSON(url, function(result) {

        indicator.attr('class', 'indicator img_indicator_disable');
        options.html("")
        options.append($("<option />").val("").text(""));

        $.each(result, function() {
          options.append($("<option />").val(this.id).text(this.value));
        });
      })
    }else{
      options.html("")
    }
  });

}

jQuery(loadSelectBy);