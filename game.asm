;                                          BRICK BREAKER GAME BY:
;                                          FATIMA SAAD (21I-0405)
;                                     MUHAMMAD IBRAHIM BASIT (21i-0669)

player STRUCT 

    start_x Dw ?
    start_y Dw ?
    end_x Dw ?
    end_y Dw ?


player ends

Ball STRUCT

    startX_ Dw ?
    startY_ Dw ?
    endx_ Dw ?
    endY_ Dw ?
    x_speed DW ?
    y_speed DW ?

Ball ends

Brick STRUCT

    startX Dw ?
    startY Dw ?
    endx Dw ?
    endY Dw ?
    color DB ?
    isHit DW 0 ;bool value to check if its hit
    numHits DW ?
    fixedBrick DW ? ;bool value to see if its a fixed brick
    isSpecial DW ?

Brick ends

.model small
.stack 100h 
.data
    counter db 0
    barColor DB 0
    hearts DB 3
    backColor db 57
    randNum DB ?
    mainMenuOption DB 1
    winnerscreenOption DB 1
    pauseMenuOption DB 1
    exitPageOption DB 1
    bricksRemaining DB 32
    winner db "Congratulations", "$"
    scoreWin db "Your Score Is: ", "$"
    levelWin db "You Passed all 3 Levels!!!", "$"
    divider dw 10
    exitWin db "Exit the Game", "$"
    isPaused DB 0
    score dw 0
    gameDelay DW 17000
    gameStarted DB 0
    scoreIncrementer DW 1
    strDisp1 db "Score: ", "$"
    strDisp2 db "Lives: ", "$"
    strDisp3 db "Name: ", "$"
    levelsTab db "Level: ", "$"
    level2Disp db "Continue to Level 2", "$"
    level3Disp db " Continue to Level 3", "$"
    Level DB 1
    fixedBrickColor DB 7
    numSpecialBricks DB 0
    specialBrickColor DB 4
    numBricksDisappeared DB 0
    specialBrickHit DB 0
    numberOfFixedBricks DB 0
    levelPageOption DB 1
    gameState DB 0
    tempScore DW 0
    p1 player <120, 185, 200, 190> ; 10 = color, 125 = startingX, 190 = startY, 195 = endingX, 200 = endingY
    ball_ Ball <156, 152, 162, 158, 1, 1> ;x_speed = 1, y_speed = 1

    b1 Brick <25, 40, 55, 55>
    b2 Brick <56, 40, 85, 55>
    b3 Brick <86, 40, 115, 55>
    b4 Brick <116, 40, 145, 55>
    b5 Brick <146, 40, 175, 55>
    b6 Brick <176, 40, 205, 55>
    b7 Brick <206, 40, 235, 55>
    b8 Brick <236, 40, 265, 55>
    b9 Brick <266, 40, 296, 55>

    b11 Brick <56, 56, 85, 70>
    b21 Brick <86, 56, 115, 70>
    b31 Brick <116, 56, 145, 70>
    b41 Brick <146, 56, 175, 70>
    b51 Brick <176, 56, 205, 70>
    b61 Brick <206, 56, 235, 70>
    b71 Brick <236, 56, 265, 70>

    b12 Brick <25, 71, 55, 85>
    b22 Brick <56, 71, 85, 85>
    b32 Brick <86, 71, 115, 85>
    b42 Brick <116, 71, 145, 85>
    b52 Brick <146, 71, 175, 85>
    b62 Brick <176, 71, 205, 85>
    b72 Brick <206, 71, 235, 85>
    b82 Brick <236, 71, 265, 85>
    b92 Brick <266, 71, 296, 85>

    b13 Brick <56, 86, 85, 100>
    b23 Brick <86, 86, 115, 100>
    b33 Brick <116, 86, 145, 100>
    b43 Brick <146, 86, 175, 100>
    b53 Brick <176, 86, 205, 100>
    b63 Brick <206, 86, 235, 100>
    b73 Brick <236, 86, 265, 100>

    heartChar db 3
    welcomeMsg db "Welcome", "$"
    menu1 db "BRICK BREAKER GAME", "$"
    menu2 db "New Game", "$"
    menu3 db "Resume", "$"
    menu4 db "Instructions", "$"
    menu5 db "High Score", "$"
    menu6 db "Exit", "$"

    namePrompt db "Enter Your Name", "$"
    nameInp db 12 dup ('$')

    exitMessage db "The Game is Over", "$"
    optn1 db "Start Again", "$"
    optn2 db "End Game", "$"
    exitOption db "Exit", "$"
    main_menu db "Main Menu", "$"
    ins1 db "1. Start Game, then hit the ball", "$" 
    ins2 db "with the paddle", "$"
    ins3 db "2. If ball hits the ground,", "$"
    ins4 db "life lost", "$"
    ins5 db "3. Breaking a brick increments", "$"
    ins6 db "score", "$"
    backButton db "Return to Home Screen", "$"

    dispHigh db "HIGH SCORES", "$"
    nameHigh db "Name", "$"
    scoreHigh db "Score", "$"
    pause1 db "RESUME GAME", "$"
    pause2 db "START OVER", "$"
    pause3 db "END GAME", "$"
    pause4 db "GAME PAUSED", "$"

    person1 db 10 dup('$')
    person2 db 10 dup('$')
    person3 db 10 dup('$')
    person4 db 10 dup('$')
    person5 db 10 dup('$')

    num1 db 5 dup('$')
    num2 Db 5 dup('$')
    num3 db 5 dup('$')
    num4 Db 5 dup('$')
    num5 db 5 dup('$')



    p1Level db 2 dup('$')
    p2Level db 2 dup('$')
    p3Level db 2 dup('$')
    p4Level db 2 dup('$')
    p5Level db 2 dup('$')
    scoreArray dw 0,0,0,0,0
    arrayIndex db 0
    words db 5
    stringArr db 150 dup(13)
    scoreString db 5 dup('$')

    frequency dw 250

    
    L1C db 0
    L2C db 0
    tempString1 dw 0
    tempString2 dw 0
    swapCounter db 0
    file db "highscores.txt", 0
    handler dw ?
    buffer db 100 dup('$')


.code
mov ax, @data
mov ds, ax
mov ax, 0
jmp game

enterVideoMode MACRO
    ;video mode (graphic)
    mov ah, 0
    mov al, 13h ; 320 x 200   
    int 10h
endm

displayName MACRO string
    mov dx, 0
    mov al, 0
    mov ah, 09h
    mov dx, offset string + 2
    int 21h

endm


drawBoxOutline MACRO color, startX, startY, endx, endY 
     mov cx, startX   ;(column)

    .while cx < endx  
        inc cx
        mov dx, startY    ;(row)
        mov al, color
        mov ah, 0ch
        int 10h
    .endw
    
    .while dx < endY
        inc dx
        mov al, color
        mov ah, 0ch
        int 10h
    .endw
   
    .while cx > startX 
        dec cx
        mov al, color
        mov ah, 0ch
        int 10h
    .endw
    
    .while dx > startY 
        dec dx
        mov al, color
        mov ah, 0ch
        int 10h
    .endw    
endm

setTheScene MACRO color

    mov cx, 0
    mov dx, 0

    .while cx < 320
        mov dx, 0
        .while dx < 200
            mov ah, 0Ch
            mov al, color
            int 10h
            inc dx

        .endw

        inc cx

    .endw

endm

