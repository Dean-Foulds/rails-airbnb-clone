$('.tabs').each(function(){

  var $self = $(this),
      selectedOpt = 0,
      currentClass = 'is--active',
      accessible = $('main').data('accessible');

  // Set defaults
  if(accessible){
    $self.find('.tabs-nav-option').eq(selectedOpt).attr('aria-selected','true');
  }
  $self.find('.tabs-nav-option').eq(selectedOpt).addClass(currentClass);
  $self.find('.tabs-panel').eq(selectedOpt).addClass(currentClass);

  // Define interaction behaviour
  $self.find('.tabs-nav-option').click(function(e){
    var optionId = $(this).data('href');

    // Reset
    if(accessible){
      $self.find('.tabs-nav-option').removeAttr('aria-selected');
    }
    $self.find('.tabs-panel').removeClass(currentClass);
    $self.find('.tabs-nav-option').removeClass(currentClass);

    // Set current tab
    if(accessible){
      $(this).attr('aria-selected','true');
    }
    $(this).addClass(currentClass);
    $self.find(optionId).addClass(currentClass);
    e.preventDefault();

  });

});
