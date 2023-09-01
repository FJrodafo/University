var dealerSum = 0;
var playerSum = 0;
var dealerAceCount = 0;
var playerAceCount = 0;
var hidden;
var deck;
var canHit = true;
window.onload = function () {
    buildDeck();
    shuffleDeck();
    startGame();
}
function buildDeck() {
    let types = ["C", "D", "H", "S"];
    let values = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"];
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
    while (dealerSum < 17) {
        let cardImg = document.createElement("img");
        let card = deck.pop();
        cardImg.src = "./Cards/" + card + ".png";
        dealerSum += getValue(card);
        dealerAceCount += checkAce(card);
        document.getElementById("dealer-cards").append(cardImg);
    }
    console.log(dealerSum);
    for (let i = 0; i < 2; i++) {
        let cardImg = document.createElement("img");
        let card = deck.pop();
        cardImg.src = "./Cards/" + card + ".png";
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
    cardImg.src = "./Cards/" + card + ".png";
    playerSum += getValue(card);
    playerAceCount += checkAce(card);
    document.getElementById("player-cards").append(cardImg);
    if (reduceAce(playerSum, playerAceCount) > 21) {
        canHit = false;
    }
}
function stay() {
    dealerSum = reduceAce(dealerSum, dealerAceCount);
    playerSum = reduceAce(playerSum, playerAceCount);
    canHit = false;
    document.getElementById("hidden").src = "./Cards/" + hidden + ".png";
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
    document.getElementById("dealer-sum").innerText = dealerSum;
    document.getElementById("player-sum").innerText = playerSum;
    document.getElementById("results").innerText = message;
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
function reduceAce(playerSum, playerAceCount) {
    while (playerSum > 21 && playerAceCount > 0) {
        playerSum -= 10;
        playerAceCount -= 1;
    }
    return playerSum;
}