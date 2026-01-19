
with Ada.Text_IO;              use Ada.Text_IO;
with Ada.Integer_Text_IO;      use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;           use Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;
with Ada.Numerics; use Ada.Numerics;

procedure Trig_Fakultet_Reknare is

   -- Menu_Selection: skriver ut meny och returnerar giltigt menyval
   
   procedure Menu_Selection(Selection : out Integer) is
   
   begin
      Put_Line("=== HUVUDMENY ===");
         Put_Line("1. Beräkna hypotenusa");
         Put_Line("2. Beräkna triangelvinklar");
         Put_Line("3. Beräkna N-fakultet");
         Put_Line("4. Avsluta programmet");
	 
         -- Loop för att läsa in giltigt val
         loop
         Put("Val: ");
         Get(Selection);
         Skip_Line;

         if Selection in 1 .. 4 then
            exit; 
	    
         else
	 
            Put_Line("Felaktigt val!");
	    
         end if;
	 
         end loop;
    
   end Menu_Selection;

   -- Calculate_Hypothenuse: beräknar hypotenusan av två kateter
   
   function Calculate_Hypothenuse(A, B : Integer) return Float is
   
   begin
   
      return Sqrt(Float(A * A + B * B));
   
   end Calculate_Hypothenuse;

   -- Hypothenuse_Program: hanterar menyval 1
   
   procedure Hypothenuse_Program is
   
      A, B : Integer;
      H    : Float;
      
   begin
   
      Put("Mata in kateternas längder: ");
      Get(A);
      Get(B);
      Skip_Line;
      
      H := Calculate_Hypothenuse(A, B);
      Put("Hypotenusan är ");
      Put(H, Fore => 1, Aft => 2, Exp => 0);
      New_Line(2);
      
   end Hypothenuse_Program;

   -- Calculate_Angles: beräknar triangelns vinklar
   
   procedure Calculate_Angles(Hc, Sa : Float; Va, Vb, Vc : out Float) is
   
   begin
   
      Va := (180.0 / Pi) * Arcsin(Sa / Hc);
      Vb := 90.0 - Va;
      Vc := 90.0;
      
   end Calculate_Angles;

   -- Angle_Program: hanterar menyval 2
   
   procedure Angle_Program is
   
      Hc, Sa : Float;
      Va, Vb, Vc : Float;
      
   begin
   
      Put("Mata in hypotenusans längd: ");
      Get(Hc);
      Skip_Line;
      Put("Mata in vertikala katetens längd: ");
      Get(Sa);
      Skip_Line;
      Calculate_Angles(Hc, Sa, Va, Vb, Vc);
      Put("Va: "); Put(Va, Fore => 1, Aft => 1, Exp => 0); Put_Line(" grader");
      Put("Vb: "); Put(Vb, Fore => 1, Aft => 1, Exp => 0); Put_Line(" grader");
      Put("Vc: "); Put(Vc, Fore => 1, Aft => 1, Exp => 0); Put_Line(" grader");
      
      New_line(1);
      
   end Angle_Program;

   -- Calculate_Factorial: beräknar fakultet
   
   function Calculate_Factorial(N : Integer) return Integer is
   
      Result : Integer := 1;
      
   begin
   
      for I in 2 .. N loop
         Result := Result * I;
      end loop;
      return Result;
      
   end Calculate_Factorial;

   -- Factorial_Program: hanterar menyval 3
   
   procedure Factorial_Program is
   
      N : Integer;
      
   begin
      Put("Mata in N: ");
      Get(N);
      Skip_Line;
      Put(N, Width => 0);
      Put("-fakultet = ");
      Put(Calculate_Factorial(N), Width => 0);
      
      New_Line(2);
      
   end Factorial_Program;
   
  Choice : Integer;

begin

   Put_Line("Välkommen till miniräknaren!");
   
   loop
      Menu_Selection(Choice);

      if Choice = 1 then
         Hypothenuse_Program;

      elsif Choice = 2 then
         Angle_Program;

      elsif Choice = 3 then
         Factorial_Program;

      elsif Choice = 4 then
         Put_Line("Ha en bra dag!");
         exit;

      else
         Put_Line("Felaktigt val!");
      end if;
   end loop;
end Trig_Fakultet_Reknare;
