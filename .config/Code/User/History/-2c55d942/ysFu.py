import random as r
words = ['мир', 'вор', 'сон', 'дом', 'рот', 'ком', 'том', 'кот', 'год', 'йод'м]
choise = words[r.randint(-1, len(words) - 1)]
print('Попробуй угодать слово из 3 букв. Не вводи одинаковые буквы!!!')
letter = list(choise)
y = 0
z = ''
while y != 3:
    x = input()
    if x == letter[0]:
        print(f'Первая буква {letter[0]}')
        y += 1
        z += letter[0]
        print(f'Твои буквы {z}')

    elif x == letter[1]:
        print(f'Вторая буква {letter[1]}')
        y += 1
        z += letter[1]
        print(f'Твои буквы {z}')
    elif x == letter[2]:
        print(f'Третья буква {letter[2]}')
        y += 1
        z += letter[2]
        print(f'Твои буквы {z}')
    else:
        print('Не угодал')
        print(f'Твои буквы {z}')

while True:
    t = input('Ты угодал все буквы, а теперь введи слово: ')
    if t == choise:
        print(f'Угодал, твоё слово: {choise}')
        break
    else:
        print(f'Попробуй ещё раз. Твои буквы: {z}')