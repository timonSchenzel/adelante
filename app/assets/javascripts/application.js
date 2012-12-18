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
    var sampleTags = ['c++', 'java', 'php', 'coldfusion', 'javascript', 'asp', 'ruby', 'python', 'c', 'scala', 'groovy', 'haskell', 'perl', 'erlang', 'apl', 'cobol', 'go', 'lua'];

    $('.tags').tagsInput({
        autocomplete_url: site_url('therapies/autocomplete'),
        autocomplete:{selectFirst:true,width:'100px',autoFill:true},
        'width':'100%'
    });
});

function site_url(addition_url) {
    if(typeof(addition_url) == 'undefined') {
        addition_url = '';
    }

    return 'http://localhost:3000/' + addition_url;
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
