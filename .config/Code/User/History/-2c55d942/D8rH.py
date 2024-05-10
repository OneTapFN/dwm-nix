import random as r
words = ['мир', 'вор', 'сон']
choise = words[r.randint(-1, 2)]
print('Попробуй угодать слово из 3 букв')
letter = list(choise)
while True:
    x = input()
    if x == letter[1]:
        print(f'Первая буква {letter[1]}')
    elif x == letter[2]:
        print(f'Вторая буква {letter[2]}')
    elif x == letter[3]:
        print(f'Третья буква {letter[3]}')
    else:
        print('Не угодал')
