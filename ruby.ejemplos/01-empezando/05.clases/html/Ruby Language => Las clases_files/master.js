function setSearchResultBadge(searchResult) {
    var s = "<div class=\"box-result\"><div class=\"box-header\"><h2>Search Result</h2></div><div class=\"box-body\">";

    if (searchResult.length == 0) {
        s += "No result found.";
    } else {

        s += "<div class=\"row\">";

        for (var i = 0; i < searchResult.length; i++) {
            s += "<div class=\"col-6 col-xl-4 text-center\"><div class=\"badge badge-tag-xl\"><a href=\""+ searchResult[i][0] + "\">" + searchResult[i][1] + "</a></div></div>";
        }

        s += "</div>";
    }

    s += "</div></div></div>";
    $("#uiSearchResult").html(s);
}

// move this somewhere!!!
var tags = null;

function Ask4Keywords_TagSearch() {
    $("#uiHeaderSearch").on('keyup touchend',
        function () {
            onSearch();
        });

    $.ajax({
        type: "get",
        url: "/assets/datasource/tags.txt",
        dataType: "xml",
        success: function (data) {
            var xmlTags = $(data).find("Tag");
            tags = new Array(xmlTags.length);

            for (var i = 0; i < xmlTags.length; i++) {
                tags[i] = $(xmlTags[i]).attr("TagName");
            }
        },
    });
}

function onSearch() {

    if ($("#uiHeaderSearch").val() == "") {
        $("#uiSearchResult").html("");
    } else {
        var searchText = $("#uiHeaderSearch").val().toLowerCase();

        var badges = [];

        for (var i = 0; i < tags.length; i++) {
            var tagName = tags[i];

            if (tagName.indexOf(searchText) > -1) {
                var pos = badges.length;
                badges[pos] = [];

                badges[pos][0] = "/tags/" + tagName;
                badges[pos][1] = tagName;
            }
        }


        setSearchResultBadge(badges);
    }
}

function tagSearch() {
    console.log('wtf');
    var searchText = $("#uiSearchText").val();

    $(".block-question-tag .block-question-tag-inner").each(function () {
        $(this).show();
    });

    $(".block-question-tag li").each(function () {
        var li = $(this);
        if (li.text().indexOf(searchText) > -1) {
            li.show();
        } else {
            li.hide();
        }
    });

    $(".block-question-tag .block-question-tag-inner").each(function () {
        var div = $(this);
        if (div.find("li:visible").length == 0) {
            div.hide();
        }
    });
}

var SELECTOR_DATA_TOGGLE$1 = '[data-toggle="collapse"]';

$(function () {
    $(SELECTOR_DATA_TOGGLE$1).click(function() {
        var data_target = $(this).attr("data-target");
        var target = $(data_target);

        if (target.hasClass("show")) {
            target.removeClass("show");
            $(this).addClass("collapsed");
        } else {
            target.addClass("show");
            $(this).removeClass("collapsed");
        }
    })
});

$(function() {
    $(".article table").addClass("table table-bordered table-hover table-responsive-sm table-striped");
    $(".article thead").addClass("thead-dark");
});

$(function () {
    $('a').each(function () {
        var a = new RegExp('/' + window.location.host + '/');

        if (!a.test(this.href) && !this.href.startsWith("http://localhost:") && !this.href.startsWith("https://ask4") && !this.href.startsWith("javascript:")) {
            console.log(this.href);
            $(this).attr("target", "_blank");
        }
    });

    $("table").addClass("table table-bordered table-hover table-responsive-sm table-striped");
    $("thead").addClass("thead-dark");

    $('aside a').each(function () {
        if ($(this).attr('href') == '/{{page.permalink}}' ||
            $(this).attr('href') == '{{ site.github.url }}/{{page.permalink}}') {
            $(this).addClass('font-weight-bold');
        }
    });

    // bounceRateFix
    $(window).scroll(function () { bounceRateFix() });
    $(window).click(function () { bounceRateFix() });
    $(window).keyup(function () { bounceRateFix() });
});

var bounceRateFix_Date = new Date();
function bounceRateFix() {
    var eventDate = new Date();
    eventDate.setSeconds(eventDate.getSeconds() - 20);

    var maxDate = new Date(bounceRateFix_Date.getTime());
    maxDate.setSeconds(maxDate.getSeconds() + 300);

    if (bounceRateFix_Date <= eventDate && eventDate < maxDate) {
        bounceRateFix_Date = new Date();
        gtag('event', 'Visible', { 'event_category': 'bounce-rate-fix' });
    }
}

$(window).scroll(function () {
    if ($(this).scrollTop() >= 450) {
        $('#scroll-to-top').fadeIn(200);
    } else {
        $('#scroll-to-top').fadeOut(200);
    }
});

$('#scroll-to-top').click(function () {
    $('body,html').animate({
        scrollTop: 0
    }, 500);
});