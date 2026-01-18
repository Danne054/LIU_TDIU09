
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;     use Ada.Float_Text_IO;
with Ada.Text_IO;           use Ada.Text_IO;

procedure Ada_P30 is
   
   --subtyper--
   subtype Inner_Array_Range is 
     Integer range -72..-71;
   
   subtype Outher_Array_Range_1 is
     Character range '5'..'6';
   
   subtype Outher_Array_Range_2 is
     Character range 'H'..'I';

   --typer--
   type Record_Type is
      record
	 U : Float;
	 R : Character;
      end record;
   
   type Inner_Array_Type is 
     array (Inner_Array_Range) of Record_Type;
   
   type Oter_Array_Type is
     array (Outher_Array_Range_1, Outher_Array_range_2) of Inner_Array_Type;
   
   --get--
   procedure Get(Item : out Record_Type) is 
      
      Empty : Character;
   begin 
      
      Get(Item.U);
      Get(Empty);
      Get(Item.R);
   end Get;
   
   procedure Get(Item : out Inner_Array_Type) is
      
      Empty : Character;
   begin
      
      for I in Item'Range loop
	 Get(Item(I));
	 
	 if I /= Item'Last then
	    Get(Empty);
	 end if;
	 
      end loop;
   end Get;
   
   procedure Get(Item : out Oter_Array_Type) is
      
      Empty : Character;
   begin
      
      for X in reverse Item'Range(1) loop
	 for Y in reverse Item'Range(2) loop
	    Get(Item(X, Y));
	    
	    if not (X = Item'First(1) and Y = Item'First(2)) then
	       Get(Empty);
	    end if;
	    
	 end loop;
      end loop;
   end Get;
   
   
   --put--
   procedure Put(Item : in Record_Type) is 
      
   begin 
      
      Put(Item.U, Fore => 0, Aft => 2, Exp =>0);
      Put('_');
      Put(Item.R);
   end Put;
   
   procedure Put(Item : in Inner_Array_Type) is
      
   begin
      
      for I in reverse Item'Range loop
	 Put(Item(I));
	 
	 if I /= Item'First then
	    Put('_');
	 end if;
	 
      end loop;
   end Put;
   
   procedure Put(Item : in Oter_Array_Type) is
      
   begin
      
      for X in Item'Range(1) loop
	 for Y in Item'Range(2) loop
	    Put(Item(X, Y));
	    
	    if not (X = Item'Last(1) and Y = Item'Last(2)) then
	       Put('*');
	    end if;
	    
	 end loop;
      end loop;
   end Put;
   
   --declarera--
   T : Oter_Array_Type;
   
begin
    
   Put("Mata in datamängd: ");
   Get(T);
   Skip_Line;
   
   Put("Inmatad datamängd: ");
   Put(T);
end Ada_P30;
