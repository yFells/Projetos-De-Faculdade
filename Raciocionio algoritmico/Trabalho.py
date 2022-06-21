from random import randint 
head = 0
while head != 5:
    if head == 0:
        acertos = 0
        s1 = randint(1,1000); s2 = randint(1,1000); rs = s1 + s2
        m1 = randint(1,1000); m2 = randint(1,1000); rm = m1 - m2
        v1 = randint(1,20); v2 = randint(1,20); rv = v1*v2
        d1 = randint(1,1000); rd = randint(1,50); d2 = d1*rd #assim nem perigo da divisão dos randit dar quebrada e confundir o user 
        #apague o comentário da próxima linha e ela vai lhe dar o resultado, dnd
        print(s1, s2, m1, m2, v1, v2, d1, d2, "respostas:", rs, rm, rv, rd)
        head = 1
    elif head == 1: 
        if int(input("resultado de %d + %d  " %(s1, s2))) == rs: 
            acertos = 1 
        head = head + 1
    elif head == 2: 
        if int(input("resultado de %d - %d  " %(m1, m2))) == rm:
            acertos = acertos + 1
        head = head + 1
    elif head == 3:
        if int(input("resultado de %d * %d  " %(v1, v2))) == rv:
            acertos = acertos + 1
        head = head + 1
    elif head == 4:
        if int(input("resultado de %d // %d  " %(d1, d2))) == rd:
            acertos = acertos + 1
        head = head + 1
        if acertos == 4:
            print("parabens vc acertou tudo")
            break
        else: 
            head = 0
            print("vc errou pelo menos uma, os resultados eram %d, %d, %d, %d respectivamente" %(rs, rm, rv, rd))
print("o programa parou com sucesso")

#estatic version
"""from random import randint 
head = 0
while head != 5:
    if head == 0:
        acertos = 0
        s1 = 234; s2 = 432; rs = s1 + s2
        m1 = 987; m2 = 123; rm = m1 - m2
        v1 = 17; v2 = 13; rv = v1*v2
        d1 = 88; d2 = 4; rd = d1//d2
        #apague o comentário da próxima linha e ela vai lhe dar o resultado, dnd
        #print(s1, s2, m1, m2, v1, v2, d1, d2, "respostas:", rs, rm, rv, rd)
        head = 1
    elif head == 1: 
        if int(input("resultado de %d + %d  " %(s1, s2))) == rs: 
            acertos = 1 
        head = head + 1
    elif head == 2: 
        if int(input("resultado de %d - %d  " %(m1, m2))) == rm:
            acertos = acertos + 1
        head = head + 1
    elif head == 3:
        if int(input("resultado de %d * %d  " %(v1, v2))) == rv:
            acertos = acertos + 1
        head = head + 1
    elif head == 4:
        if int(input("resultado de %d // %d  " %(d1, d2))) == rd:
            acertos = acertos + 1
        head = head + 1
        if acertos == 4:
            print("parabens vc acertou tudo")
            break
        else: 
            head = 0
            print("vc errou pelo menos uma, os resultados eram %d, %d, %d, %d respectivamente" %(rs, rm, rv, rd))
print("o programa parou com sucesso")"""