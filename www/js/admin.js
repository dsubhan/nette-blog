function delete_post(id,name){
    let text = "Opravdu smazat "+name+"?\nOK?";
    if (confirm(text) == false) {
        return;
    }

    /*var form_data = new FormData();
    form_data.append('id',id);

    $.ajax({
        url: '',
        dataType: 'json', 
        cache: false,
        contentType: false,
        processData: false,
        data: form_data,                         
        type: 'post',
        success: function(php_script_response){
            alert(php_script_response);
        }, error: function (e) {
            alert("CHABA\nněco se nepovedlo...");
        } 
    });*/



}