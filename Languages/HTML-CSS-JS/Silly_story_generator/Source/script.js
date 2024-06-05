var customName = document.getElementById('customname');

var randomize = document.querySelector('.randomize');
var story = document.querySelector('.story');

function randomValueFromArray(array) {
    return array[Math.floor(Math.random() * array.length)];
}

var storyText = 'It was 94 farenheit outside, so :insertX: went for a walk. When they got to :insertY:, they stared in horror for a few moments, then :insertZ:. Bob saw the whole thing, but he was not surprised — :insertX: weighs 300 pounds, and it was a hot day.';
var insertX = ['Willy Wonka', 'Big Daddy', 'Father Christmas'];
var insertY = ['the soup kitchen', 'Disneyland', 'the White House'];
var insertZ = ['spontaneously combusted', 'melted into a puddle on the sidewalk', 'turned into a slug and crawled away'];

randomize.addEventListener('click', result);

function result() {

    var newStory = storyText;
    var xitem = randomValueFromArray(insertX);
    var yitem = randomValueFromArray(insertY);
    var zitem = randomValueFromArray(insertZ);

    newStory = newStory.replace(':insertX:', xitem);
    newStory = newStory.replace(':insertY:', yitem);
    newStory = newStory.replace(':insertZ:', zitem);
    newStory = newStory.replace(':insertX:', xitem);

    if (customName.value !== '') {
        var name = customName.value;
        newStory = newStory.replace('Bob', name);
    }

    if (document.getElementById('uk').checked) {
        var weight = Math.round(300 / 14) + ' stone';
        var temperature = Math.round(((94 - 32) * 5) / 9) + ' centigrade';

        newStory = newStory.replace('300 pounds', weight);
        newStory = newStory.replace('94 farenheit', temperature);

    }

    story.textContent = newStory;
    story.style.visibility = 'visible';
}
