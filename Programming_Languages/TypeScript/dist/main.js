"use strict";
let message;
let num;
let option;
message = "Hello, World!";
message = "That's great!";
// message = 9
num = 9;
option = true;
message = "Farewell!";
console.log(message, num, option);
////////////////////////////////////////////////////////////////////////////////////////////////////
/**
 * Avoid any in TypeScript!
 * @param config
 * @returns
 */
function action(config) {
    return config;
}
////////////////////////////////////////////////////////////////////////////////////////////////////
let animals = ["Dog", "Wolf", "Cat", "Cheetah"];
let nums = [4, 2, 1, 5];
let nums2 = [];
let options = [];
// nums.map(x => x.) // Autocomplete suggests data type methods
console.log(animals);
let tupla = [1, ["Great!", "Farewell!"]];
console.log(tupla);
////////////////////////////////////////////////////////////////////////////////////////////////////
const SMALL = 'S';
const MEDIUM = 'M';
const LARGE = 'L';
const EXTRALARGE = 'XL';
// PascalCase // JavaScript IFEE -> Inmediated Invoked Function Expression
var Size;
(function (Size) {
    Size["Small"] = "S";
    Size["Medium"] = "M";
    Size["Large"] = "L";
    Size["ExtraLarge"] = "XL";
})(Size || (Size = {}));
const var1 = Size.Large;
console.log(var1);
const state = 2 /* LoadingState.Success */;
const object = {
    id: 1,
    name: "Alba",
    size: Size.Small,
    address: {
        num: 1,
        street: "Straightforward",
        country: "Nebulandia"
    }
};
const arr = [];