winnerScreen Macro 

    setTheScene 202
    boxM 0, 40, 280, 20, 180
    drawBoxOutline 132, 40, 20, 280, 180
    setCursor 5, 13
    displayText winner
    setCursor 8, 17
    displayName nameInp
    setCursor 11, 11
    displayText scoreWin
    setCursor 11, 26
    scoreM score
    setCursor 14, 7
    displayText levelWin
    drawBoxOutline 132, 60, 140, 260, 170
    setCursor 19, 14
    displayText exitWin


endm

setTheBar MACRO color

    mov cx, 0
    mov dx, 0

    .while cx < 320
        mov dx, 0
        .while dx < 30
            mov ah, 0Ch
            mov al, color
            int 10h
            inc dx

        .endw

        inc cx

    .endw

endm


convertStringToNum PROC

    mov cl, '$'
    mov bx, 0

    .while [si] != cl

        mov cx, 10

        mov ax, bx
        mul cx
        mov bx, ax

        mov cl, [si]
        sub cl, 48
        mov ch, 0
        add bx, cx
        inc si

        mov cl, '$'

    .endw
    ret
    

convertStringToNum endp



sortScores PROC
    mov si, offset scoreArray
    L1:

        mov cx, 0
        mov cl, words
        mov L2C, 0
        sub cl, L1C
        sub cl, 1

        L2:

            mov bx,2

            mov ax, 0
            mov al, L2C
            mul bx
            mov bx, ax

            mov ax, [si + bx]

            inc bx
            inc bx

            mov dx, [si + bx]

            CMP ax, dx
            JAE dontSwap

            mov [si + bx], ax
            dec bx
            dec bx
            mov [si + bx], dx

            mov ax, 0

            mov ah, 0
            mov al, L2C
            mov di, 10
            mul di
            mov tempString1, ax
            mov di, offset person1
            add tempString1, di

            mov ah, 0
            mov al, L2C
            inc ax
            mov di, 10
            mul di
            mov tempString2, ax
            mov di, offset person1
            add tempString2, di

            mov swapCounter, 10

            call swapString

            mov ax, 0

            mov ah, 0
            mov al, L2C
            mov di, 5
            mul di
            mov tempString1, ax
            mov di, offset num1
            add tempString1, di

            mov ah, 0
            mov al, L2C
            inc ax
            mov di, 5
            mul di
            mov tempString2, ax
            mov di, offset num2
            add tempString2, di

            mov swapCounter, 5

            call swapString

            mov ax, 0

            mov ah, 0
            mov al, L2C
            mov di, 2
            mul di
            mov tempString1, ax
            mov di, offset p1Level
            add tempString1, di

            mov ah, 0
            mov al, L2C
            inc ax
            mov di, 2
            mul di
            mov tempString2, ax
            mov di, offset p1Level
            add tempString2, di

            mov swapCounter, 2

            call swapString

            mov si, offset scoreArray

            dontSwap:
            inc L2C

        CMP cl, L2C
        JNE L2

        inc L1C

        mov cx, 0
        mov cl, words
        dec cl
        mov ax, 0
        mov al, L1C
        
    CMP cl, L1C
    JNE L1

    ret
sortScores endp

readFile PROC

    mov ah, 3dh
    mov dx, offset file
    mov al,2
    int 21h
    mov handler, ax
    jnc go

    mov dl, 3
    mov ah, 2
    int 21h

    go:

    mov ah, 3FH
    mov cx, 10
    mov dx, offset person1
    mov bx, handler
    int 21h

    mov ah, 3FH
    mov cx, 5
    mov dx, offset num1
    mov bx, handler
    int 21h

    mov ah, 3FH
    mov cx, 2
    mov dx, offset p1Level
    mov bx, handler
    int 21h


    mov ah, 3FH
    mov cx, 10
    mov dx, offset person2
    mov bx, handler
    int 21h

    mov ah, 3FH
    mov cx, 5
    mov dx, offset num2
    mov bx, handler
    int 21h

    mov ah, 3FH
    mov cx, 2
    mov dx, offset p2Level
    mov bx, handler
    int 21h


    mov ah, 3FH
    mov cx, 10
    mov dx, offset person3
    mov bx, handler
    int 21h

    mov ah, 3FH
    mov cx, 5
    mov dx, offset num3
    mov bx, handler
    int 21h

    mov ah, 3FH
    mov cx, 2
    mov dx, offset p3Level
    mov bx, handler
    int 21h


    mov ah, 3FH
    mov cx, 10
    mov dx, offset person4
    mov bx, handler
    int 21h

    mov ah, 3FH
    mov cx, 5
    mov dx, offset num4
    mov bx, handler
    int 21h

    mov ah, 3FH
    mov cx, 2
    mov dx, offset p4Level
    mov bx, handler
    int 21h
    
    ret

readFile ENDP

writeFile PROC

    call readFile
    mov arrayIndex, 0
    mov di, offset scoreArray

    mov si, offset num1

    call convertStringToNum

    mov ax, bx

    mov bl, arrayIndex
    mov bh, 0

    mov[di + bx], ax
    inc di
    inc di


    mov si, offset num2

    call convertStringToNum

    mov ax, bx

    mov bl, arrayIndex
    mov bh, 0

    mov[di + bx], ax
    inc di
    inc di


    mov si, offset num3

    call convertStringToNum

    mov ax, bx

    mov bl, arrayIndex
    mov bh, 0

    mov[di + bx], ax
    inc di
    inc di


    mov si, offset num4

    call convertStringToNum

    mov ax, bx

    mov bl, arrayIndex
    mov bh, 0

    mov[di + bx], ax
    inc di
    inc di


    mov si, offset num5

    call convertStringToNum

    mov ax, bx

    mov bl, arrayIndex
    mov bh, 0

    mov[di + bx], ax


    mov si, offset scoreArray
    call sortScores


    mov ah, 3dh
    mov dx, offset file
    mov al, 1
    int 21h
    mov handler, ax


    mov ah, 40h
    mov bx, handler
    mov cx, 10
    mov dx, offset person1
    int 21h

    mov ah, 40h
    mov bx, handler
    mov cx, 5
    mov dx, offset num1
    int 21h

    mov ah, 40h
    mov bx, handler
    mov cx, 2
    mov dx, offset p1Level
    int 21h


    mov ah, 40h
    mov bx, handler
    mov cx, 10
    mov dx, offset person2
    int 21h

    mov ah, 40h
    mov bx, handler
    mov cx, 5
    mov dx, offset num2
    int 21h

    mov ah, 40h
    mov bx, handler
    mov cx, 2
    mov dx, offset p2Level
    int 21h


    mov ah, 40h
    mov bx, handler
    mov cx, 10
    mov dx, offset person3
    int 21h

    mov ah, 40h
    mov bx, handler
    mov cx, 5
    mov dx, offset num3
    int 21h

    mov ah, 40h
    mov bx, handler
    mov cx, 2
    mov dx, offset p3Level
    int 21h


    mov ah, 40h
    mov bx, handler
    mov cx, 10
    mov dx, offset person4
    int 21h

    mov ah, 40h
    mov bx, handler
    mov cx, 5
    mov dx, offset num4
    int 21h

    mov ah, 40h
    mov bx, handler
    mov cx, 2
    mov dx, offset p4Level
    int 21h

    ret
writeFile ENDP

wait1 MACRO time

    mov dx, 0
    .while dx < time
        inc dx
    .endw

endm

heart Macro inpChar, color
    mov ah,09         ; FUNCTION 9
    mov al,inpChar          ; HEART ASCII
    mov Bh, 0
    mov bl, color      ; PAGE 0, COLOR 4
    mov cx,0001     
    int 10H              

endm

