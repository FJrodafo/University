// Task 3: use https://catfact.ninja/fact API.

const fetchData = async () => {
    const res = await fetch("https://catfact.ninja/fact");
    const result = await res.json();
    console.log(result);
};

fetchData();