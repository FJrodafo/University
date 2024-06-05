var dealerSum = 0;
var playerSum = 0;
var dealerAceCount = 0;
var playerAceCount = 0;
var hidden;
var deck;
var canHit = true;

let hiddenCard = document.createElement("img");
hiddenCard.src = "./../Assets/Cards/BACK.png";

window.onload = function () {
    document.getElementById("dealer-cards").append(hiddenCard);
    document.getElementById("refresh").style.display = "none";
    buildDeck();
    shuffleDeck();
    startGame();
}

function buildDeck() {
    let types = ["C", "D", "H", "S"];
    let values = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K"];
    deck = [];
    for (let i = 0; i < types.length; i++) {
        for (let j = 0; j < values.length; j++) {
            deck.push(values[j] + "-" + types[i]);
        }
    }
    console.log(deck);
}

function shuffleDeck() {
    for (let i = 0; i < deck.length; i++) {
        let j = Math.floor(Math.random() * deck.length);
        let temp = deck[i];
        deck[i] = deck[j];
        deck[j] = temp;
    }
    console.log(deck);
}

function startGame() {
    hidden = deck.pop();
    dealerSum += getValue(hidden);
    dealerAceCount += checkAce(hidden);
    for (let i = 0; i < 1; i++) {
        let cardImg = document.createElement("img");
        let card = deck.pop();
        cardImg.src = "./../Assets/Cards/" + card + ".png";
        dealerSum += getValue(card);
        dealerAceCount += checkAce(card);
        document.getElementById("dealer-cards").append(cardImg);
    }
    console.log(dealerSum);
    for (let i = 0; i < 2; i++) {
        let cardImg = document.createElement("img");
        let card = deck.pop();
        cardImg.src = "./../Assets/Cards/" + card + ".png";
        playerSum += getValue(card);
        playerAceCount += checkAce(card);
        document.getElementById("player-cards").append(cardImg);
    }
    console.log(playerSum);
    document.getElementById("hit").addEventListener("click", hit);
    document.getElementById("stay").addEventListener("click", stay);
}

function hit() {
    if (!canHit) {
        return;
    }
    let cardImg = document.createElement("img");
    let card = deck.pop();
    cardImg.src = "./../Assets/Cards/" + card + ".png";
    playerSum += getValue(card);
    playerAceCount += checkAce(card);
    document.getElementById("player-cards").append(cardImg);
    if (reduceAce(playerSum, playerAceCount) >= 21) {
        canHit = false;
    }
}

async function stay() {
    canHit = false;
    hiddenCard.src = "./../Assets/Cards/" + hidden + ".png";
    playerSum = reduceAce(playerSum, playerAceCount);
    if (dealerAceCount == 2) {
        dealerSum = reduceAce(dealerSum, dealerAceCount);
    }
    while (dealerSum < playerSum && dealerSum < 17 && playerSum <= 21) {
        let cardImg = document.createElement("img");
        let card = deck.pop();
        cardImg.src = "./../Assets/Cards/" + card + ".png";
        dealerSum += getValue(card);
        dealerAceCount += checkAce(card);
        await sleep(1);
        document.getElementById("dealer-cards").append(cardImg);
        if (dealerAceCount > 1) {
            dealerSum = reduceAce(dealerSum, dealerAceCount);
        }
    }
    dealerSum = reduceAce(dealerSum, dealerAceCount);
    while (dealerSum < playerSum && dealerSum < 17 && playerSum <= 21) {
        let cardImg = document.createElement("img");
        let card = deck.pop();
        cardImg.src = "./../Assets/Cards/" + card + ".png";
        dealerSum += getValue(card);
        dealerAceCount += checkAce(card);
        await sleep(1);
        document.getElementById("dealer-cards").append(cardImg);
        if (dealerAceCount > 1) {
            dealerSum = reduceAce(dealerSum, dealerAceCount);
        }
    }
    let message = "";
    if (playerSum > 21) {
        message = "You lose!";
    }
    else if (dealerSum > 21) {
        message = "You win!";
    }
    else if (playerSum == dealerSum) {
        message = "Tie!";
    }
    else if (playerSum > dealerSum) {
        message = "You win!";
    }
    else if (playerSum < dealerSum) {
        message = "You lose!";
    }
    await sleep(1);
    document.getElementById("dealer-sum").innerText = dealerSum;
    document.getElementById("player-sum").innerText = playerSum;
    document.getElementById("results").innerText = message;
    document.getElementById("hit").style.display = "none";
    document.getElementById("stay").style.display = "none";
    document.getElementById("refresh").style.display = "inline";
    document.getElementById("refresh").addEventListener("click", refresh);
}

async function sleep(seconds) {
    return new Promise((resolve) => setTimeout(resolve, seconds * 1000));
}

function getValue(card) {
    let data = card.split("-");
    let value = data[0];
    if (isNaN(value)) {
        if (value == "A") {
            return 11;
        }
        return 10;
    }
    return parseInt(value);
}

function checkAce(card) {
    if (card[0] == "A") {
        return 1;
    }
    return 0;
}

function reduceAce(Sum, AceCount) {
    while (Sum > 21 && AceCount > 0) {
        Sum -= 10;
        AceCount -= 1;
    }
    return Sum;
}

function refresh() {
    window.location.reload();
}
