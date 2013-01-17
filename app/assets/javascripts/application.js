// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap
//= require_tree .

$(document).ready(function(){

    $('div.ribbon').click(function(){
        if($(this).css('margin-top') == '-70px') {
            $(this).addClass('disabled');
            $(this).animate({
                'margin-top': '-10px'
            }, 500, function() {
                $(this).removeClass('disabled');
            });
        } else {
            $(this).addClass('disabled');
            $(this).animate({
                'margin-top': '-70px'
            }, 500, function() {
                $(this).removeClass('disabled');
            });
        }
    });

    //Sortable function..
    $(function() {
        $("ul.sortable").sortable({ opacity: 0.6, cursor: 'move', tolerance: 'pointer', axis: 'y', helper: 'clone',  update: function() {
            var order = $(this).sortable("serialize") + '&action=updateRecordsListings&table=' + $(this).data('table') + '&therapy_id=' + $(this).data('therapy');
            $.post(site_url('exercises/update_order'), order, function(theResponse){
                //$("#contentRight").html(theResponse);
            });
        }});
    });

    $("input[data-suggestions='true']").keyup(function(){
        $.getJSON(site_url($(this).data('action') + '?term=' + $(this).val()), function(data) {
            $('#exisiting-exercises-container').html('');
            $.each(data, function(index, element){
                $('#exisiting-exercises-container').append(new Option(element.name, element.id));
            });
        });
    });

    $("input[data-suggesttherapy='true']").keyup(function(){
        $.getJSON(site_url($(this).data('action') + '?term=' + $(this).val()), function(data) {
            $('#suggest-therapy-container').html('');
            $.each(data, function(index, element){
                $('#suggest-therapy-container').append(new Option(element.name, element.id));
            });
        });
    });



    $("input.date_picker").datepicker({
    dateFormat: "yy-mm-dd"
  });

    $('[title]').tooltip({
        placement: 'top'
    });

    $('input[placeholder]').tooltip({
        trigger: 'focus',
        placement: 'top'
    });

    $('textarea[placeholder]').tooltip({
        trigger: 'focus',
        placement: 'top'
    });

    $('[placeholder]').focus(function() {
        var input = $(this);
        if (input.val() == input.attr('placeholder')) {
            input.val('');
            input.removeClass('placeholder');
        }
    }).blur(function() {
            var input = $(this);
            if (input.val() == '' || input.val() == input.attr('placeholder')) {
                input.addClass('placeholder');
                input.val(input.attr('placeholder'));
            }
        }).blur().parents('form').submit(function() {
            $(this).find('[placeholder]').each(function() {
                var input = $(this);
                if (input.val() == input.attr('placeholder')) {
                    input.val('');
                }
            })
        });


    var sampleTags = ['c++', 'java', 'php', 'coldfusion', 'javascript', 'asp', 'ruby', 'python', 'c', 'scala', 'groovy', 'haskell', 'perl', 'erlang', 'apl', 'cobol', 'go', 'lua'];

    $('.tags').tagsInput({
        autocomplete_url: site_url('therapies/autocomplete'),
        autocomplete:{selectFirst:true,width:'100px',autoFill:true},
        'width':'100%',
        defaultText: 'Voeg tags toe (een woord waarop deze therapie goed gevonden zal worden)'
    });
});

function add_existing_exercise() {
    console.log($('#exisiting-exercises-container option:selected').text());
    $('#added-exercises-container').append(new Option($('#exisiting-exercises-container option:selected').text(), $('#exisiting-exercises-container option:selected').val()));
}

function remove_existing_exercise() {
    $("#added-exercises-container option[value=" + $('#added-exercises-container option:selected').val() + "]").remove();
}

function select_all_options() {
    $('#added-exercises-container option').each(function(){
        console.log('test');
        $(this).attr('selected', 'selected');
    });
}

function getDialog(me) {
    $('#modalContainer').ajaxGetModal(
        site_url($(me).attr('href'))
    );
}

function postDialog(me, args) {
    $('#modalContainer').ajaxPostModal(
        site_url($(me).attr('href')),
        args
    );
}