drawBricks MACRO Bricks

    mov cx, Bricks.startX
    .while cx < Bricks.endx
        mov dx, Bricks.starty
        .while dx < Bricks.endY
            mov ah, 0Ch
            mov al, Bricks.color
            int 10h
            inc dx

        .endw

        inc cx
    .endw

endm

drawBall Macro ball1, color


    mov cx, ball1.startX_   
    inc cx
    inc cx
    inc cx
    mov dx, ball1.startY_    
    mov bh, 0
    mov al, color  
    mov ah, 0CH 
    int 10H

    mov cx, ball1.startX_   
    inc cx
    inc cx
    inc cx
    inc cx
    mov dx, ball1.startY_    
    mov bh, 0
    mov al, color  
    mov ah, 0CH 
    int 10H

    ;secondline

    mov cx, ball1.startX_  
    inc cx
    inc cx
    mov dx, ball1.startY_  
    inc dx
    mov bh, 0
    mov al, color  
    mov ah, 0CH 
    int 10H

    mov cx, ball1.startX_  
    inc cx
    inc cx
    inc cx
    mov dx, ball1.startY_   
    inc dx
    mov bh, 0
    mov al, color  
    mov ah, 0CH 
    int 10H

    mov cx, ball1.startX_   
    inc cx
    inc cx
    inc cx
    inc cx
    mov dx, ball1.startY_   
    inc dx
    mov bh, 0
    mov al, color  
    mov ah, 0CH 
    int 10H

    mov cx, ball1.startX_    
    inc cx
    inc cx
    inc cx
    inc cx
    inc cx
    mov dx, ball1.startY_   
    inc dx
    mov bh, 0
    mov al, color  
    mov ah, 0CH 
    int 10H

    ;thirdline

    mov cx, ball1.startX_   
    inc cx
    mov dx, ball1.startY_    
    inc dx
    inc dx
    mov bh, 0
    mov al, color  
    mov ah, 0CH 
    int 10H

    mov cx, ball1.startX_  
    inc cx
    inc cx
    mov dx, ball1.startY_    
    inc dx
    inc dx
    mov bh, 0
    mov al, color  
    mov ah, 0CH 
    int 10H

    mov cx, ball1.startX_    
    inc cx
    inc cx
    inc cx
    mov dx, ball1.startY_   
    inc dx
    inc dx
    mov bh, 0
    mov al, color  
    mov ah, 0CH 
    int 10H

    mov cx, ball1.startX_   
    inc cx
    inc cx
    inc cx
    inc cx
    mov dx, ball1.startY_    
    inc dx
    inc dx
    mov bh, 0
    mov al, color  
    mov ah, 0CH 
    int 10H

    mov cx, ball1.startX_   
    inc cx
    inc cx
    inc cx
    inc cx
    inc cx
    mov dx, ball1.startY_  
    inc dx
    inc dx
    mov bh, 0
    mov al, color  
    mov ah, 0CH 
    int 10H

    mov cx, ball1.startX_   
    inc cx
    inc cx
    inc cx
    inc cx
    inc cx
    inc cx
    mov dx, ball1.startY_    
    inc dx
    inc dx
    mov bh, 0
    mov al, color  
    mov ah, 0CH 
    int 10H

    ;fourthline

    mov cx, ball1.startX_   
    inc cx
    mov dx, ball1.startY_    
    inc dx
    inc dx
    inc dx
    mov bh, 0
    mov al, color  
    mov ah, 0CH 
    int 10H

    mov cx, ball1.startX_   
    inc cx
    inc cx
    mov dx, ball1.startY_   
    inc dx
    inc dx
    inc dx
    mov bh, 0
    mov al, color  
    mov ah, 0CH 
    int 10H

    mov cx, ball1.startX_    
    inc cx
    inc cx
    inc cx
    mov dx, ball1.startY_    
    inc dx
    inc dx
    inc dx
    mov bh, 0
    mov al, color  
    mov ah, 0CH 
    int 10H

    mov cx, ball1.startX_    
    inc cx
    inc cx
    inc cx
    inc cx
    mov dx, ball1.startY_    
    inc dx
    inc dx
    inc dx
    mov bh, 0
    mov al, color  
    mov ah, 0CH 
    int 10H

    mov cx, ball1.startX_    
    inc cx
    inc cx
    inc cx
    inc cx
    inc cx
    mov dx, ball1.startY_    
    inc dx
    inc dx
    inc dx
    mov bh, 0
    mov al, color  
    mov ah, 0CH 
    int 10H

    mov cx, ball1.startX_   
    inc cx
    inc cx
    inc cx
    inc cx
    inc cx
    inc cx
    mov dx, ball1.startY_    
    inc dx
    inc dx
    inc dx
    mov bh, 0
    mov al, color  
    mov ah, 0CH 
    int 10H

    ;secondline

    mov cx, ball1.startX_   
    inc cx
    inc cx
    mov dx, ball1.startY_   
    inc dx
    inc dx
    inc dx
    inc dx
    mov bh, 0
    mov al, color  
    mov ah, 0CH 
    int 10H

    mov cx, ball1.startX_    
    inc cx
    inc cx
    inc cx
    mov dx, ball1.startY_    
    inc dx
    inc dx
    inc dx
    inc dx
    mov bh, 0
    mov al, color  
    mov ah, 0CH 
    int 10H

    mov cx, ball1.startX_    
    inc cx
    inc cx
    inc cx
    inc cx
    mov dx, ball1.startY_    
    inc dx
    inc dx
    inc dx
    inc dx
    mov bh, 0
    mov al, color  
    mov ah, 0CH 
    int 10H

    mov cx, ball1.startX_    
    inc cx
    inc cx
    inc cx
    inc cx
    inc cx
    mov dx, ball1.startY_    
    inc dx
    inc dx
    inc dx
    inc dx
    mov bh, 0
    mov al, color  
    mov ah, 0CH 
    int 10H

    ;firstline

    mov cx, ball1.startX_    
    inc cx
    inc cx
    inc cx
    mov dx, ball1.startY_    
    inc dx
    inc dx
    inc dx
    inc dx
    inc dx
    mov bh, 0
    mov al, color  
    mov ah, 0CH 
    int 10H

    mov cx, ball1.startX_    
    inc cx
    inc cx
    inc cx
    inc cx
    mov dx, ball1.startY_    
    inc dx
    inc dx
    inc dx
    inc dx
    inc dx
    mov bh, 0
    mov al, color  
    mov ah, 0CH 
    int 10H
endm


drawPlatform MACRO brickColor, borderColor, pl   ;cx, dx
 ;to do list: we need to add dynamic borders, border color to this macro

    ;upper border
    mov cx, pl.start_x
    mov dx, pl.start_y
    dec dx
    .while cx < pl.end_x

        mov ah, 0Ch
        mov al, borderColor
        int 10h
        inc cx

    .endw

    ;lower border
    mov cx, pl.start_x
    mov dx, pl.end_y
    .while cx < pl.end_x

        mov ah, 0Ch
        mov al, borderColor
        int 10h
        inc cx

    .endw

    ;left border

    mov dx, pl.start_y
    dec dx
    mov cx, pl.start_x
    dec cx
    .while dx <= pl.end_y

        mov ah, 0Ch
        mov al, borderColor
        int 10h
        inc dx

    .endw

    ;right border

    mov dx, pl.start_y
    dec dx
    mov cx, pl.end_x
    .while dx <= pl.end_y

        mov ah, 0Ch
        mov al, borderColor
        int 10h
        inc dx

    .endw

    mov cx, pl.start_x
    .while cx < pl.end_x
        mov dx, pl.start_y
        .while dx < pl.end_y
            mov ah, 0Ch
            mov al, brickColor
            int 10h
            inc dx

        .endw

        inc cx
    .endw
    
