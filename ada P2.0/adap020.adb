with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;     use Ada.Float_Text_IO;
with Ada.Text_IO;           use Ada.Text_IO;

procedure adap020 is 
----------------------------------------------------
   function "*" (LHV: in Character;
		   RHV: in String) return Integer is 
   begin
      return (Character'Pos(LHV) - Character'Pos('0')) * Integer'Value(RHV);

   end "*";
   
------------------------------------------------------------------
   procedure Get_And_Divide(F1 : out Float;
		   F2 : out Float;
		   FR : out FLoat) is
      

      
   begin
      
      Put("Mata in ett flyttal: ");
      Get(F1);
      Skip_Line;
      
      Put("Mata in ett flyttal: ");
      Get(F2);
      Skip_Line;
      
      FR := Float'Rounding(F1 / F2);
   end Get_And_Divide;
   ------------------------------------------------------
   

   function Mean (FloatMean1: in Float;
		  FLoatMean2: in Float;
		  FloatMean3: in Float) return Integer is 
      
   begin
      
      
      return Integer( (FLoatMean1 + FLoatMean2 + FLoatMean3)/3.0 ) ;
   end Mean;
   ------------------------------------------------------
   
   Tecken : Character;
   TreTecken : String(1..3);
   
   F1 : Float;
   F2 : Float;
   FR : Float;
   
   FloatMean1 : Float;
   FLoatMean2 : Float;
   FLoatMean3 : Float;
 
begin
   Put("Mata in ett tecken: ");
   Get(Tecken);
   Skip_Line;
   Put("Mata in en sträng: ");
   Get(TreTecken);
   Skip_Line;
   
   
  -- Put(Character'Pos(Tecken)-48);
  -- Put(Integer'Value(TreTecken));
   
   Put("Den beräknade produkten Av ");
   Put((Character'Pos(Tecken)) - (Character'Pos('0')) , Width => 0);
   Put(" och ");
   Put(Integer'Value(TreTecken) , Width => 0);
   Put(" blir ");
   Put("*"(Tecken, TreTecken) , Width => 0);
   New_Line(2);
   
   Get_And_Divide(F1, F2, FR);
   
   Put("Du matade in flyttalet:");
   Put(F1, Fore => 4, Aft => 0, Exp =>0);
   Put(" och flyttalet:");
   Put(F2, Fore => 4, Aft => 0, Exp =>0);
   Put(" och kvoten blev");
   Put(FR, Fore => 3, Aft => 5, Exp =>3);
   New_Line(2);
   
   Put("Mata in tre flyttal: ");
   Get(FloatMean1);
   Get(FLoatMean2);
   Get(FLoatMean3);
   Skip_Line;
   
   Put("Medelvärdet av dessa är: ");
   Put(Mean(FloatMean1, FLoatMean2, FLoatMean3), Width => 0);
   
end adap020;
