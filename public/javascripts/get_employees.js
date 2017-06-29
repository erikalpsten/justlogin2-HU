$("#policy_user_id").change(function(){
    var url = '/populate_employees?user_id=' + $(this).val() + ''
  $.ajax({
    url: url,
    dataType: 'html',
    type: 'GET',
    success: function(data){
      var listitems = [];
      $('#policy_employee_id').children().remove();
      data = $.parseJSON(data);
      $.each(data, function(key, value) {
        listitems += '<option value='+ value.id + '>' + value.name + '</option>'
      });
      $('#policy_employee_id').append(listitems);
    }
  });
})
