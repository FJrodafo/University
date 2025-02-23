let message: string
let num: number
let option: boolean

message = "Hello, World!"
message = "That's great!"
// message = 9
num = 9
option = true
message = "Farewell!"

console.log(message, num, option)

////////////////////////////////////////////////////////////////////////////////////////////////////

/**
 * Avoid any in TypeScript!
 * @param config 
 * @returns 
 */
function action(config: any) {
    return config
}

////////////////////////////////////////////////////////////////////////////////////////////////////

let animals: string[] = ["Dog", "Wolf", "Cat", "Cheetah"]
let nums: number[] = [4, 2, 1, 5]
let nums2: Array<number> = []
let options: boolean[] = []

// nums.map(x => x.) // Autocomplete suggests data type methods

console.log(animals)

let tupla: [number, string[]] = [1, ["Great!", "Farewell!"]]

console.log(tupla)

////////////////////////////////////////////////////////////////////////////////////////////////////

const SMALL = 'S'
const MEDIUM = 'M'
const LARGE = 'L'
const EXTRALARGE = 'XL'

// PascalCase // JavaScript IFEE -> Inmediated Invoked Function Expression
enum Size { Small = 'S', Medium = 'M', Large = 'L', ExtraLarge = 'XL' }

const var1 = Size.Large
console.log(var1)

const enum LoadingState { Idle, Loading, Success, Error }
const state = LoadingState.Success

////////////////////////////////////////////////////////////////////////////////////////////////////

type Address = {
    num: number,
    street: string,
    country: string
}

type Person = {
    readonly id: number,
    name: string,
    surname?: string,
    size: Size,
    address: Address
}

const object: Person = {
    id: 1,
    name: "Alba",
    size: Size.Small,
    address: {
        num: 1,
        street: "Straightforward",
        country: "Nebulandia"
    }
}

const arr: Person[] = []