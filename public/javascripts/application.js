jQuery.fn.submitWithAjax = function(){
    this.live('submit', function(){
        $.ajax({
            url: this.action,
            data: $(this).serialize(),
            type: this.method,
            dataType: "script"
        });
        return false;
    })
    return this;
};

jQuery.fn.submitNow = function(){
    $.ajax({
        url: $(this).attr('action'),
        data: $(this).serialize(),
        type: this.method,
        dataType: "script"
    });
    return false;
};

jQuery.fn.labelsWithinFields = function(){
    $(this).addClass('labels-within-fields')
    $(this).find('input[type=text], textarea').each(function(){
        $(this).prev('label').css('position', 'absolute').css('color', '#ccc').css('width', 'auto').css('padding', '2px 4px')
        $(this).focus(function(){
            $(this).prev('label').hide();
        }).blur(function(){
            if (this.value == "") {
                $(this).prev('label').show();
            }
        })
        if (this.value != "") {
            $(this).prev('label').hide();
        }
    })
}

$(document).ready(function(){
    $('.colorbox').colorbox();
    
    $('#comments .comment a.quote').live('click', function(){
        $.get($(this).attr('href'), {}, null, 'script');
        return false;
    })
    $('form#new_comment').submit(function() {
      $(this).addClass("loading");
      var self = this;
      $.post($(this).attr("action"), $(this).serialize(), function() {
        $(self).removeClass("loading");
      }, 'script')
      return false;
    });
    
    $('#comments .comment .comment-header').live('click', function(){
        $(this).closest('.comment').find('.short-message').toggle();
        $(this).closest('.comment').find('.comment-body').toggle();
    });
    $('#comments .comment').each(function(i){
        if ($('#comments .comment').length - i > 1) {
            $(this).find('.short-message').show();
            $(this).find('.comment-body').hide();
        }
    });
    
});

$('document').ready(function(){

    $("#flash").hide();
    var flash_message = $("#flash").html();
    if ($.trim(flash_message) != "") {
        notify(flash_message);
    }
    
	$('#show_main_form').hide();
	
    $('#hide_main_form').click(function(){
        $('#main_form').hide();
        $('#hide_main_form').hide();
        $('#show_main_form').show();
        return false;
    })
    
    $('#show_main_form').click(function(){
        $('#main_form').show();
        $('#show_main_form').hide();
        $('#hide_main_form').show();
        return false;
    })
    
    //    $.ajaxSetup({
    //        'beforeSend': function(xhr){
    //            xhr.setRequestHeader("Accept", "text/xml")
    //        }
    //    });
    //    
    //    $(".ajax_link").click(function(){
    //        var target_div = $(this).attr("target_div");
    //        target_div = "#" + target_div;
    //        var controller = $(this).attr("controller");
    //        var action = $(this).attr("action");
    //        var id = $(this).attr("id");
    //        var home_page = $(this).attr("home_page");
    //        var modul_status = $(this).attr("modul_status");
    //        var user_id = $(this).attr("user_id");
    //        var page_title = $(this).attr("page_title");
    //        var initiator = $(this).attr("initiator");
    //        var due_date = $(this).attr("due_date");
    //        var assign_to = $(this).attr("assign_to");
    //        var chapter_id = $(this).attr("chapter_id");
    //        var parent_id = $(this).attr("parent_id");
    //        var blog_type = $(this).attr("blog_type");
    //        
    //        if (id === undefined) 
    //            id = "";
    //        if (user_id === undefined) 
    //            user_id = "";
    //        if (chapter_id === undefined) 
    //            chapter_id = "";
    //        if (parent_id === undefined) 
    //            parent_id = "";
    //        if (modul_status === undefined) 
    //            modul_status = "";
    //        if (initiator === undefined) 
    //            initiator = "";
    //        if (assign_to === undefined) 
    //            assign_to = "";
    //        if (due_date === undefined) 
    //            due_date = "";
    //        if (blog_type === undefined) 
    //            blog_type = "";
    //        
    //        $(target_div).html("<img src='/images/ajax-loader.gif' /></p>");
    //        
    //        $.ajax({
    //            type: "POST",
    //            url: "/" + controller + "/" + action,
    //            data: "id=" + id + "&home_page=" + home_page + "&modul_status=" + modul_status +
    //            "&user_id=" +
    //            user_id +
    //            "&page_title=" +
    //            page_title +
    //            "&initiator=" +
    //            initiator +
    //            "&due_date=" +
    //            due_date +
    //            "&assign_to=" +
    //            assign_to +
    //            "&chapter_id=" +
    //            chapter_id +
    //            "&parent_id=" +
    //            parent_id +
    //            "&blog_type=" +
    //            blog_type,
    //            timeout: 5000,
    //            success: function(msg){
    //                $(target_div).html(msg);
    //            },
    //            error: function(xhrObj){
    //                $(target_div).html("responseText: " + xhrObj.responseText + "\n" +
    //                "responseXML: " +
    //                xhrObj.responseXML +
    //                "\n" +
    //                "readyState: " +
    //                xhrObj.readyState +
    //                "\n" +
    //                "status: " +
    //                xhrObj.status +
    //                "\n" +
    //                "statusText: " +
    //                xhrObj.statusText);
    //            }
    //        });
    //        
    //        return false;
    //    });
    //    
    //    $(".pagination a").live("click", function(){
    //    
    //        var options = {
    //            target: '#content_60',
    //            dataType: 'script'
    //        };
    //        
    //        $(".pagination").html("Loading...");
    //
    //		var href = $(this).attr("href");
    //        var x = href.split("?");
    //		
    //		$.ajax({
    //            type: "POST",
    //            url: x[0],
    //            data: x[1] + "&chapter_id=dummy",
    //            timeout: 5000,
    //            success: function(msg){
    //                $("#content_60").html(msg);
    //            },
    //            error: function(xhrObj){
    //                $("#content_60").html("responseText: " + xhrObj.responseText + "\n" +
    //                "responseXML: " +
    //                xhrObj.responseXML +
    //                "\n" +
    //                "readyState: " +
    //                xhrObj.readyState +
    //                "\n" +
    //                "status: " +
    //                xhrObj.status +
    //                "\n" +
    //                "statusText: " +
    //                xhrObj.statusText);
    //            }
    //        });
    //		
    //        return false;
    //    });
});

function notify(flash_message){
    // jQuery: reference div, load in message, and fade in
    var flash_div = $("#flash");
    $("#flash").corner("50px");
    flash_div.html(flash_message);
    flash_div.fadeIn(400);
    // use Javascript timeout function to delay calling
    // our jQuery fadeOut, and hide
    setTimeout(function(){
        flash_div.fadeOut(4000, function(){
            flash_div.html("");
            flash_div.hide()
        })
    }, 1400);
}