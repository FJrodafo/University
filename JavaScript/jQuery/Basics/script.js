// We should run our jQuery actions once the document has finished loading with this line of code
// $(() => {});
$(document).ready(function () {

    // Hide all h2 tags
    $("h2").hide();

    // Change the style to all sections
    $("p").css({ "background-color": "red" });

    // Change the style of the first paragraph by obtaining its id
    $("#first-paragraph").css({ "background-color": "green" });

    // Change the style of the first paragraph by obtaining its id
    $(".second-paragraph").css({ "background-color": "blue" });

    // Add a click event to all buttons
    $("button").click(function () {
        alert("Hello, World!");
    });

    // We can combine the click and hide/show event
    $("#hide-btn").click(function () {
        $(".second-paragraph").hide();
    });

    // For the button to work you need to double click
    $("#show-btn").dblclick(function () {
        $(".second-paragraph").show();
    });

    // mouseenter launch an event when the mouse is over the selected element
    $("#first-paragraph").mouseenter(function () {
        // fadeOut makes the selected item disappear smoothly
        $("button").fadeOut();

        // slideDown is a slide to hide effect
        $(".second-paragraph").slideUp();
    });

    // mouseleave launch an event when the mouse is outside the selected element
    $("#first-paragraph").mouseleave(function () {
        // fadeIn makes the selected item appear smoothly
        $("button").fadeIn();

        // slideUp is a slide to show effect
        $(".second-paragraph").slideDown();
    });

    // We can create our own animations
    $("#first-paragraph").animate({ width: "300px" });

    $("#hide-btn").click(function () {
        // It shows us the content of the paragraph in plain text
        alert($(".fourth-paragraph").text());

        // It shows us the content of the paragraph with the HTML tags inside
        alert($(".fourth-paragraph").html());

        // It shows us the value of the title attribute
        alert($(".fourth-paragraph").attr("title"));

        // It converts paragraph content to plain text
        alert($(".fourth-paragraph").text("<strong>Hello, World!</strong>"));

        // It converts paragraph content to with the HTML tags inside
        alert($(".fourth-paragraph").html("<strong>Hello, World!</strong>"));

        // It adds content to the end of the paragraph
        alert($(".fourth-paragraph").append("<strong>Hello, World!</strong>"));

        // It adds content to the beginning of the paragraph
        alert($(".fourth-paragraph").prepend("<strong>Hello, World!</strong>"));

        // It adds a new paragraph after the current paragraph
        alert($(".fourth-paragraph").after("<p>Hello, World! After!</p>"));

        // It adds a new paragraph before the current paragraph
        alert($(".fourth-paragraph").before("<p>Hello, World! Before!</p>"));

        // It deletes the selected paragraph
        $(".fourth-paragraph").remove();

        // It adds a class to the selected element
        $("h2").addClass("red");

        // It removes a class to the selected element
        $("h2").removeClass("red");

        // It toggles a class to the selected element
        $("h2").toggleClass("blue");
    });

    // Cascading
    $('#special-btn')
        .css('background', '#09f')
        .css('border', '#fff')
        .css({
            padding: '16px',
            borderRadius: '4px'
        })
        .on('click', () => {
            alert('Hello, World!')
        })

    // each list index
    $('li').each((index, myElement) => {
        if (index === 0) $(myElement).css('color', '#09f')
        if (index === 1) $(myElement).css('color', 'red')
        if (index === 2) $(myElement).css('color', 'yellow')
        if (index === 3) $(myElement).css('color', '#09f')
    })
});
