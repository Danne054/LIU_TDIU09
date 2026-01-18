with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;     use Ada.Float_Text_IO;
with Ada.Text_IO;           use Ada.Text_IO;

procedure adap3 is 
   
   subtype Char_Range is 
     Character range '4'..'8';
   
   subtype Char_Range1 is 
     Boolean range False .. True;
     
   type Golf_Type is 
     array (Char_Range1, Char_Range) of Integer;

   DS3 : Golf_Type;
   
   Counter : Integer := 1;
begin
   
   for X in Char_Range1 loop 
      
      for Y in Char_Range loop
	 DS3(X, Y) := Counter;
	 Counter := Counter + 1;
	 Put(DS3(X, Y), Width => 3);
      end loop;
      New_Line;
   end loop;
   
end adap3;