endm


movePlayer MACRO

    drawPlatform 7, 8, p1 ;10 is green with 16 being black borders
    ;check if key is pressed
    mov ah, 1
    int 16h
    jz exitMacro
    mov ah, 0

    int 16h

    ;move right
    .if ah == 4dh
        ;make platform disappear by adding background color at its former position
        drawPlatform backColor, backColor,  p1
        add p1.start_x, 5
        add p1.end_x, 5

        .if p1.end_x >= 315
            .if Level == 1
                mov p1.end_x, 315
                mov p1.start_x, 235
            .endif
            .if Level == 2 || Level == 3
                mov p1.end_x, 315
                mov p1.start_x, 245
            .endif
            

        .endif

        

    .endif

    ;move left
    .if ah == 4bh
        ;make platform disappear by adding background color at its former position
        drawPlatform backColor, backColor,  p1
        sub p1.start_x, 5
        sub p1.end_x, 5

   

        .if p1.start_x <= 5
            .if Level == 1
                mov p1.end_x, 85
                mov p1.start_x, 5
            .endif

            .if Level == 2 || Level == 3
                mov p1.end_x, 75
                mov p1.start_x, 5
            .endif

        .endif



    .endif

    .if al == 8
        mov isPaused, 1
    .endif


    exitMacro:


endm


moveBall MACRO 


    ;make ball disappear first
    drawBall ball_, backColor

    mov bx, ball_.x_speed

    add ball_.startX_, bx
    add ball_.endx_, bx
    mov bx, ball_.y_speed

    add ball_.startY_, bx
    add ball_.endY_, bx

    
    ;if ball hits right boundary
    .if ball_.endx_ >= 320
        mov ball_.startX_, 314
        mov ball_.endx_, 320
        mov ball_.x_speed, -1
    .endif
    ;if ball hits left boundary
    .if ball_.startX_ <= 0
        mov ball_.startX_, 0
        mov ball_.endx_, 6
        mov ball_.x_speed, 1
    .endif

    ;if ball hits top boundary
    .if ball_.startY_ <= 30

        mov ball_.startY_, 30
        mov ball_.endY_, 36
        mov ball_.y_speed, 1

    .endif
    ;if ball hits lower boundary, reset its position and speeds
    ;randomize x_speed when ball resets
    .if ball_.endY_ >= 200
        dec hearts

        ;condtitional hearts
        .if hearts == 2
            setCursor 2, 12
            heart heartChar, barColor
        .endif

        .if hearts == 1
            setCursor 2, 11
            heart heartChar, barColor
        .endif

        ;check if there are no lives left
        .if hearts == 0
            setCursor 2, 10
            heart heartChar, barColor
            mov gameState, 6
        .endif

        rand 2
        .if randNum == 1
            mov ball_.x_speed, 1
        .endif

        .if randNum == 0
            mov ball_.x_speed, -1
        .endif

        mov ball_.startX_, 156
        mov ball_.startY_, 126
        mov ball_.endx_, 162
        mov ball_.endY_, 132
        drawBall ball_, 202
        
        
    .endif

    ;check if ball hit platform:
    mov bx, p1.start_y
    ;impact with player's border
    dec bx
    mov cx, p1.start_x
    mov dx, p1.end_x
    mov ax, p1.end_x
        


    .if ball_.endY_ >= bx && ball_.startX_ >= cx && ball_.startX_ <= dx
        .if Level == 1
            add cx, 40
            .if ball_.startX_ >= cx
                add cx, 17
                .if ball_.endx_ >= cx
                    mov ball_.x_speed, 1
                .else 
                     mov ball_.x_speed, 0
                .endif
               
            .else 
                mov ball_.x_speed, -1
            .endif

        .endif
        .if Level == 2 || Level == 3
            add cx, 35
            .if ball_.startX_ >= cx
                add cx, 10
                .if ball_.startX_ >= cx
                    mov ball_.x_speed, 1
                .else 
                    mov ball_.x_speed, 0
                .endif
                
            .else 
                mov ball_.x_speed, -1
            .endif

        .endif
        mov ball_.y_speed, -1
    .endif


    
    
    ;draw ball at updated position

    ;brick collision:

    FOR i, <b1, b2, b3, b4, b5, b6, b7, b8, b9, b11, b21, b31, b41, b51, b61, b71, b12, b22, b32, b42, b52, b62, b72, b82, b92, b13, b23, b33, b43, b53, b63, b73>
        
        mov ax, i.endY
        mov bx, i.startX
        mov dx, i.endx

        mov cx, i.isHit
        
        ;check if it hits lower half of a brick
        .if ball_.startY_ == ax && ball_.endx_ >= bx && ball_.startX_ <= dx && cx == 0
            call sound
            dec i.numHits
            .if i.numHits != 0 && i.fixedBrick == 0 && i.isSpecial == 0
                rand 255
                .while randNum == 8 || randNum == 57
                    rand 255
                .endw
                mov bl, randNum
                mov i.color, bl
                drawBricks i
            .endif
            .if i.numHits == 0 && i.fixedBrick == 0
                .if i.isSpecial == 1 && Level == 3
                    mov specialBrickHit, 1
                .endif
                dec bricksRemaining
                mov ax, scoreIncrementer
                add score, ax
                mov i.isHit, 1
                mov i.color, 57
               

                drawBricks i
            .endif
                mov ball_.y_speed, 1
        .endif

        mov ax, i.startY
        mov bx, i.startX
        mov dx, i.endx

        ;check if it hits upper half

        .if ball_.endY_ == ax && ball_.endx_ >= bx && ball_.startX_ <= dx && cx == 0
            call sound
            dec i.numHits
            .if i.numHits != 0 && i.fixedBrick == 0 && i.isSpecial == 0
                rand 255
                .while randNum == 8 || randNum == 57
                    rand 255
                .endw
                mov bl, randNum
                mov i.color, bl
                drawBricks i
            .endif
            .if i.numHits == 0 && i.fixedBrick == 0
                .if i.isSpecial == 1 && Level == 3
                    mov specialBrickHit, 1
                .endif
                dec bricksRemaining
                mov ax, scoreIncrementer
                add score, ax
                mov i.isHit, 1
                mov i.color, 57
                drawBricks i
                
            .endif
            mov ball_.y_speed, -1
        .endif

        mov ax, i.endx
        mov bx, i.startY
        mov dx, i.endY

        ;check if it hits right side of brick
        .if ball_.startX_ == ax && ball_.endY_ >= bx && ball_.startY_ <= dx && cx == 0
            call sound
            dec i.numHits
            .if i.numHits != 0 && i.fixedBrick == 0 && i.isSpecial == 0
                rand 255
                .while randNum == 8 || randNum == 57
                    rand 255
                .endw
                mov bl, randNum
                mov i.color, bl
                drawBricks i
            .endif
            .if i.numHits == 0 && i.fixedBrick == 0
                .if i.isSpecial == 1 && Level == 3
                    mov specialBrickHit, 1
                .endif
                dec bricksRemaining
                mov ax, scoreIncrementer
                add score, ax
                mov i.isHit, 1
                mov i.color, 57
                drawBricks i
                
            .endif
            mov ball_.x_speed, 1
        .endif

        mov ax, i.startX
        mov bx, i.startY
        mov dx, i.endY

        ;check if it hits left side of brick
        .if ball_.endx_ == ax && ball_.endY_ >= bx && ball_.startY_ <= dx && cx == 0
            call sound
            dec i.numHits
            .if i.numHits != 0 && i.fixedBrick == 0 && i.isSpecial == 0
                rand 255
                .while randNum == 8 || randNum == 57
                    rand 255
                .endw
                mov bl, randNum
                mov i.color, bl
                drawBricks i
            .endif
            .if i.numHits == 0 && i.fixedBrick == 0
                .if i.isSpecial == 1 && Level == 3
                    mov specialBrickHit, 1
                .endif
                dec bricksRemaining
                mov ax, scoreIncrementer
                add score, ax
                mov i.isHit, 1
                mov i.color, 57
                drawBricks i
                
            .endif
            mov ball_.x_speed, -1
        .endif

    endm

    drawBall ball_, 202

    .if specialBrickHit == 1
        .if bricksRemaining <= 5
            FOR j, <b1, b2, b3, b4, b5, b6, b7, b8, b9, b11, b21, b31, b41, b51, b61, b71, b12, b22, b32, b42, b52, b62, b72, b82, b92, b13, b23, b33, b43, b53, b63, b73>
                .if j.isHit == 0
                    dec bricksRemaining
                    .if j.fixedBrick == 0
                        mov ax, scoreIncrementer
                        add score, ax
                    .endif
                    mov j.isHit, 1
                    mov j.color, 57
                    drawBricks j
                .endif
            endm
        .else 
            FOR j, <b1, b2, b3, b4, b5, b6, b7, b8, b9, b11, b21, b31, b41, b51, b61, b71, b12, b22, b32, b42, b52, b62, b72, b82, b92, b13, b23, b33, b43, b53, b63, b73>
                .if j.isHit == 0 && numBricksDisappeared < 5
                    rand 20
                    .if randNum >= 0 && randNum < 20
                        dec bricksRemaining
                        inc numBricksDisappeared
                        .if j.fixedBrick == 0
                            mov ax, scoreIncrementer
                            add score, ax
                        .endif
                        mov j.isHit, 1
                        mov j.color, 57
                        drawBricks j
                    .endif
                .endif
            endm
        .endif


    .endif
    

