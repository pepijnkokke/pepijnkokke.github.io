---
layout: null
---
$(document).ready(function () {

    // if we are not currently looking at a post or page, then the
    // panel-cover should not be collapsed:
    var blogOpened = window.location.hash && window.location.hash == '#blog';
    var pathOpened = window.location.pathname !== '{{ site.baseurl }}/'
        && window.location.pathname !== '{{ site.baseurl }}/index.html';

    if (!blogOpened && !pathOpened) {
        $('.panel-cover').removeClass('panel-cover--collapsed')
    }

    // otherwise, once a button is pressed, the panel-cover should
    // also be collapsed; (why?)
    $('a.blog-button').click(function (e) {
        if ($('.panel-cover').hasClass('panel-cover--collapsed')) return;
        currentWidth = $('.panel-cover').width();
        if (currentWidth < 960) {
            $('.panel-cover').addClass('panel-cover--collapsed');
            $('.content-wrapper').addClass('animated slideInRight');
        } else {
            $('.panel-cover').css('max-width', currentWidth);
            $('.panel-cover').animate({'max-width': '530px', 'width': '40%'},
                                      400, swing = 'swing', function () {});
        }
    })

    $('.btn-mobile-menu').click(function () {
        $('.navigation-wrapper').toggleClass('visible animated bounceInDown')
        $('.btn-mobile-menu__icon').toggleClass('icon-list icon-x-circle animated fadeIn')
    })

    $('.navigation-wrapper .blog-button').click(function () {
        $('.navigation-wrapper').toggleClass('visible')
        $('.btn-mobile-menu__icon').toggleClass('icon-list icon-x-circle animated fadeIn')
    })
})
