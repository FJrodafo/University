/*
URLs para probar:
https://www.eldia.es/rss/section/12502
https://feeds.bbci.co.uk/mundo/rss.xml
https://feeds.elpais.com/mrss-s/pages/ep/site/elpais.com/portada
*/

document.addEventListener('DOMContentLoaded', () => {
    const get = id => document.getElementById(id);
    const rssSelect = get('campoSelect');
    const noticiasElement = get('noticias');

    const showRssContent = async rssTitle => {
        const rssList = JSON.parse(localStorage.getItem('rssList')) || {};
        noticiasElement.innerHTML = rssList[rssTitle] || 'Cargando contenido...';

        if (!rssList[rssTitle]) {
            try {
                const response = await fetch(`server.php?title=${encodeURIComponent(rssTitle)}`);
                if (!response.ok) throw new Error('Error al cargar el contenido del RSS');
                const data = await response.json();
                noticiasElement.innerHTML = data.content;
                rssList[rssTitle] = data.content;
                localStorage.setItem('rssList', JSON.stringify(rssList));
            } catch (error) {
                noticiasElement.innerHTML = 'Contenido no disponible.';
                console.error(error.message);
            }
        }
    };

    const addToSelect = title => {
        const option = document.createElement('option');
        option.text = title;
        option.value = title;
        rssSelect.add(option);
    };

    const loadRssTitles = () => {
        const rssList = JSON.parse(localStorage.getItem('rssList')) || {};
        Object.keys(rssList).forEach(addToSelect);
        if (Object.keys(rssList).length > 0) {
            showRssContent(Object.keys(rssList)[0]);
        }
    };

    const addRss = async (title, url) => {
        try {
            const response = await fetch(`server.php?url=${encodeURIComponent(url)}`);
            if (!response.ok) throw new Error('Error al obtener el RSS desde el servidor');
            const data = await response.json();
            updateRssList(data.title, data.content);
        } catch (error) {
            alert(error.message);
            console.error(error.message);
        }
    };

    const updateRssList = (title, content) => {
        const rssList = JSON.parse(localStorage.getItem('rssList')) || {};
        rssList[title] = content;
        localStorage.setItem('rssList', JSON.stringify(rssList));

        addToSelect(title);
        rssSelect.value = title;
        showRssContent(title);
    };

    const deleteRss = rssTitle => {
        const rssList = JSON.parse(localStorage.getItem('rssList')) || {};
        if (rssList[rssTitle]) {
            delete rssList[rssTitle];
            localStorage.setItem('rssList', JSON.stringify(rssList));

            const optionToRemove = rssSelect.querySelector(`option[value="${rssTitle}"]`);
            if (optionToRemove) rssSelect.removeChild(optionToRemove);

            if (noticiasElement.innerHTML === rssList[rssTitle]) {
                noticiasElement.innerHTML = '';
            }
        }
    };

    loadRssTitles();

    get('crearRSS').addEventListener('click', async () => {
        const url = prompt('Introduce la URL del recurso RSS:');
        if (url) await addRss(null, url);
        else alert('Debes proporcionar una URL.');
    });

    rssSelect.addEventListener('change', () => {
        const selectedRss = rssSelect.value;
        showRssContent(selectedRss);
    });

    get('borrarRSS').addEventListener('click', () => {
        const selectedRss = rssSelect.value;
        deleteRss(selectedRss);
    });
});