endm

rand MACRO bound
    mov ah, 0 
    int 1ah
    
    mov ax, dx
    mov dx, 0
    mov bx, bound
    div bx
    mov randNum, dl
endm

cls MACRO

    mov cx, 0
    mov dx, 0

    .while cx < 320
        mov dx, 0
        .while dx < 200
            mov ah, 0Ch
            mov al, 0
            int 10h
            inc dx

        .endw

        inc cx

    .endw

endm


levelPage2 Macro dispLevelNum

    mov levelPageOption, 1
    mov level, 2
    mov bricksRemaining, 32
    setTheScene 202
    boxM 0, 70, 250, 40, 80
    setCursor 7, 10
    displayText dispLevelNum
    
    boxM 0, 70, 250, 95, 135
    setCursor 14, 17
    displayText menu6
    setCursor 14, 22
    heart 2, 132
    boxes:
    .if levelPageOption == 1
        drawBoxOutline 5, 70, 40, 250, 80
        drawBoxOutline 7, 70, 95, 250, 135
    .endif

    .if levelPageOption == 2
        drawBoxOutline 7, 70, 40, 250, 80
        drawBoxOutline 5, 70, 95, 250, 135
    .endif



    mov ah, 0
    int 16h

    .if ah == 50h

        .if levelPageOption == 1
            mov levelPageOption, 2

        .elseif levelPageOption == 2
            mov levelPageOption, 1

        .endif


    .endif

    .if ah == 48h

        .if levelPageOption == 2
            mov levelPageOption, 1

        .elseif levelPageOption == 1
            mov levelPageOption, 2

        .endif

    .endif

    .if al != 13

        jmp boxes

    .endif
    .if Level == 2
        .if levelPageOption == 1
            mov Level, 2
            mov gameState, 2
            mov scoreIncrementer, 2
            ;change gameDelay
            mov gameDelay, 14000
        .endif
    .endif

    .if Level == 3
        .if levelPageOption == 1
            mov Level, 3
            mov gameState, 2
            mov scoreIncrementer, 3
            ;change gameDelay
            mov gameDelay, 10000
        .endif
    .endif



    .if levelPageOption == 2
        mov gameState, 6
    .endif

endm

levelPage3 Macro dispLevelNum

    mov levelPageOption, 1
    mov Level, 3
    mov bricksRemaining, 32
    mov specialBrickHit, 0
    mov numBricksDisappeared, 0
    setTheScene 202
    boxM 0, 70, 250, 40, 80
    setCursor 7, 10
    displayText dispLevelNum
    
    boxM 0, 70, 250, 95, 135
    setCursor 14, 17
    displayText menu6
    setCursor 14, 22
    heart 2, 132
    boxes3:
    .if levelPageOption == 1
        drawBoxOutline 5, 70, 40, 250, 80
        drawBoxOutline 7, 70, 95, 250, 135
    .endif

    .if levelPageOption == 2
        drawBoxOutline 7, 70, 40, 250, 80
        drawBoxOutline 5, 70, 95, 250, 135
    .endif



    mov ah, 0
    int 16h

    .if ah == 50h

        .if levelPageOption == 1
            mov levelPageOption, 2

        .elseif levelPageOption == 2
            mov levelPageOption, 1

        .endif


    .endif

    .if ah == 48h

        .if levelPageOption == 2
            mov levelPageOption, 1

        .elseif levelPageOption == 1
            mov levelPageOption, 2

        .endif

    .endif

    .if al != 13

        jmp boxes3

    .endif
    .if Level == 2
        .if levelPageOption == 1
            mov Level, 2
            mov gameState, 2
            mov scoreIncrementer, 2
            ;change gameDelay
            mov gameDelay, 14000
        .endif
    .endif

    .if Level == 3
        .if levelPageOption == 1
            mov Level, 3
            mov gameState, 2
            mov scoreIncrementer, 3
            ;change gameDelay
            mov gameDelay, 10000
        .endif
    .endif



    .if levelPageOption == 2
        mov gameState, 6
    .endif

endm


generateBricks MACRO
    
    FOR i, <b1, b2, b3, b4, b5, b6, b7, b8, b9, b11, b21, b31, b41, b51, b61, b71, b12, b22, b32, b42, b52, b62, b72, b82, b92, b13, b23, b33, b43, b53, b63, b73>
        rand 255
        mov bl, fixedBrickColor
        mov cl, specialBrickColor
        .while randNum == 57 || randNum == bl || randNum == cl
            rand 255
        .endw
        wait1 100000
        mov bl, randNum
        mov i.isHit, 0
        mov i.color, bl
        
        .if Level == 1
            mov i.numHits, 1
        .elseif Level == 2
            mov i.numHits, 2
        .elseif Level == 3
            rand 5
            .if randNum == 0 && numberOfFixedBricks != 5
                mov i.fixedBrick, 1
                mov bl, fixedBrickColor
                mov i.color, bl
                inc numberOfFixedBricks
            .endif
            mov i.numHits, 3
            rand 5
            .if randNum == 1 && numSpecialBricks < 1
                mov i.isSpecial, 1
                mov bl, specialBrickColor
                mov i.color, bl
                inc numSpecialBricks
            .endif

        .endif
        drawBricks i
    endm

endm

drawUnCollidedBricks MACRO

    FOR i, <b1, b2, b3, b4, b5, b6, b7, b8, b9, b11, b21, b31, b41, b51, b61, b71, b12, b22, b32, b42, b52, b62, b72, b82, b92, b13, b23, b33, b43, b53, b63, b73>
        .if i.isHit == 0
            drawBricks i
        .endif
        
    endm

