function showThumbnails() {
    const id = document.getElementById("videoId").value.trim();
    if (!id) return;

    const resolutions = [
        "maxresdefault.jpg",
        "sddefault.jpg",
        "hqdefault.jpg",
        "mqdefault.jpg",
        "default.jpg"
    ];

    const container = document.getElementById("thumbs");
    container.innerHTML = "";

    resolutions.forEach(res => {
        const url1 = `https://img.youtube.com/vi/${id}/${res}`;
        const url2 = `https://i3.ytimg.com/vi/${id}/${res}`;

        container.innerHTML += `
            <div>
                <br>
                <strong>${res}</strong>
                <br>
                <a href="${url1}" target="_blank">
                    <img src="${url1}" width="240">
                </a>
                <a href="${url2}" target="_blank">
                    <img src="${url2}" width="240">
                </a>
            </div>
        `;
    });
}