$.fn.ajaxPostModal = function(url, data) {
    $(this).load(url, data, function(){
        $(this).modal({
            keyboard:true,
            backdrop:true
        });
    }).modal('show');
}

$.fn.ajaxGetModal = function(url) {
    $(this).load(url, function(){
        $(this).modal({
            keyboard:true,
            backdrop:true
        });
    }).modal('show');
}

function show_suggestions() {
    var result, exercises_result, therapies_result;
    $.getJSON(site_url('search/suggestions?term=' + $('input#search-input').val()), function(data) {
        data = data[0];
        if(data.exercises.length == 0 && data.therapies.length == 0) {
            result = "Geen resultaten.";
            $('div#search-result').html(result);
        } else {
            if(data.exercises.length == 0) {
                exercises_result = "<li>Geen resultaten.</li>";
            } else {
                $.each(data.exercises, function(index, value){
                    exercises_result += '<li>' + value + '</li>'
                });
            }

            if(data.therapies.length == 0) {
                therapies_result = "<li>Geen resultaten.</li>";
            } else {
                $.each(data.therapies, function(index, value){
                    therapies_result += '<li>' + value + '</li>'
                });
            }

            exercises_result = '<ul>' + exercises_result + '</ul>';
            therapies_result = '<ul>' + therapies_result + '</ul>';
        }

        $('div#search-result').html('<table><thead><tr><td style="width: 50%;"><h3>Therapieen</h3></td><td style="width: 50%;"><h3>Oefeningen</h3></td></tr></thead><tr><td style="border-left: solid 1px #ffffff;">' + therapies_result + '</td><td style="border-left: solid 1px #ffffff;">' + exercises_result + '</td></tr></table>');

        $('div#search-result').slideDown(1000);
    });
}

function add_exercise_fields() {
    counter = ($('div#exercises_container').find('input').length / 2);
    $('div#exercises_container').append('<div class="well my-well"></div>');
    $('div#exercises_container div.well:last-child').append('<label for="therapy_exercises_attributes_' + counter + '_name">Name</label>');
    $('div#exercises_container div.well:last-child').append('<input type="text" size="30" name="therapy[exercises_attributes][' + counter + '][name]" id="therapy_exercises_attributes_' + counter + '_name">');

    $('div#exercises_container div.well:last-child').append('<label for="therapy_exercises_attributes_' + counter + '_description">Description</label>');
    $('div#exercises_container div.well:last-child').append('<textarea style="height: 100px !important;" rows="20" name="therapy[exercises_attributes][' + counter + '][description]" id="therapy_exercises_attributes_' + counter + '_description" cols="40" class="text optional"></textarea>');
}

function site_url(addition_url) {

    if(typeof(addition_url) == 'undefined') {
        addition_url = '';
    } else if(addition_url.substring(0,1) == '/') {
        addition_url = addition_url.substring(1);
    }

    return 'http://localhost:3000/' + addition_url;
}

function loadExercises(){

}

jQuery (function ($)
{
   // ready
    $(window).resize (function (event)
    {
        var minwidth = 1200;
        var minheight = 1024;

        var bodye = $('body');

        var bodywidth = bodye.width ();

        if (bodywidth < minwidth)
        {   // maintain minimum size
            bodye
                .css ('backgroundSize', minwidth + 'px' + ' ' + minheight + 'px')
            ;
        }
        else
        {   // expand
            bodye
                .css ('backgroundSize', '100% auto')
            ;
        }
    });
});

$(document).ready(function() {
    $("#suggest-therapy-container").change(function() {
        $.getJSON('http://localhost:3000/exercises/existing_suggestions?therapy='+$(this).val(), function(data) {
            $('#exisiting-exercises-container').html('');
                $.each(data, function(index, element){
                    $('#exisiting-exercises-container').append(new Option(element.name, element.id));
                });

        });
    });
});

function setCheckbox(){
    $(document).ready(function(){
        $(".selectlistbox").dropdownchecklist(); 
    });
}
