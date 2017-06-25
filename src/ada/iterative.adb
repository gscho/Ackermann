---------------------------------------------------------------------
-- iterative.adb - Source file for iterative ackermann function in ada
-- School of Computer Science - W15
-- University of Guelph
-- Author: Gregory Schofield
---------------------------------------------------------------------
with ada.Text_IO; use ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;
with ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with stack; use stack;

procedure iterative is

--Function for calculating Ackermann value
    function Ackermann(input1 : in Integer; input2 : in Integer)return Natural is
    m,n : Integer;
    begin
    m := input1;
    n := input2;
        push(m);
        loop
            exit when stackEmpty = True;
            pop(m);
            if m = 0 then
                n := n + 1;
            elsif n = 0 then
                n := 1;
                push(m-1);
            else
                n := n - 1;
                push(m-1);
                push(m);
            end if;
        end loop;
    return n;
    end Ackermann;
--End of the Ackermann Function


--Continue with the main procedure
    x, m, n : integer;
    Start_Time : Time;
    Finish_Time : Time;
    timing : Duration;
begin
    Put_line("****Iterative Ackermann in Ada****");
    Put_line("Enter m and n: ");
    get(m);
    get(n);
    Start_Time:= Clock;
    x := Ackermann(m,n);
    Finish_Time := Clock;
    timing := Finish_Time - Start_Time;
    Put_line("Result = " & Natural'Image(x));
    Put_Line("Ackermann takes" & Duration'Image(timing*1000) & " milliseconds.");
end iterative;
