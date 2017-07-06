@echo off
::This is a test
cls
cd C:\Users\%username%\Desktop\FendAssistant\Memory
cls
goto check

:check
cls
if EXIST name.sav goto load_name
else ( goto main_name)


:main_name
cls
Echo Hello! My name is Fend, who may you be?
echo.
set /p name=Name:
(
echo %name%
)> name.sav
cls
goto load_name

:load_name
cls
< name.sav (
set /p name=
)
cls
goto greet

:greet
cls
cls
echo Greetings %name%!
pause
cls
goto main

:main
cls
echo Say something and I will see if I can help!
echo.
set /p search=
cls
goto decide_data_base

:decide_data_base
cls
if %search% == Time goto time_is
else ( goto decide_data_base_to)

:decide_data_base_to
cls
if %search% == credits goto credits
else ( goto decide_data_base_three)

:decide_data_base_three
cls
if %search% == Date goto date_is
else ( goto decide)

:decide
cls
echo Ok, is this a program to start?
echo or is this searching my memory?
echo or do you want me to search the internet?
echo.
echo 1)Start Program
echo 2)Search Fend's Memory
echo 3)Search Internet
set /p hu=

if %hu% == 1 goto begin_soft
if %hu% == 2 goto does_it_exist
if %hu% == 3 goto search
goto decide

:date_is
cls
echo You seemed to ask what the date was!
echo.
echo The date is: %date%
pause
cls
goto main

:credits
cls
echo Beginner Programmer(First Programmer):Joey Bost
echo If your someone who helpped this develop, email
echo me so I can add it in!
pause
cls
goto main

:time_is
cls
echo Looks like you asked the time!
echo.
echo Time is: %time%
pause
cls
goto main

:does_it_exist_test
cls
echo %search%
pause
cls
exit

:does_it_exist
cls
if EXIST %search%.sav goto read_data
else ( goto learn)


:learn
cls
echo Huh, looks like I do not know this, please
echo teach me so I can help out later!
echo.
echo Please give me a description on this!
echo.
set /p Description=Description:
cls
(
echo %description%
)> %search%.sav
cls
echo Thanks, now I have learned for future
echo refrenses!
pause
cls
goto main

:read_data
cls
< %search%.sav (
set /p description=
)
cls
goto des_i_learned

:des_i_learned
cls
echo Well here is the description I learned!
echo.
echo %description%
pause
cls
goto main

:search
cls
explorer "http://www.google.com/search?q=%search%"
cls
echo Alright right then, I have looked up %search%!
echo Give it a few seconds to open up your internet!
pause
cls
goto main

:begin_soft
cls
start %search%.exe
cls
echo Ok, I have now started %search%!
echo It must be a .exe file if it does not
echo open up!
pause
cls
goto main


