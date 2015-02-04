"use strict";

jQuery(function(){
  jQuery('.buttons.examples .button').click(function(e){
        e.preventDefault();
        var parent = jQuery(this).closest('body');
        var target = jQuery(this).attr('target');

        parent.find('.example').hide();
        parent.find('.example.'+target).show();
        parent.find('.buttons.examples .button.active').removeClass('active');
        parent.find('.buttons.examples .button[target="'+target+'"]').addClass('active');
  });


  jQuery('.buttons.examples li:first-child .button').click();
});