endm

resetBricksCollision MACRO

    FOR i, <b1, b2, b3, b4, b5, b6, b7, b8, b9, b11, b21, b31, b41, b51, b61, b71, b12, b22, b32, b42, b52, b62, b72, b82, b92, b13, b23, b33, b43, b53, b63, b73>
        mov i.isHit, 0
        .if Level == 1
            mov i.numHits, 1
        .elseif Level == 2
            mov i.numHits, 2
        .elseif Level == 3
            mov i.numHits, 3
        .endif
        
    endm


endm

setCursor MACRO row, column

    mov ah, 2
    mov dh, row
    mov dl, column
    mov bh, 0
    int 10h

endm

displayText MACRO string
    mov dx, 0
    mov al, 0
    mov ah, 09h
    mov dx, offset string
    int 21h

endm

scoreM macro num
    
    mov dx, 0
    mov ax, num

    mov bx, 10
    div bx
    push dx
    xor dx, dx
    
    mov bx, 10
    div bx
    push dx
    xor dx, dx

    mov bx, 10
    div bx
    push dx
    xor dx, dx

    pop dx
    add dx, 48
    mov ah, 02h
    int 21h

    pop dx
    add dx, 48
    mov ah, 02h
    int 21h

    pop dx
    add dx, 48
    mov ah, 02h
    int 21h

endm

;random macro for random num generation for colors etc





;Main Menu
mainMenu MACRO
    mov mainMenuOption, 1
    setTheScene 202
    boxM 0, 60, 260, 5, 195
    setCursor 1, 13
    displayText welcomeMsg
    setCursor 1, 21
    displayName nameInp
    setCursor 4, 16 
    displayText menu2
    setCursor 8, 17
    displayText menu3
    setCursor 12, 14
    displayText menu4
    setCursor 16, 15
    displayText menu5
    setCursor 20, 18
    displayText menu6
    dabbay:
    .if mainMenuOption == 1
        drawBoxOutline 5, 100, 26, 215, 48
        drawBoxOutline 15, 100, 58, 215, 78
        drawBoxOutline 15, 100, 90, 215, 110
        drawBoxOutline 15, 100, 120, 215, 140
        drawBoxOutline 15, 100, 150, 215, 172
    .endif

    .if mainMenuOption == 2
        drawBoxOutline 15, 100, 26, 215, 48
        drawBoxOutline 5, 100, 58, 215, 78
        drawBoxOutline 15, 100, 90, 215, 110
        drawBoxOutline 15, 100, 120, 215, 140
        drawBoxOutline 15, 100, 150, 215, 172
    .endif

    .if mainMenuOption == 3
        drawBoxOutline 15, 100, 26, 215, 48
        drawBoxOutline 15, 100, 58, 215, 78
        drawBoxOutline 5, 100, 90, 215, 110
        drawBoxOutline 15, 100, 120, 215, 140
        drawBoxOutline 15, 100, 150, 215, 172
    .endif

    .if mainMenuOption == 4
        drawBoxOutline 15, 100, 26, 215, 48
        drawBoxOutline 15, 100, 58, 215, 78
        drawBoxOutline 15, 100, 90, 215, 110
        drawBoxOutline 5, 100, 120, 215, 140
        drawBoxOutline 15, 100, 150, 215, 172
    .endif

    .if mainMenuOption == 5
        drawBoxOutline 15, 100, 26, 215, 48
        drawBoxOutline 15, 100, 58, 215, 78
        drawBoxOutline 15, 100, 90, 215, 110
        drawBoxOutline 15, 100, 120, 215, 140
        drawBoxOutline 5, 100, 150, 215, 172
    .endif

    mov ah, 0
    int 16h

    .if ah == 50h

        .if mainMenuOption == 1
            mov mainMenuOption, 2

        .elseif mainMenuOption == 2
                mov mainMenuOption, 3

        .elseif mainMenuOption == 3

                mov mainMenuOption, 4

        .elseif mainMenuOption == 4

                mov mainMenuOption, 5
        .elseif mainMenuOption == 5

                mov mainMenuOption, 1
        .endif





    .endif

    .if ah == 48h

        .if mainMenuOption == 2
            mov mainMenuOption, 1

        .elseif mainMenuOption == 3
                mov mainMenuOption, 2

        .elseif mainMenuOption == 4

                mov mainMenuOption, 3

        .elseif mainMenuOption == 1

                mov mainMenuOption, 5
        .elseif mainMenuOption == 5

                mov mainMenuOption, 4
        
        .endif

    .endif

    ;exits from main menu on backspace
    .if al == 8

        jmp exitFromMenu

    .endif

    .if al != 13

        jmp dabbay

    .endif


    .if mainMenuOption == 1
        mov gameState, 2
        mov Level, 1
        
    .endif

    .if mainMenuOption == 2
        
        .if hearts != 0 && gameStarted
            mov gameState, 2
            jmp resume
        .endif
        jmp dabbay
        
    .endif

    .if mainMenuOption == 3
        mov gameState, 4
    .endif

    .if mainMenuOption == 4
        mov gameState, 5
    .endif
    ;exits game
    .if mainMenuOption == 5
        mov gameState, 0
        jmp exitFromMenu
    .endif


endm


fileHandling MACRO
    mov si, offset nameInp + 2
    mov di, offset person5
    mov ax, 0

    .while ax < 10

        mov bl, [si]
        mov [di], bl
        inc si
        inc di
        inc ax


    .endw
    call updateScore
    mov si, offset scoreString
    mov di, offset num5
    mov ax, 0

    .while ax < 5

        mov bl, [si]
        mov [di], bl
        inc si
        inc di
        inc ax


    .endw

    ; mov si, offset p5Level

    ; .if Level == 1

    ;     mov al, 1
    ;     mov [si], al
    ;     inc si
    ;     mov al, '$'
    ;     mov [si], al

    ; .elseif Level == 2

    ;     mov al, 2
    ;     mov [si], al
    ;     inc si
    ;     mov al, '$'
    ;     mov [si], al

    ; .elseif Level == 3

    ;     mov al, 3
    ;     mov [si], al
    ;     inc si
    ;     mov al, '$'
    ;     mov [si], al

    ; .endif

endm

resetBallPosition MACRO
    mov ball_.startX_, 156
    mov ball_.startY_, 152
    mov ball_.endx_, 162
    mov ball_.endY_, 158

    rand 2
    .if randNum == 1
        mov ball_.x_speed, 1
    .endif

    .if randNum == 0
        mov ball_.x_speed, -1
    .endif

    mov ball_.y_speed, 1
endm

resetPlayerPosition MACRO
    .if Level == 1
        mov p1.start_x, 120
        mov p1.start_y, 185
        mov p1.end_x, 200
        mov p1.end_y, 190
    .endif

    .if Level == 2
        mov p1.start_x, 125
        mov p1.start_y, 185
        mov p1.end_x, 195
        mov p1.end_y, 190

    .endif

    .if Level == 3
        mov p1.start_x, 125
        mov p1.start_y, 185
        mov p1.end_x, 195
        mov p1.end_y, 190

    .endif

endm

nameInput MACRO 
    mov ah, 0ah
    mov dx, offset nameInp 
    int 21h
    mov si, offset nameInp + 1
    mov cl, [si]
    mov ch, 0
    inc cx
    add si, cx
    mov al, '$'
    mov [si], al

endm

