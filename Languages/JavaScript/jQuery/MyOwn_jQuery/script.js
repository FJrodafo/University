// FƑ fƒ https://mothereff.in/js-variables

const $ = (arg) => {
    // DOMContentLoaded
    if (typeof arg === 'function') {
        document.addEventListener('DOMContentLoaded', arg)
        return
    }

    // CSS selector
    let elements

    if (typeof arg === 'string') {
        elements = document.querySelectorAll(arg)
    }

    // Loose HTML element
    if (arg instanceof HTMLElement) {
        elements = [arg]
    }

    elements.css = (...args) => {
        const [property, value] = args
        const isString = typeof property === 'string'

        elements.forEach(element => {
            if (isString) {
                element.style[property] = value
            } else {
                const entriesCSS = Object.entries(property)
                entriesCSS.forEach(([property, value]) => {
                    element.style[property] = value
                })
            }
        })

        return elements
    }

    elements.on = (event, callback) => {
        elements.forEach(element => {
            element.addEventListener(event, callback)
        })

        return elements
    }

    elements.each = (fn) => {
        elements.forEach((element, index) => {
            fn(index, element)
        })

        return elements
    }

    elements.fadeIn = (duration = 1000) => {
        elements.forEach((element, index) => {
            const animation = element.animate([
                { opacity: 0 },
                { opacity: 1 }
            ], {
                duration
            })

            animation.onfinish = () => element.style.opacity = 1
        })

        return elements
    }

    return elements
}

$(() => { // DOMContentLoaded
    console.log('DOMContentLoaded')

    $('button')
        .css('background', '#09f')
        .css('border', '#fff')
        .css({
            padding: '16px',
            borderRadius: '4px'
        })
        .on('click', () => {
            $('#message').fadeIn()
        })

    $('li').each((index, element) => {
        if (index === 0) $(element).css('color', '#09f')
        if (index === 1) $(element).css('color', 'red')
        if (index === 2) $(element).css('color', 'yellow')
        if (index === 3) $(element).css('color', '#09f')
    })
})
