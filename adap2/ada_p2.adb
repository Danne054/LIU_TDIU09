with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;     use Ada.Float_Text_IO;
with Ada.Text_IO;           use Ada.Text_IO;

procedure Ada_P2 is 
   
   -------------deluppgift 1------------------------------------------------
   procedure Addisions_And_Get (Add_String    : out string;
				Add_Character : out Character;
			        Sum_Result    : out Float) is 
      
      Digit_Int : Integer;
   begin
      
      Put("Mata in en sträng med exakt 3 tecken: ");
      Get(Add_String );
      Skip_Line; 
      
      Put("Mata in ett tecken: ");
      Get(Add_Character);
      Skip_Line;
      
      Digit_Int := character'Pos(Add_Character) - character'Pos('0');
      Sum_Result := Float'Rounding(Float'Value(Add_String) +  Float(Digit_Int));
   end Addisions_And_Get;
   
   -------------deluppgift 2------------------------------------------------
   function Circle_Area (Radie : in Character) return Integer is 
      
      Radie_Float : Float;
   begin 
      
      Radie_Float := Float ( character'Pos(Radie) - character'Pos('0'));
      return Integer(Float'Rounding(Radie_Float * Radie_Float * 3.14));
   end Circle_Area; 
   
   
   -------------deluppgift 3------------------------------------------------
   function "-" (LHV : in String;
		 RHV : in Integer) return Integer is 
      
   begin
      
      return Integer(Float'Ceiling(Float'Value(LHV) - Float(RHV)));
   end"-";
   
   -------------------------------------------------------------------------
   Add_String    : String(1..3);
   Add_Character : Character;
   Sum_Result    : Float;
   
   Radie_Char : Character;
   
   String_Subtract  : String(1..3);
   Integer_Subtract : Integer; 
begin
   
   -------------deluppgift 1------------------------------------------------
   Addisions_And_Get(Add_String, Add_Character, Sum_Result);
     
   Put("Du matade in strängen: ");
   Put(Add_String);
   Put(" och tecknet: ");
   Put(Add_Character);
   Put(" och summan blev");
   Put(Sum_Result, Fore => 3, Aft => 5, Exp =>3);
   New_Line(2);
   
   -------------deluppgift 2------------------------------------------------
   Put("Mata in längden: ");
   Get(Radie_Char);
   Skip_Line;
   
   put("Den beräknade arean blev: ");
   Put(Circle_Area(Radie_Char), Width => 0);
   New_Line(2);
   
   -------------deluppgift 3------------------------------------------------
   Put("Mata in en sträng: ");
   Get(String_Subtract);
   Skip_Line;
   
   Put("Mata in ett heltal: ");
   Get(Integer_Subtract);
   Skip_Line;
   
   Put("Den beräknade differensen mellan ");
   Put(String_Subtract);
   Put(" och ");
   Put(Integer_Subtract, Width => 0);
   Put(" blir ");
   Put(String_Subtract - Integer_Subtract, Width =>0);
end Ada_P2;