boxM MACRO color, x1, x2, y1, y2

    mov cx, x1

    .while cx < x2
        mov dx, y1
        .while dx < y2
            mov ah, 0Ch
            mov al, color
            int 10h
            inc dx

        .endw

        inc cx

    .endw

endm

;Title Page
TitlePage Macro 

    setTheScene 202
    boxM 0, 63, 250, 60, 130
    setCursor 9, 12
    displayText namePrompt
    drawBoxOutline 5, 78, 90, 232, 110
    setCursor 12, 16
    nameInput



endm

;Exit Page
exitPage MACRO  
    mov exitPageOption, 1
    setTheScene 202
    boxM 0, 67, 250, 35, 170
    setCursor 7, 11
    displayText exitMessage
    setCursor 7, 28
    heart 1, 15
    setCursor 11, 15
    displayText optn1
    setCursor 15, 16
    displayText optn2

    exitDabbay:

    .if exitPageOption == 1
        drawBoxOutline 5, 95, 75, 225, 100
        drawBoxOutline 7, 95, 110, 225, 135
    .endif

    .if exitPageOption == 2
        drawBoxOutline 7, 95, 75, 225, 100
        drawBoxOutline 5, 95, 110, 225, 135
    .endif

    mov ah, 0
    int 16h

    .if ah == 50h

        .if exitPageOption == 1
            mov exitPageOption, 2

        .elseif exitPageOption == 2
            mov exitPageOption, 1

        .endif


    .endif

    .if ah == 48h

        .if exitPageOption == 2
            mov exitPageOption, 1

        .elseif exitPageOption == 1
            mov exitPageOption, 2

        .endif

    .endif

    .if al != 13

        jmp exitDabbay

    .endif

    ;go back to main menu
    .if exitPageOption == 1
        mov gameState, 1
        mov Level, 1
    .endif
    ;exit game 
    .if exitPageOption == 2
        jmp exitFromMenu
    .endif

endm

InstructionPage Macro 

    setTheScene 202
    boxM 0, 10, 310, 10, 190
    setCursor 4, 4
    displayText ins1
    setCursor 6, 4
    displayText ins2
    setCursor 9, 4
    displayText ins3
    setCursor 11, 4
    displayText ins4
    setCursor 14, 4
    displayText ins5
    setCursor 16, 4
    displayText ins6
    drawBoxOutline 5, 60, 150, 260, 175
    setCursor 20, 10
    displayText backButton

endm

table Macro color, yCoord

    mov cx, 28   ;(column)

    .while cx < 290  
        inc cx
        mov dx, yCoord    ;(row)
        mov al, color
        mov ah, 0ch
        int 10h
    .endw

    mov cx, 160
    mov dx, 40
    .while dx < 146
        inc dx
        mov al, color
        mov ah, 0ch
        int 10h
    .endw

endm

highMacro MACRO
    call readFile
    setTheScene 202
    boxM 0, 15, 305, 10, 195
    setCursor 3, 15
    displayText dispHigh
    setCursor 6, 9
    displayText person1
    setCursor 6, 27
    displayText num1
    table 57, 63
    setCursor 10, 8
    displayText person2
    setCursor 10, 27
    displayText num2
    table 57, 93
    setCursor 14, 9
    displayText person3
    setCursor 14, 27
    displayText num3
    table 57, 123
    setCursor 17, 8
    displayText person4
    setCursor 17, 27
    displayText num4
    table 57, 147
    drawBoxOutline 5, 60, 160, 260, 185
    setCursor 21, 10
    displayText backButton
endm



PauseScreen MACRO 
    mov pauseMenuOption, 1
    setTheScene 202
    boxM 0, 83, 230, 20, 175
    setCursor 4, 14
    displayText pause4
    setCursor 8, 14
    displayText pause1
    setCursor 13, 15
    displayText pause2
    setCursor 18, 16
    displayText pause3

    pauseDabbay:

    .if pauseMenuOption == 1
        drawBoxOutline 5, 93, 55, 220, 80
        drawBoxOutline 26, 93, 95, 220, 120
        drawBoxOutline 26, 93, 135, 220, 160
    .endif

    .if pauseMenuOption == 2
        drawBoxOutline 26, 93, 55, 220, 80
        drawBoxOutline 5, 93, 95, 220, 120
        drawBoxOutline 26, 93, 135, 220, 160
    .endif

    .if pauseMenuOption == 3
        drawBoxOutline 26, 93, 55, 220, 80
        drawBoxOutline 26, 93, 95, 220, 120
        drawBoxOutline 5, 93, 135, 220, 160
    .endif

    mov ah, 0
    int 16h

    .if ah == 50h

        .if pauseMenuOption == 1
            mov pauseMenuOption, 2

        .elseif pauseMenuOption == 2
            mov pauseMenuOption, 3

        .elseif pauseMenuOption == 3

            mov pauseMenuOption, 1
        .endif

    .endif

    .if ah == 48h

        .if pauseMenuOption == 2
            mov pauseMenuOption, 1

        .elseif pauseMenuOption == 3
            mov pauseMenuOption, 2

        .elseif pauseMenuOption == 1

            mov pauseMenuOption, 3
        .endif

    .endif

    .if al != 13

        jmp pauseDabbay

    .endif
    ;resume game
    .if pauseMenuOption == 1
        
        .if hearts != 0
            mov gameState, 2
            mov isPaused, 0
            jmp resume
        .endif

    .endif
    ;start over goes to menu
    .if pauseMenuOption == 2
        mov gameState, 1
        mov isPaused, 0
        mov Level, 1
        jmp dontResume

    .endif
    ;go to exit page
    .if pauseMenuOption == 3
        mov gameState, 6
        mov isPaused, 0
        jmp dontResume
    .endif

    

    
endm

frontPage Macro
    wait1 1000
    setTheScene 202
    boxM 0, 0, 320, 0, 20
    boxM 0, 0, 20, 0, 200
    boxM 0, 0, 320, 180, 200
    boxM 0, 300, 320, 0, 200

    wait1 1000000

    boxM 129, 28, 55, 25, 35 
    boxM 130, 60, 85, 25, 35
    boxM 131, 90, 115, 25, 35
    boxM 132, 120, 145, 25, 35 
    boxM 133, 150, 175, 25, 35
    boxM 134, 180, 205, 25, 35
    boxM 135, 210, 235, 25, 35 
    boxM 136, 240, 265, 25, 35
    boxM 137, 270, 295, 25, 35

    wait1 1000000
    
    boxM 148, 42, 67, 40, 50 
    boxM 149, 72, 97, 40, 50
    boxM 150, 102, 127, 40, 50
    boxM 151, 132, 157, 40, 50 
    boxM 152, 162, 187, 40, 50
    boxM 153, 192, 217, 40, 50
    boxM 154, 222, 247, 40, 50 
    boxM 155, 252, 277, 40, 50

    wait1 1000000

    boxM 156, 28, 55, 55, 65 
    boxM 157, 60, 85, 55, 65
    boxM 158, 90, 115, 55, 65
    boxM 159, 120, 145, 55, 65 
    boxM 160, 150, 175, 55, 65
    boxM 161, 180, 205, 55, 65
    boxM 162, 210, 235, 55, 65 
    boxM 163, 240, 265, 55, 65
    boxM 164, 270, 295, 55, 65

    wait1 1000000

    boxM 172, 42, 67, 80, 90 
    boxM 174, 252, 277, 80, 90

    wait1 1000000

    boxM 207, 28, 55, 95, 105 
    boxM 110, 60, 85, 95, 105
    boxM 115, 240, 265, 95, 105
    boxM 114, 270, 295, 95, 105

    wait1 1000000

    boxM 184, 42, 67, 110, 120 
    boxM 187, 252, 277, 110, 120

    wait1 1000000

    boxM 0, 70, 250, 75, 125
    setCursor 12, 11
    displayText menu1

    wait1 1000000

    boxM 156, 28, 55, 130, 140 
    boxM 157, 60, 85, 130, 140
    boxM 158, 90, 115, 130, 140
    boxM 159, 120, 145, 130, 140 
    boxM 160, 150, 175, 130, 140
    boxM 161, 180, 205, 130, 140
    boxM 162, 210, 235, 130, 140 
    boxM 163, 240, 265, 130, 140
    boxM 164, 270, 295, 130, 140

    wait1 1000000
    
    boxM 148, 42, 67, 145, 155 
    boxM 149, 72, 97, 145, 155
    boxM 150, 102, 127, 145, 155
    boxM 151, 132, 157, 145, 155 
    boxM 152, 162, 187, 145, 155
    boxM 153, 192, 217, 145, 155
    boxM 154, 222, 247, 145, 155 
    boxM 155, 252, 277, 145, 155
    wait1 1000000

    boxM 129, 28, 55, 160, 170 
    boxM 130, 60, 85, 160, 170
    boxM 131, 90, 115, 160, 170
    boxM 132, 120, 145, 160, 170 
    boxM 133, 150, 175, 160, 170
    boxM 134, 180, 205, 160, 170
    boxM 135, 210, 235, 160, 170 
    boxM 136, 240, 265, 160, 170
    boxM 137, 270, 295, 160, 170
    wait1 1000000
    boo:
    mov ah, 1
    int 16h
    jz boo
    mov ah, 0

    int 16h

    .if al != 13
        jmp boo
    .endif
