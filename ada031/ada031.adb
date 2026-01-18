with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;     use Ada.Float_Text_IO;
with Ada.Text_IO;           use Ada.Text_IO;


procedure Ada031 is 
   
   --DS1 typer------------------
   type DS1_Type is 
     
      record
	 W : Character;
	 P : String(1..4);
      end record;
   
   --DS2 typer-----------------
   type Float_String_Type is
     
      record
	 S : Float;
	 Z : String(1..4);
      end record;
   
   
   type DS2_Type is 
     
      record 
	 D : Float_String_Type;
         U : Float_String_Type;
      end record;
   
   ---DS3 typer-----------------
   type Char_Record_Type is
     
      record
	 Y, Q : Character;
      end record;
   
   
   type Bool_Char_Record_Type is 
     
      record 
	 T : Boolean := True; 
	 L : Character; 
      end record;
   
   
   type DS3_Type is
     
      record 
	 J : Char_Record_Type;
	 B : Char_Record_Type;
	 O : Bool_Char_Record_Type;
      end record;
   
   -----DS1 underprogram------------
   procedure Get(Item : out DS1_Type) is
      
      C : Character;
   begin
      
      Get(Item.W);
      Get(C);
      Get(Item.P);
   end Get;
   
   -----DS2 underprogram------------
   procedure Get(Item : out DS2_Type) is
      
      C : Character;
   begin
      
      Get(Item.D.S);
      Get(C);
      Get(Item.D.Z);
      Get(C);
      
      Get(Item.U.S);
      Get(C);
      Get(Item.U.Z);
   end Get;
   
   -----DS3 underprogram------------
   procedure Get(Item : out Char_Record_Type) is
      
      C : Character;
   begin
      
      Get(Item.Y);
      Get(C);
      Get(Item.Q);
   end Get;
   
   
   procedure Get(Item : out DS3_Type) is
      
      C : Character;
   begin
      
      Get(Item.J);
      Get(C);
      
      Get(Item.B);  
      Get(C);
      
      Get(C);
      
      if C = 'T' then
	 Item.O.T := True;
      elsif C = 'F' then
	 Item.O.T := False;
      end if;

      Get(C);
      Get(Item.O.L);
   end Get;
   
   ----Put för Boolean--------------
   procedure Put(Item : in Boolean) is
      
   begin
      
      if Item then
	 Put("True"); 
      else
	 Put("False");
      end if;
   end Put;

   -----DS1------------------------
   procedure Put(Item : in DS1_Type) is
      
   begin
      
      Put(Item.W);
      Put(' ');
      Put(Item.P);
   end Put;
   
   -----DS2------------------------
   procedure Put(Item : in DS2_Type) is

   begin
      
      Put(Item.D.S, Fore => 0, Aft => 3, Exp =>0);
      Put(' ');
      Put(Item.D.Z);
      Put(' ');
      
      Put(Item.U.S, Fore => 0, Aft => 3, Exp =>0);
      Put(' ');
      Put(Item.U.Z);
   end Put;
   
   -----DS3------------------------
   procedure Put(Item : in Char_Record_Type) is
      
   begin
      
      Put(Item.Y);
      Put(' ');
      Put(Item.Q);
      
   end Put;
   
   procedure Put(Item : in DS3_Type) is
      
   begin
      
      --Char_Record_Typ
      Put(Item.J);
      Put(' ');
      Put(Item.B);
      Put(' ');
      
      --Bool_Char_Record_Type
      Put(Item.O.T);
      Put(' ');
      Put(Item.O.L);
   end Put;
   
   ----Deklarera
   DS1 : DS1_Type;
   DS2 : DS2_Type;
   DS3 : DS3_Type;

begin
   
   Put("För DS1:");
   New_Line;
   Put("Mata in datamängd: ");
   Get(DS1);
   Skip_Line;
   
   Put("Inmatad datamängd: ");
   Put(DS1);
   New_Line(2);
   
   Put("För DS2:");
   New_Line;
   Put("Mata in datamängd: ");
   Get(DS2);
   Skip_Line;
   
   Put("Inmatad datamängd: ");
   Put(DS2);
   New_Line(2);
   
   Put("För DS3:");
   New_Line;
   Put("Mata in datamängd: ");
   Get(DS3);
   Skip_Line;
   
   Put("Inmatad datamängd: ");
   Put(DS3);
end Ada031;
