with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with ada.numerics.elementary_functions; use ada.numerics.elementary_functions;
with Ada.Text_IO; use Ada.Text_IO;

package body stack is

type stackArray is array (0..1000000) of integer;

type q_stack is
record
    item : stackArray := (0..1000000 => 0); --Array of 1000000 integers
    top : integer := -1; --Always at the top of the stack
end record;

st : q_stack;

    procedure push(x : in integer) is
        begin
        if st.top >= st.item'Length then
            put("Error: stack overflow");
            return;
        else
            st.top := st.top + 1;
            st.item(st.top) := x;
        end if;
    end push;

    procedure pop(x : out integer) is
    begin
        if stackEmpty = True then
            put("Error: stack underflow");
            x := 0;
            return;
        else
            x := st.item(st.top);
            st.top := st.top - 1;
        end if;
    end pop;

    function stackEmpty return Boolean is
    begin
        if st.top = -1 then
            return True;
        else
            return False;
        end if;
    end stackEmpty;

    function stackTop return integer is
    begin
        return st.top;
    end stackTop;


end stack;