endm

SingleDig MACRO num
    mov dl, num
    add dl, '0'
    mov ah, 02
    int 21h
endm

afterPause MACRO
    setTheScene backColor ;  background color
    setTheBar barColor
    setCursor 1, 3
    displayText strDisp1
    setCursor 2, 3
    displayText strDisp2
    .if hearts == 1
        setCursor 2, 10
        heart heartChar, 4
    .endif
    .if hearts == 2
        setCursor 2, 10
        heart heartChar, 4
        setCursor 2, 11
        heart heartChar, 4
    .endif
    .if hearts == 3
        setCursor 2, 10
        heart heartChar, 4
        setCursor 2, 11
        heart heartChar, 4
        setCursor 2, 12
        heart heartChar, 4
    .endif

    setCursor 1, 23
    displayText strDisp3
    setCursor 1, 29
    displayName nameInp

    setCursor 2, 23
    displayText levelsTab
    setCursor 2, 29
    SingleDig level
    drawUnCollidedBricks
    
endm


swapString PROC

    stringSwapLoop:

        mov si, tempString1
        mov al, [si]
        mov si, tempString2
        mov bl, [si]

        mov si, tempString1
        mov [si], bl
        mov si, tempString2
        mov [si], al

        inc tempString1
        inc tempString2

        dec swapCounter
        CMP swapCounter, 0
        JNE stringSwapLoop


    ret

swapString ENDP


sound PROC
    mov     al, 182       
    out     43h, al    
    mov     ax, frequency       
    out     42h, al         
    mov     al, ah          
    out     42h, al               

    in      al, 61h         
    or      al, 00000011b  
    out     61h, al         
    mov bx, 2
first:
    mov cx, 65535
second:
    dec cx
    jne second
    dec bx
    jne first
    in al, 61h

    and al, 11111100b
    out 61h, al

    ret

sound ENDP

updateScore PROC

    pop di

    mov si, offset scoreString
    mov al, '$'
    mov [si], al
    inc si
    mov [si], al
    inc si
    mov [si], al
    inc si
    mov [si], al
    inc si
    mov [si], al
    inc si

    mov si, offset scoreString
    mov bx, 0

    .if score == bx

        mov cx, '0'
        mov [si], cx
        inc si

        mov cx, '$'
        mov [si], cx

    .endif

    mov bx, 0

    .if score != bx

        mov cx, score
        mov tempScore, cx
        mov cx, 0
        mov ax, tempScore

        divideLoop:

            xor dx, dx
            div divider
            add dx, 48
            push dx
            inc  cx

            TEST ax, ax
            jnz divideLoop

        mov si, offset scoreString

        mov ah, 1
        int 16h

        stringLoop:

            pop ax
            mov [si], ax
            inc si

            loop stringLoop

        mov ax, '$'
        mov [si], ax

    .endif

    push di

    ret

updateScore ENDP


game:

main PROC

    enterVideoMode ;320 x 200


    mov gameState, 1
    cls
    frontPage

    TitlePage



    .while gameState
        .if gameState == 1
            cls
            mainMenu
        .endif
        ;newgame starts
        newGame:
        .if gameState == 2
            .if Level == 1
                mov scoreIncrementer, 1
                mov gameDelay, 16000
                mov score, 0
                mov hearts, 3
            .endif
            mov gameStarted, 1
            resetBallPosition
            resetPlayerPosition
            resetBricksCollision
            cls
            setTheScene backColor ;  background color
            setTheBar barColor
            .if hearts == 1
                setCursor 2, 10
                heart heartChar, 4
            .endif
            .if hearts == 2
                setCursor 2, 10
                heart heartChar, 4
                setCursor 2, 11
                heart heartChar, 4
            .endif
            .if hearts == 3
                setCursor 2, 10
                heart heartChar, 4
                setCursor 2, 11
                heart heartChar, 4
                setCursor 2, 12
                heart heartChar, 4
            .endif
            setCursor 1, 3
            displayText strDisp1
            setCursor 2, 3
            displayText strDisp2

            setCursor 1, 23
            displayText strDisp3
            setCursor 1, 29
            displayName nameInp
            setCursor 2, 23
            displayText levelsTab
            generateBricks
            setCursor 2, 29

            SingleDig level
            .while gameState == 2
                wait1 gameDelay
                moveBall
                ; flickering pls be fixed :'( 
                movePlayer 
                setCursor 1, 10
                scoreM score
                .if score == 32 && Level != 2
                    cls
                    levelPage2 level2Disp
                    ;change gameDelay in levelPage
                    jmp newGame
                .endif
                .if score == 96 && Level == 2
                    cls
                    levelPage3 level3Disp
                    jmp newgame
                .endif
                ; 27 x 4, 5 fixed bricks
                .if score >= 177 && Level == 3
                    fileHandling
                    call writeFile
                    cls
                    winnerScreen
                    plsexit:
                    mov ah, 0
                    int 16h
                    .if al == 13
                        jmp exitFromMenu
                    .else 
                        jmp plsexit
                    .endif
                .endif
                ;implement pause menu functionality
                .if isPaused
                    cls
                    PauseScreen
                    resume:

                    cls
                    afterPause
                    
                    dontResume:
                .endif

            .endw
        .endif 
        ;instructions screen
        .if gameState == 4 
            cls
            InstructionPage
            mov ah, 0
            int 16h
            ;enter to go back to main menu
            .if al == 13
                mov gameState, 1
            .endif
        .endif

        ;HIGHSCORE SCREEN

        .if gameState == 5
            cls
            highMacro
            mov ah, 0
            int 16h
            .if al == 13
                mov gameState, 1
            .endif
        .endif

        .if gameState == 6
            fileHandling
            call writeFile

            cls
            exitPage
        .endif
  
    .endw

main endp

exitFromMenu:
cls
mov ah, 4ch
int 21h
end
