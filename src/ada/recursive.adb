---------------------------------------------------------------------
-- recursive.adb - Source file for recursive ackermann function in ada
-- School of Computer Science - W15
-- University of Guelph
-- Author: Gregory Schofield
---------------------------------------------------------------------
with Ada.Calendar; use Ada.Calendar;
with Ada.Text_IO; use Ada.Text_IO;
with ada.Integer_Text_IO; use Ada.Integer_Text_IO;


procedure recursive is
--Function for calculating Ackermann value

    function Ackermann (M, N : Natural) return Natural is
    begin
        if M = 0 then
            return N + 1;
        elsif N = 0 then
            return Ackermann (M - 1, 1);
        else
            return Ackermann (M - 1, Ackermann (M, N - 1));
        end if;
    end Ackermann;
--End of the Ackermann Function

--Continue with the main procedure
    Start_Time : Time;
    Finish_Time : Time;
    x : Natural;
    timing : Duration;
    input1, input2 : integer;
begin
    Put_line("****Recursive Ackermann in Ada****");
    Put_line("Enter m and n: ");
    get(input1);
    get(input2);
    Start_Time:= Clock;
    x := Ackermann (input1, input2);
    Finish_Time := Clock;
    timing := Finish_Time - Start_Time;
    Put("Result = " & Natural'Image(x));
    New_Line;
    Put_Line("Ackermann takes" & Duration'Image(timing*1000) & " milliseconds.");
    New_Line;
end recursive;
