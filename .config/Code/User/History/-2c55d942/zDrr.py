import random as r
words = ['мир', 'вор', 'сон']
choise = words[r.randint(-1, 2)]
print('Попробуй угодать слово из 3 букв')
letter = list(choise)
y = letter[0] + letter[1] + letter[2]
print(words[0])
'''while True:
    x = input()
    if x == letter[0]:
        print(f'Первая буква {letter[0]}')
        y += letter[0]
    elif x == letter[1]:
        print(f'Вторая буква {letter[1]}')
        y += letter[1]
    elif x == letter[2]:
        print(f'Третья буква {letter[2]}')
        y += letter[2]
    else:
        print('Не угодал')'''