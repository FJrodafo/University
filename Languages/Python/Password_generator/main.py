import random


def generatePassword(length):
    characters = "qwertyuiopasdfghjklzxcvbnm12345678901234567890QWERTYUIOPASDFGHJKLZXCVBNM12345678901234567890"
    password = ""
    for i in range(length):
        password += random.choice(characters)
    return password


length = int(input("Length: "))

newPassword = generatePassword(length)
print(newPassword)
